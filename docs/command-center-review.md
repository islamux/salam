# Command Center Blueprint — Review & Implementation Plan

> Review of `docs/command-center-blueprint.md` (2252 lines)

---

## Overview

The blueprint specifies two deliverables sharing a single JSON file (`project-tracker.json`) as source of truth:

1. **MCP Server** (`command-center-mcp/`) — Globally-installed Node.js package exposing 24 tools over stdio + CLI
2. **TUI Dashboard** (`command-center-tui/`) — Terminal-based dashboard with 4 tabs: Swim Lane, Task Board, Agent Hub, Calendar

**Note:** Single-operator setup — no team collaboration features. Operator name is configured once. Task assignment targets AI agents only (gemini-cli, opencode, etc.), not humans.

### Architecture

```
Operator ────── TUI Dashboard (terminal)
                      │ fs.watch
             project-tracker.json (SSOT)
                      │ readTracker / writeTracker
                MCP Server (stdio)
                      │ MCP protocol
            ┌─────────┴──────────┐
        Claude Code            Codex
```

### Stack

| Layer | Technology |
|-------|-----------|
| TUI Framework | blessed + blessed-contrib |
| UI Layout | blessed grid system (no browser DOM) |
| Interactive Widgets | blessed-contrib (tables, bars, gauges, sparkline) |
| Colors & Styling | ANSI 256-color + truecolor (terminal-native) |
| MCP Server | Node.js + @modelcontextprotocol/sdk |
| Language | TypeScript (strict, ES modules) |

---

## Blueprint Quality Assessment

### Strengths

- **Single source of truth** — Clean architecture; both MCP server and TUI dashboard read/write the same JSON file
- **Phase ordering** is logical and each phase has a clear checkpoint
- **24 MCP tools** are specified with exact parameters, handlers, side effects, and error patterns
- **Task lifecycle state machine** is well-defined with clear transitions and agent dispatch points
- **Agent role templates** (Explorer, Researcher, Post-Build Auditor) have clear responsibilities
- **TUI over Electron** — Zero browser overhead, instant startup, runs in any terminal, no GUI dependencies

### Concerns & Risks

| Area | Concern | Severity | Mitigation |
|------|---------|----------|------------|
| **blessed maintenance** | Core `blessed` is stable but low-activity; `blessed-contrib` similar | Low | Fork-friendly MIT license; stable API |
| **Terminal compatibility** | Truecolor/256-color support varies by terminal | Low | Graceful fallback to 16-color; detect with `supports-color` |
| **MCP SDK version** | `^1.12.1` specified — verify on pnpm/npm | None | Check pnpm/npm for current version |
| **Global install** | MCP server is "globally installed" — may need permissions | Low | Document `pnpm link` or `-g` install step |
| **Path resolution** | `PROJECT_ROOT` env var + `.env` fallback — cross-platform path issues possible | Low | Use `path.resolve()` consistently |
| **TUI interaction limits** | No mouse drag-and-drop in terminal; keyboard-driven workflow required | Medium | Design keyboard-first UX; use arrow keys / shortcuts for all interactions |
| **No schema versioning** | `project-tracker.json` has no version field; schema changes break existing data | High | Add `schemaVersion` field; write migrator functions for each version bump |
| **No input validation** | AI agents write to tracker via MCP tools; one bad write corrupts the SSOT | High | Validate every write against schema; reject malformed data; use Zod or hand-rolled validators |
| **No backup/undo** | An AI agent can accidentally wipe or corrupt the tracker with no recovery path | High | Auto-backup tracker before every write (keep last N copies); implement undo log for last 50 mutations |
| **No error logging** | MCP server and TUI have no logging; debugging silent failures is impossible | Medium | Add structured logging to `~/.command-center/logs/` with rotation (7-day retention) |

---

## Implementation Plan

### Batch 1 — Foundation (Phases 1-2)

**Files:** ~5 files in `command-center-mcp/`

