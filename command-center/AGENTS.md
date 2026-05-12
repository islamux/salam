# Command Center — Agent Runbook & CLI Guide

> **All agents must follow the 5-phase protocol in [docs/ai-rules.md](docs/ai-rules.md)** — Think & Plan → Analyze Impact → Execute → Verify → Sync.

Welcome to the **Command Center**. This document is the single source of truth for AI agents and human developers. It defines the workspace architecture, the operational CLI commands, and the roles of registered AI agents.

---

## 🏗️ Workspace Architecture

```
project-root/
├── project-tracker.json     ← Data store (single source of truth)
├── AGENTS.md                ← This file — agent runbook
├── package.json             ← Orchestration scripts (pnpm cc:*)
├── docs/
│   ├── ai-rules.md          ← Universal AI protocols (5 phases)
│   └── cc-commands.md       ← Full CLI reference
├── scripts/
│   └── cc-dash.py           ← Terminal dashboard (Python + rich)
└── node_modules/
```

The Command Center discovers `project-tracker.json` by:
1. Checking `PROJECT_ROOT` env var, or
2. Walking up from `cwd` until it finds `project-tracker.json`

---

## 🛠️ CLI Commands (`pnpm cc`)

All commands must be run from the project root.

See [docs/cc-commands.md](docs/cc-commands.md) for full reference.

| Command | Description |
|---------|-------------|
| `pnpm cc:status` | Project status overview |
| `pnpm cc:list` | List and filter tasks |
| `pnpm cc:start <id>` | Start a task |
| `pnpm cc:complete <id>` | Mark task ready for review |
| `pnpm cc:approve <id>` | Approve and mark done |
| `pnpm cc:reject <id>` | Reject, send back |
| `pnpm cc:agents` | List registered agents |
| `pnpm cc:activate <id>` | Move milestone to active |
| `pnpm cc:mcp` | Start MCP server (stdio) |
| `pnpm ccui` | Launch TUI dashboard |

---

## 🤖 Registered Agent Personas

### 1. 🧠 Orchestrator (`orchestrator`)
- **Domain:** Project Management & Architecture.
- **Responsibilities:**
  - Maintains `project-tracker.json` — creates tasks, assigns priorities, logs history.
  - Transitions milestones between `backlog → active → completed`.
  - Delegates tasks to specialized agents; never modifies application code directly.
- **Completion Marker:** `log_action(task_id, "orchestration_complete", summary, agent_id: "orchestrator")`

### 2. 🕵️ Explorer (`explorer`)
- **Domain:** Codebase Navigation & Analysis.
- **Responsibilities:**
  - Maps directory structures, finds code dependencies, and identifies integration points.
  - Reads `PROJECT_MAP.md` for system architecture before investigation.
  - Applies **ai-rules.md Phase 2** (Impact Analysis) before changes.
- **Completion Marker:** `log_action(task_id, "exploration_complete", summary, agent_id: "explorer")`

### 3. 🔬 Researcher (`researcher`)
- **Domain:** R&D and Prototyping.
- **Responsibilities:**
  - Tests libraries, frameworks, and architectural patterns in isolation.
  - Looks up documentation and best practices.
  - Identifies edge cases and performance implications.
- **Completion Marker:** `log_action(task_id, "research_complete", summary, agent_id: "researcher")`

### 4. ⚛️ UI/Frontend Specialist (`frontend-specialist`)
- **Domain:** User Interface & Frontend Logic.
- **Responsibilities:**
  - Builds responsive UI components following project conventions.
  - Implements premium aesthetics and micro-animations.
  - Ensures accessibility and performance.

### 5. 🛡️ Post-Build Auditor (`post-build-auditor`)
- **Domain:** QA & Performance.
- **Responsibilities:**
  - Verifies build success, audits bundle sizes, linting, and accessibility.
  - Performs code review for security and conventions.
  - Applies **ai-rules.md Phase 4** (Verify) standards.
- **Completion Marker:** `log_action(task_id, "audit_complete", summary, agent_id: "post-build-auditor")`

---

## 📌 Standard Operating Procedure (SOP)

1. **Check the Tracker:** At start of session, verify `project-tracker.json` or run `pnpm cc:status`.
2. **Follow ai-rules.md:** Execute the task through all 5 phases sequentially.
3. **Log Progress:** After each action, append to `history_log` in the tracker.
4. **Sync State:** Update `PROJECT_MAP.md` if project structure or flow changed.

---

> **Tip:** To add a project-specific agent, edit this file and register the agent via `pnpm cc:register-agent <id> <name> <type>`.
