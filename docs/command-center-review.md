# Command Center Blueprint — Review & Implementation Plan

> Review of `docs/command-center-blueprint.md` (2252 lines)

---

## Overview

The blueprint specifies two deliverables sharing a single JSON file (`project-tracker.json`) as source of truth:

1. **MCP Server** (`command-center-mcp/`) — Globally-installed Node.js package exposing 24 tools over stdio + CLI
2. **Electron Desktop App** (`command-center/`) — Cross-platform dashboard with 4 tabs: Swim Lane, Task Board, Agent Hub, Calendar

### Architecture

```
Operator ────── Electron Desktop App
                     │ fs.watch + IPC
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
| Desktop App | Electron + electron-vite |
| UI | React 19 + Zustand + Tailwind CSS v4 |
| Drag & Drop | @dnd-kit/core + @dnd-kit/sortable |
| Fonts | Inter (UI) + JetBrains Mono (code) |
| MCP Server | Node.js + @modelcontextprotocol/sdk |
| Language | TypeScript (strict, ES modules) |

---

## Blueprint Quality Assessment

### Strengths

- **Single source of truth** — Clean architecture; both MCP server and Electron app read/write the same JSON file
- **Phase ordering** is logical and each phase has a clear checkpoint
- **24 MCP tools** are specified with exact parameters, handlers, side effects, and error patterns
- **Each view** has ASCII wireframes, component hierarchy, props, and interaction specs
- **Write-back debounce** pattern prevents infinite loops between Electron and file watcher
- **Task lifecycle state machine** is well-defined with clear transitions and agent dispatch points
- **Agent role templates** (Explorer, Researcher, Post-Build Auditor) have clear responsibilities

### Concerns & Risks

| Area | Concern | Severity | Mitigation |
|------|---------|----------|------------|
| **Electron 41** | Latest stable is ~33-35. `electron@41` may not exist | Medium | Use latest stable (e.g., `^33.0.0`) |
| **electron-vite 5** | Latest is ~2.x. Version may not exist | Medium | Use `^2.0.0` or latest available |
| **Zustand 5** | Currently at 4.x stable. API differences possible | Low | Use `^4.0.0`, check API on install |
| **@dnd-kit versions** | Blueprint says `sortable@8`, current is `@7` | Low | Use latest available versions |
| **Tailwind v4** | CSS-first config (`@theme` directive) is new approach | Low | Blueprint's CSS structure is correct for v4 |
| **MCP SDK version** | `^1.12.1` specified — verify on npm | None | Check npm for current version |
| **No tests specified** | Blueprint has no test infrastructure for MCP or Electron | Medium | Add unit tests for tracker utilities, integration tests for tools |
| **Global install** | MCP server is "globally installed" — may need permissions | Low | Document `npm link` or `-g` install step |
| **Path resolution** | `PROJECT_ROOT` env var + `.env` fallback — cross-platform path issues possible | Low | Use `path.resolve()` consistently |

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

**Complexity:** High — 24 tools with full logic, context builders, auto-unblock cascading, drift calculation

**Checkpoint:** `command-center get-project-status` returns empty project status. `command-center create-milestone test "Test"` creates a milestone in the tracker.

---

### Batch 2 — Desktop Shell (Phase 3)

**Files:** ~7 files in `command-center/`

| File | Purpose |
|------|---------|
| `command-center/package.json` | Dependencies (Electron, React, etc.) |
| `command-center/electron.vite.config.ts` | Build config for main/preload/renderer |
| `command-center/tsconfig.json` | TypeScript config |
| `command-center/postcss.config.mjs` | PostCSS for Tailwind |
| `command-center/src/main/index.ts` | Electron main process + file watcher |
| `command-center/src/main/config.ts` | PROJECT_ROOT resolution |
| `command-center/src/preload/index.ts` | Context isolation bridge (4 IPC channels) |
| `command-center/src/renderer/index.html` | HTML entry |
| `command-center/src/renderer/main.tsx` | React entry |
| `command-center/src/renderer/env.d.ts` | Window type augmentation |

**Complexity:** Medium — standard Electron + electron-vite setup

**Checkpoint:** `npm run dev` launches Electron window with loading state, reads tracker file.

---

### Batch 3 — Store & Navigation (Phase 4)

**Files:** ~5 files in `command-center/src/renderer/`

| File | Purpose |
|------|---------|
| `store.ts` | Zustand store with write-back debounce |
| `App.tsx` | Root layout (title bar + tabs + status bar + views) |
| `styles.css` | Tailwind + theme CSS variables |
| Components for TabBar + StatusBar | Navigation + project metadata display |

**Key features:**
- 5 derived selectors (`selectCurrentWeek`, `selectScheduleStatus`, etc.)
- Write-back debounce (500ms) with external change suppression
- Theme persistence via localStorage
- File watcher → store sync

**Complexity:** Medium

**Checkpoint:** Tab switching works. StatusBar shows project metadata. Theme toggle works. Store syncs with file changes.

---

### Batch 4 — Views (Phases 5-8)

This is the largest batch — approximately 20+ component files.

#### Phase 5: Swim Lane View

**Complexity:** Very High

- SVG-based timeline with week grid, phase bands, NOW marker
- Milestone nodes with progress arcs (SVG circles)
- Drift visualization (ghost nodes, connecting bars)
- Detail panel slide-out with schedule editing
- Auto-scroll to NOW marker on load

Key components: `SwimLaneView`, `WeekGrid`, `MilestoneNode`, `DriftVisualization`, `DetailPanel`, `MajorMilestoneMarker`

#### Phase 6: Task Board View

**Complexity:** High

- 5-column Kanban (todo, in_progress, review, done, blocked)
- Drag-and-drop with @dnd-kit (PointerSensor + KeyboardSensor)
- Milestone carousel (ContextBar with prev/next navigation)
- Filter bar (All, My Tasks, Agent Tasks, Blocked)
- Task detail modal with tabs (Details + History)

Key components: `TaskBoardView`, `ContextBar`, `FilterBar`, `KanbanColumn`, `TaskCard`, `TaskDetailModal`

#### Phase 7: Agent Hub View

**Complexity:** Medium-High

- 4 left panels: Connected Agents, Shared State, Context Injection, Today's Summary
- Activity feed with filtering, search, pagination (30 entries)
- Agent performance stats (weekly breakdown)
- Agent active status (30-minute window)

Key components: `AgentHubView`, `ConnectedAgents`, `SharedStatePanel`, `ContextInjection`, `ActivityFeed`, `AgentPerformanceStats`

#### Phase 8: Calendar View

**Complexity:** Medium

- 7-column week grid (Mon-Sun)
- Only shows completed tasks (filtered by `completed_at`)
- Week navigation (prev/next/today)
- Task chips with domain coloring

Key components: `CalendarView`, `WeekGrid`, `DayColumn`, `TaskChip`, `CalendarNavigation`

---

### Batch 5 — Polish & Documentation (Phases 9-10)

**Files:** ~5 files

| File | Purpose |
|------|---------|
| CSS updates to `styles.css` | Full design system (colors, scrollbar, typography) |
| `docs/workflow.md` | Task lifecycle state machine documentation |
| Agent role files | Explorer, Researcher, Post-Build Auditor definitions |
| `.mcp.json` | MCP server configuration |

**Complexity:** Low — mostly documentation and CSS refinement

---

## Effort Estimate

| Batch | Files | Key Risk | Estimated LOC |
|-------|-------|----------|--------------|
| Batch 1 (MCP Server) | ~7 | 24 tools with full logic | ~1,500 |
| Batch 2 (Electron Shell) | ~10 | electron-vite config | ~400 |
| Batch 3 (Store/Tabs) | ~5 | Write-back debounce edge cases | ~500 |
| Batch 4 (4 Views) | ~20+ | Swim Lane SVG rendering | ~3,000 |
| Batch 5 (Polish) | ~5 | None | ~300 |
| **Total** | **~40+** | | **~5,700** |

---

## Recommended Build Order

1. **Start with Batch 1** — The MCP server is the backbone. Everything else depends on the tracker schema and tool logic being correct.
2. **Then Batch 2 + 3** — Electron shell and store can be done together since they're tightly coupled.
3. **Then Batch 4 views** — These can potentially be parallelized (each view is independent). Start with Task Board (most standard UI pattern), then Swim Lane (most complex), then Agent Hub, then Calendar.
4. **Finish with Batch 5** — Design system refinement and documentation.

---

## Open Questions

1. **Where should the two projects live?** The blueprint suggests `command-center-mcp/` and `command-center/` at the project root. Should they be subdirectories of this Flutter project, or separate repositories?
2. **Who is the "operator"?** The blueprint references an operator name for task assignment. Should this be configurable?
3. **Node.js version?** The blueprint uses ES2022 features. Node.js 18+ is required.
4. **Testing strategy?** The blueprint has no test infrastructure. Should we add Jest/Vitest for the MCP server utilities?

---

## Conclusion

The blueprint is thorough and well-structured with clear phase boundaries and checkpoints. The main risks are version mismatches (Electron 41, electron-vite 5, Zustand 5) and the complexity of the Swim Lane SVG rendering. The MCP server (Phase 2) is the most code-dense piece and should be built first to establish a solid foundation.