| File | Purpose |
|------|---------|
| `command-center-mcp/package.json` | Project config, dependencies |
| `command-center-mcp/tsconfig.json` | TypeScript strict config |
| `command-center-mcp/src/tracker.ts` | Types + read/write/find utilities |
| `command-center-mcp/src/context.ts` | Markdown context builders (4 functions) |
| `command-center-mcp/src/tools.ts` | 24 tool definitions + handlers |
| `command-center-mcp/src/index.ts` | MCP server entry (stdio transport) |
| `command-center-mcp/src/cli.ts` | CLI interface routing |

Also creates `project-tracker.json` at project root with empty schema.

**Key patterns to include from day one:**
- `schemaVersion: 1` field in tracker JSON — all reads check version first, migrate if needed
- Zod schemas for every tool input — reject invalid data before it touches the tracker
- Auto-backup: copy tracker to `.command-center/backups/` before every write (keep last 20)
- Undo log: append-only `.command-center/undo-log.jsonl` — stores `{timestamp, tool, before, after}` for last 50 mutations
- Structured logging: `.command-center/logs/` with daily rotation

**Complexity:** High — 24 tools with full logic, context builders, auto-unblock cascading, drift calculation, input validation, backup/undo

**Checkpoint:** `command-center get-project-status` returns empty project status. `command-center create-milestone test "Test"` creates a milestone in the tracker.

---

### Batch 2 — TUI Shell (Phase 3)

**Files:** ~5 files in `command-center-tui/`

| File | Purpose |
|------|---------|
| `command-center-tui/package.json` | Dependencies (blessed, blessed-contrib, etc.) |
| `command-center-tui/tsconfig.json` | TypeScript config |
| `command-center-tui/src/index.ts` | TUI entry point + blessed screen + file watcher |
| `command-center-tui/src/store.ts` | In-memory state + read/write tracker with debounce |
| `command-center-tui/src/theme.ts` | Color scheme + widget style definitions |

**Key features:**
- blessed screen with full terminal layout
- File watcher (fs.watch) → store sync
- Write-back debounce (500ms) with external change suppression
- Keyboard shortcuts for all navigation (Tab switching, quit, etc.)

**Complexity:** Low — blessed setup is straightforward, no build step required

**Checkpoint:** `pnpm run dev` launches TUI dashboard in terminal with empty state, reads tracker file.

---

### Batch 3 — Navigation & Layout (Phase 4)

**Files:** ~3 files in `command-center-tui/src/`

| File | Purpose |
|------|---------|
| `dashboard.ts` | Root layout (tab bar + status bar + view area) |
| `components/tab-bar.ts` | Keyboard-driven tab switcher |
| `components/status-bar.ts` | Project metadata footer |

**Key features:**
- 4-tab navigation via number keys (1-4) or arrow keys
- Status bar showing project name, current week, task count
- Derived selectors (`selectCurrentWeek`, `selectScheduleStatus`, etc.)
- Theme toggle (light/dark via terminal color inversion)

**Complexity:** Low

**Checkpoint:** Tab switching works. StatusBar shows project metadata. Theme toggle works. Store syncs with file changes.

---

### Batch 4 — Views (Phases 5-8)

This is the largest batch — approximately 15+ component files.

#### Phase 5: Swim Lane View

**Complexity:** High

- ASCII/Unicode timeline with week grid, phase bands, NOW marker (vertical line)
- Milestone markers with progress bars (Unicode block characters)
- Drift visualization (offset markers with distance indicators)
- Detail panel (blessed box) toggled on milestone selection
- Auto-scroll to NOW marker on load

Key components: `SwimLaneView`, `WeekGrid`, `MilestoneNode`, `DriftVisualization`, `DetailPanel`

#### Phase 6: Task Board View

**Complexity:** High

- 5-column Kanban (todo, in_progress, review, done, blocked) — blessed-contrib table/grid
- Keyboard navigation (arrow keys to move between cards, Enter to select)
- Milestone carousel (ContextBar with prev/next via `[` `]` keys)
- Filter bar (toggle filters via number keys: All, Agent Tasks, Blocked)
- Task detail modal (blessed modal overlay with tab switching)

Key components: `TaskBoardView`, `ContextBar`, `FilterBar`, `KanbanColumn`, `TaskCard`, `TaskDetailModal`

#### Phase 7: Agent Hub View

