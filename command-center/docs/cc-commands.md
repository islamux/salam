# Command Center CLI Reference

All commands must be run from the **project root directory**. Do not run them from `/web`.

---

## Quick Reference

| Command | Description |
| :--- | :--- |
| `pnpm cc` | Launch interactive terminal dashboard |
| `pnpm cc:watch` | Start Command Center desktop dev server |
| `pnpm cc:mcp` | Start MCP server (AI access to tracker) |
| `pnpm cc:status` | Project status overview |
| `pnpm cc:list` | List and filter tasks |
| `pnpm cc:agents` | List registered agents |
| `pnpm cc:activity` | Recent activity feed |
| `pnpm cc:task <id>` | Full context for a task |
| `pnpm cc:mstone <id>` | Milestone overview with progress |
| `pnpm cc:start <id> [--agent_id]` | Start a task |
| `pnpm cc:complete <id> <summary>` | Mark task ready for review |
| `pnpm cc:approve <id> [feedback]` | Approve and mark done |
| `pnpm cc:reject <id> <feedback>` | Reject, send back to in_progress |
| `pnpm cc:reset <id>` | Reset task to todo |
| `pnpm cc:block <id> <reason>` | Block a task |
| `pnpm cc:unblock <id> [--resolution]` | Unblock a task |
| `pnpm cc:activate <milestone_id>` | Move milestone from backlog to active |
| `pnpm cc:complete-milestone <milestone_id>` | Move active milestone to completed |
| `pnpm cc:register-agent <id> <name> <type>` | Register or update an agent |
| `pnpm web:dev` | Start Next.js dev server |
| `pnpm web:build` | Build Next.js for production |

---

## Core Commands

### `pnpm cc`
Launch the interactive terminal dashboard.
```
pnpm cc
```
Launches `cc-dash.py` — view Active Milestones, Backlog, and Swim Lane in the terminal.

### `pnpm cc:watch`
Start the Command Center desktop app in development watch mode.
```
pnpm cc:watch
```

### `pnpm cc:mcp`
Start the MCP server, exposing project-tracker data for programmatic AI access.
```
pnpm cc:mcp
```

### `pnpm cc:update`
Sync the tracker with latest changes.
```
pnpm cc:update
```

### `pnpm cc:log`
Show the project activity log.
```
pnpm cc:log
```

---

## Information Commands

### `pnpm cc:status`
Get a high-level project status overview — current week, overall progress, schedule drift.
```
pnpm cc:status
```

### `pnpm cc:list`
List tasks with optional filters.
```
pnpm cc:list
pnpm cc:list --milestone_id feat_search
pnpm cc:list --status todo
pnpm cc:list --domain features
```

### `pnpm cc:agents`
List all registered AI agents and their roles.
```
pnpm cc:agents
```

### `pnpm cc:activity`
View recent activity feed. Optionally filter by agent or limit results.
```
pnpm cc:activity
pnpm cc:activity --agent_id nextjs-specialist
pnpm cc:activity --limit 5
```

### `pnpm cc:task <id>`
Get full context for a specific task — description, status, milestone, dependencies. Output is ~8K tokens.
```
pnpm cc:task feat_search_001
pnpm cc:task content_ocr_fix_005
```

### `pnpm cc:mstone <id>`
Get milestone overview with progress bars for each subtask.
```
pnpm cc:mstone feat_search
pnpm cc:mstone content_ocr_fix
```

---

## Task Lifecycle Commands

### `pnpm cc:start <task_id> [--agent_id]`
Start a task — sets status to `in_progress` and optionally assigns an agent.
```
pnpm cc:start feat_search_001
pnpm cc:start feat_search_001 --agent_id nextjs-specialist
```

### `pnpm cc:complete <task_id> <summary>`
Mark a task as ready for review. Provide a brief summary of what was done.
```
pnpm cc:complete feat_search_001 "Implemented FlexSearch full-text search"
```

### `pnpm cc:approve <task_id> [feedback]`
Approve a completed task — marks it as `done`. Optional feedback.
```
pnpm cc:approve feat_search_001
pnpm cc:approve feat_search_001 "Works well, good RTL support"
```

### `pnpm cc:reject <task_id> <feedback>`
Reject a completed task — sends it back to `in_progress`. Feedback is required.
```
pnpm cc:reject feat_search_001 "Search results not showing on mobile"
```

### `pnpm cc:reset <task_id>`
Reset a task back to `todo` status.
```
pnpm cc:reset feat_search_001
```

### `pnpm cc:block <task_id> <reason>`
Block a task with an explanation.
```
pnpm cc:block feat_search_001 "Waiting for FlexSearch API changes"
```

### `pnpm cc:unblock <task_id> [--resolution]`
Unblock a previously blocked task.
```
pnpm cc:unblock feat_search_001
pnpm cc:unblock feat_search_001 --resolution "FlexSearch API updated"
```

---

## Milestone Lifecycle Commands

### `pnpm cc:activate <milestone_id>`
Move a milestone from backlog to active, updating the dashboard focus.
```
pnpm cc:activate infra_structure_cleanup
pnpm cc:activate feat_auth_backend
```

### `pnpm cc:complete-milestone <milestone_id>`
Move an active milestone to completed. All subtasks should be done before running.
```
pnpm cc:complete-milestone infra_structure_cleanup
```

---

## Agent Management

### `pnpm cc:register-agent <id> <name> <type> [--color] [--parent_id] [--permissions]`
Register a new agent or update an existing one.
```
pnpm cc:register-agent orchestrator Orchestrator orchestrator --color "#FF6B6B"
pnpm cc:register-agent my-agent "My Agent" custom --parent_id orchestrator
```

---

## Utility Commands

### `pnpm web:dev`
Start the Next.js development server for the main web application.
```
pnpm web:dev
```

### `pnpm web:build`
Build the main web application for production.
```
pnpm web:build
```

---

## Notes

- All `pnpm cc:*` commands automatically set `PROJECT_ROOT` to the project root. Run them from the root directory — **not** from `/web`.
- `pnpm web:dev` and `pnpm web:build` are Next.js commands aliased in the root `package.json` for convenience.