**Complexity:** Medium

- Left panel: Connected Agents list (blessed list widget)
- Shared State panel, Context Injection panel, Today's Summary panel
- Activity feed (blessed log widget with filtering, search, pagination)
- Agent performance stats (blessed-contrib bar chart — weekly breakdown)
- Agent active status (30-minute window indicator)

Key components: `AgentHubView`, `ConnectedAgents`, `SharedStatePanel`, `ContextInjection`, `ActivityFeed`, `AgentPerformanceStats`

#### Phase 8: Calendar View

**Complexity:** Low-Medium

- 7-column week grid (Mon-Sun) using blessed grid
- Only shows completed tasks (filtered by `completed_at`)
- Week navigation (prev/next via `h` `l` keys, `t` for today)
- Task entries with domain-colored labels (ANSI colors)

Key components: `CalendarView`, `WeekGrid`, `DayColumn`, `CalendarNavigation`

---

### Batch 5 — Polish & Documentation (Phases 9-10)

**Files:** ~5 files

| File | Purpose |
|------|---------|
| Theme updates to `theme.ts` | Full color palette (ANSI 256-color mapping) |
| `docs/workflow.md` | Task lifecycle state machine documentation |
| Agent role files | Explorer, Researcher, Post-Build Auditor definitions |
| `.mcp.json` | MCP server configuration |
| `command-center-tui/README.md` | Keyboard shortcuts reference |

**Complexity:** Low — mostly documentation and theme refinement

---

## Effort Estimate

| Batch | Files | Key Risk | Estimated LOC |
|-------|-------|----------|--------------|
| Batch 1 (MCP Server) | ~7 | 24 tools with full logic | ~1,500 |
| Batch 2 (TUI Shell) | ~5 | blessed file watcher integration | ~300 |
| Batch 3 (Nav/Layout) | ~3 | Keyboard-driven navigation UX | ~250 |
| Batch 4 (4 Views) | ~15+ | Swim Lane ASCII timeline rendering | ~2,000 |
| Batch 5 (Polish) | ~5 | None | ~200 |
| **Total** | **~30+** | | **~4,250** |

---

## Recommended Build Order

1. **Start with Batch 1** — The MCP server is the backbone. Everything else depends on the tracker schema and tool logic being correct.
2. **Then Batch 2 + 3** — TUI shell and navigation can be done together since they're tightly coupled.
3. **Then Batch 4 views** — Build sequentially: Task Board first (most natural TUI pattern — tables/lists), then Calendar, then Agent Hub, then Swim Lane (most complex ASCII rendering).
4. **Finish with Batch 5** — Theme refinement and documentation.

---

## Decisions (Resolved)

| Decision | Choice | Rationale |
|----------|--------|-----------|
| **TUI Library** | `blessed` + `blessed-contrib` | Richer widget set (tables, bar charts, grids, logs) than Ink. Stable API, MIT license. |
| **Testing** | Vitest | Fast, native ESM/TypeScript support, zero config. Add to Batch 1. |
| **Node.js** | 18+ required | ES2022 features (top-level await, `.at()`, etc.) |
| **Validation** | Zod | Schema validation for all MCP tool inputs; generate types from same schemas |
| **Logging** | pino | Structured JSON logging, low overhead, built-in rotation via `pino-transport` |

---

## MVP Definition

**Minimum viable product** = Batch 1 + Batch 2 + Batch 3 + Phase 6 (Task Board) only.

This gives you:
- MCP server with all 24 tools
- TUI dashboard with task management
- Ability to create milestones, manage tasks, track progress via CLI/TUI

The other 3 views (Swim Lane, Agent Hub, Calendar) are enhancements that can be added incrementally. Ship MVP first, use it daily, then build the rest based on actual usage patterns.

---

## Conclusion

The blueprint is thorough and well-structured with clear phase boundaries and checkpoints. Replacing Electron with a TUI (blessed) dashboard eliminates all GUI version risks, removes ~1,450 LOC, drops 10+ config files, and produces a tool that starts instantly in any terminal. The MCP server (Phase 2) remains the most code-dense piece and should be built first to establish a solid foundation.
