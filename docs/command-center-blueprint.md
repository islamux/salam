# Command Center Blueprint

> A complete build specification for an AI-agent-powered project command center.
> Feed this document to any capable coding agent (Claude Code, Codex, Cursor, etc.)
> and it will build the entire system across multiple phases.

---

## About This Document

### What This Builds

Two deliverables:

1. **MCP Server** — A globally-installed Node.js package exposing 24 tools over stdio. AI agents call these tools to read project state, manage tasks, dispatch sub-agents, and log activity. Also includes a CLI for shell access to the same tools.

2. **TUI Dashboard** — A terminal-based dashboard (using blessed + blessed-contrib) with 4 tabs: Swim Lane (strategic timeline), Task Board (tactical Kanban), Agent Hub (real-time agent monitoring), and Calendar (completion history). The dashboard watches a single JSON tracker file for changes and renders project state in real time.

Both deliverables share a single source of truth: `project-tracker.json`, a JSON file that lives at the root of the user's project. The MCP server reads/writes it via tool calls. The TUI dashboard watches it via `fs.watch` and renders it. External agents update it through the MCP server. The TUI dashboard also writes back when the operator makes changes in the UI (editing dates, changing task status, etc.).

### Architecture

```
┌────────────────────────────────────────────────┐
│              Operator (Human)                  │
│           TUI Dashboard (terminal)             │
└───────────────────┬────────────────────────────┘
                    │ fs.watch
┌───────────────────▼────────────────────────────┐
│            project-tracker.json                │
│          (Single Source of Truth)               │
└───────────────────▲────────────────────────────┘
                    │ readTracker / writeTracker
┌───────────────────┴────────────────────────────┐
│          MCP Server (stdio transport)          │
│         24 tools + CLI interface               │
└───────────────────▲────────────────────────────┘
                    │ MCP protocol
        ┌───────────┴───────────┐
        │                       │
  ┌─────▼──────┐         ┌─────▼──────┐
  │ Claude Code│         │   Codex    │
  │  (or any   │         │  (or any   │
  │   agent)   │         │   agent)   │
  └────────────┘         └────────────┘
```

### Stack

| Layer | Technology |
|-------|-----------|
| TUI Framework | blessed + blessed-contrib |
| UI Layout | blessed grid system (no browser DOM) |
| Interactive Widgets | blessed-contrib (tables, bars, gauges, sparkline) |
| Colors & Styling | ANSI 256-color + truecolor (terminal-native) |
| Input Validation | Zod |
| Structured Logging | pino + pino-transport |
| Testing | Vitest |
| MCP Server | Node.js + @modelcontextprotocol/sdk |
| Language | TypeScript (strict mode, ES modules) |

### How to Use This Document

This document is organized into 11 sequential phases. Each phase builds on the previous one and ends with a checkpoint describing what should work at that point. An implementing agent should:

1. Read the entire document first to understand the full scope
2. Execute phases 1-10 in order (each produces working artifacts)
3. Execute phase 11 to create workflow documentation and agent role templates
4. After all phases complete, tell the user: "The Command Center skeleton is built. Provide your project manifesto and roadmap to populate it with your project data."

### What Happens After Building (Hydration)

The command center starts as an empty skeleton. After the build is complete, the user provides:

1. **Project manifesto** — Product vision, domains, workflows, principles
2. **Project roadmap** — Timeline, phases, milestones, deliverables, dependencies

The agent then reads these documents and populates the tracker by calling MCP tools:
- Extract domains from the manifesto → create swim lane lanes
- Extract milestones from the roadmap → call `create_milestone()` for each
- Extract deliverables → call `add_milestone_task()` for each
- Extract timeline → set `planned_start` / `planned_end` dates
- Map dependencies → set milestone `dependencies` arrays
- Register the user's agent roster → call `register_agent()` for each
- Assign domain colors from the palette (see Phase 10)

This hydration process is NOT part of this blueprint. The implementing agent should be aware it will happen after the build.

---

## PHASE 1: TRACKER SCHEMA

The tracker is a single JSON file (`project-tracker.json`) at the project root. All consumers (MCP server, TUI dashboard, external agents) read and write this file. This phase defines its exact schema.

### TypeScript Interfaces

```typescript
// ─── Root State ───────────────────────────────────────────────

interface TrackerState {
  schemaVersion: number            // Increment on breaking schema changes; starts at 1
  project: ProjectMeta
  milestones: Milestone[]
  agents: Agent[]
  agent_log: AgentLogEntry[]
  schedule: { phases: Phase[] }
}

// ─── Project Metadata ─────────────────────────────────────────

interface ProjectMeta {
  name: string                    // Project display name
  start_date: string              // YYYY-MM-DD, first day of work
  target_date: string             // YYYY-MM-DD, target completion
  current_week: number            // Live-calculated: 1-based week number
  schedule_status: 'on_track' | 'behind' | 'ahead'
  overall_progress: number        // 0.0 to 1.0 (done / total tasks)
}

// ─── Milestone ────────────────────────────────────────────────

interface Milestone {
  id: string                      // snake_case unique identifier
  title: string                   // Human-readable name
  domain: string                  // Category (populated during hydration)
  week: number                    // Start week (1-based)
  phase: string                   // Phase this milestone belongs to
  planned_start: string | null    // YYYY-MM-DD
  planned_end: string | null      // YYYY-MM-DD
  actual_start: string | null     // YYYY-MM-DD (auto-set when first task starts)
  actual_end: string | null       // YYYY-MM-DD (auto-set when all tasks done)
  drift_days: number              // Positive = behind, negative = ahead, 0 = on track
  is_key_milestone: boolean       // True for major release/deadline milestones
  key_milestone_label: string | null  // e.g., "V1.0 Launch", "Beta Release"
  subtasks: Subtask[]             // Ordered list of tasks within this milestone
  dependencies: string[]          // IDs of milestones that must complete first
  notes: string[]                 // Exit criteria and notes
}

// ─── Subtask (Task) ───────────────────────────────────────────

interface Subtask {
  id: string                      // Format: {milestone_id}_{NNN} (zero-padded)
  label: string                   // Task description
  status: 'todo' | 'in_progress' | 'review' | 'done' | 'blocked'
  done: boolean                   // Completion flag (mirrors status === 'done')
  assignee: string | null         // Agent ID or human name
  blocked_by: string | null       // Who/what blocked this task
  blocked_reason: string | null   // Why it's blocked
  completed_at: string | null     // ISO 8601 timestamp
  completed_by: string | null     // Who completed it
  priority: string                // "P1" | "P2" | "P3" | "P4"
  notes: string | null            // Free-form notes

  // Agent enrichment fields (populated during prepare phase)
  prompt: string | null           // Task description/prompt
  context_files: string[]         // File paths the agent should read first
  reference_docs: string[]        // URLs or doc paths for research
  acceptance_criteria: string[]   // Checklist of what "done" means
  constraints: string[]           // Rules the implementation must follow

  // Execution configuration
  agent_target: string | null     // Suggested agent role (e.g., 'explorer', 'builder')
  execution_mode: 'human' | 'agent' | 'pair'
  depends_on: string[]            // IDs of subtasks that must complete first
  last_run_id: string | null      // Unique run identifier for the last execution
  builder_prompt: string | null   // Path to per-task prompt file (e.g., docs/prompts/task_001.md)
}

// ─── Agent ────────────────────────────────────────────────────

interface Agent {
  id: string                      // Unique identifier (e.g., 'claude_code', 'codex')
  name: string                    // Display name
  type: 'orchestrator' | 'sub-agent' | 'human' | 'external'
  parent_id?: string              // For sub-agents: ID of parent orchestrator
  color: string                   // Hex color for UI display (e.g., '#22c55e')
  status: string                  // 'active' | 'idle'
  permissions: string[]           // e.g., ['read', 'write']
  last_action_at: string | null   // ISO 8601 timestamp of last MCP tool call
  session_action_count: number    // Running count of actions in current session
}

// ─── Agent Log Entry ──────────────────────────────────────────

interface AgentLogEntry {
  id: string                      // Unique log entry ID (e.g., 'log_{timestamp}_{random}')
  agent_id: string                // Which agent performed the action
  action: string                  // Action type (e.g., 'task_started', 'task_blocked',
                                   //   'exploration_complete', 'audit_complete')
  target_type: string             // 'subtask' | 'milestone' | 'agent'
  target_id: string               // ID of the affected entity
  description: string             // Human-readable description of what happened
  timestamp: string               // ISO 8601 timestamp
  tags: string[]                  // Categorization (e.g., ['start', 'mcp'], ['write', 'commit'])
}

// ─── Schedule Phase ───────────────────────────────────────────

interface Phase {
  id: string                      // Unique phase identifier
  title: string                   // Display name (e.g., "Foundation", "Core Features")
  start_week: number              // First week of this phase (1-based)
  end_week: number                // Last week of this phase (inclusive)
}
```

### Schema Versioning

Every tracker includes `schemaVersion`. When the schema changes:

1. Increment `schemaVersion` in the TypeScript interface
2. Write a `migrate(version, state) → state` function in `tracker.ts`
3. `readTracker()` checks `schemaVersion` and applies all pending migrations
4. `writeTracker()` always writes with the current (latest) schema version

This ensures backward compatibility when the tracker format evolves.

### Empty Initial Tracker

Create this file at `{PROJECT_ROOT}/project-tracker.json`:

```json
{
  "schemaVersion": 1,
  "project": {
    "name": "My Project",
    "start_date": "2026-01-01",
    "target_date": "2026-06-30",
    "current_week": 1,
    "schedule_status": "on_track",
    "overall_progress": 0
  },
  "milestones": [],
  "agents": [],
  "agent_log": [],
  "schedule": {
    "phases": []
  }
}
```

> **Checkpoint:** The tracker file exists at the project root with valid JSON matching the schema, including `schemaVersion: 1`. No milestones or agents yet — those come from hydration.

---

## PHASE 2: MCP SERVER

A globally-installed Node.js package that exposes 24 tools over MCP stdio transport, plus a CLI for shell access.

### Project Structure

```
command-center-mcp/
├── package.json
├── tsconfig.json
├── vitest.config.ts
├── src/
│   ├── index.ts          # MCP server entry (stdio transport)
│   ├── tools.ts          # Tool definitions + handlers
│   ├── tracker.ts        # TypeScript types + read/write utilities
│   ├── schemas.ts        # Zod validation schemas for all tool inputs
│   ├── backup.ts         # Auto-backup + undo log utilities
│   ├── logger.ts         # pino structured logging setup
│   ├── context.ts        # Context builder functions (Markdown output)
│   └── cli.ts            # CLI interface (maps shell commands to tool handlers)
├── tests/
│   ├── tracker.test.ts   # Tracker read/write/migrate tests
│   ├── schemas.test.ts   # Zod schema validation tests
│   ├── tools.test.ts     # Tool handler integration tests
│   └── backup.test.ts    # Backup + undo log tests
```

### package.json

```json
{
  "name": "command-center-mcp",
  "version": "1.0.0",
  "description": "MCP server + CLI for the project Command Center",
  "type": "module",
  "main": "dist/index.js",
  "bin": {
    "command-center": "dist/cli.js"
  },
  "scripts": {
    "build": "tsc",
    "dev": "tsc --watch",
    "test": "vitest run",
    "test:watch": "vitest"
  },
  "dependencies": {
    "@modelcontextprotocol/sdk": "^1.12.1",
    "zod": "^3.23.0",
    "pino": "^9.0.0",
    "pino-transport": "^1.0.0"
  },
  "devDependencies": {
    "typescript": "^5.7.0",
    "@types/node": "^22.0.0",
    "vitest": "^3.0.0"
  }
}
```

### tsconfig.json

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ES2022",
    "moduleResolution": "bundler",
    "outDir": "dist",
    "rootDir": "src",
    "strict": true,
    "esModuleInterop": true,
    "resolveJsonModule": true,
    "declaration": true,
    "sourceMap": true
  },
  "include": ["src/**/*"]
}
```

### vitest.config.ts

```typescript
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    globals: true,
    environment: 'node',
    include: ['tests/**/*.test.ts'],
  },
})
```

### Logger (src/logger.ts)

Structured logging via pino. All logs go to `~/.command-center/logs/` with daily rotation.

```typescript
import pino from 'pino'

const LOG_DIR = path.join(os.homedir(), '.command-center', 'logs')

const logger = pino({
  level: process.env.LOG_LEVEL ?? 'info',
  transport: {
    targets: [
      {
        target: 'pino-transport/file',
        options: { destination: path.join(LOG_DIR, 'command-center.log') },
      },
    ],
  },
})

export default logger
```

Log rotation: keep 7 days of logs. Create `LOG_DIR` on startup if it doesn't exist.

### Zod Schemas (src/schemas.ts)

Validate every tool input before it touches the tracker. These schemas also serve as TypeScript type generators.

```typescript
import { z } from 'zod'

export const CreateMilestoneSchema = z.object({
  id: z.string().regex(/^[a-z][a-z0-9_]*$/, 'Must be snake_case'),
  title: z.string().min(1).max(200),
  domain: z.string().optional().default('general'),
  phase: z.string().optional(),
  planned_start: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).optional(),
  planned_end: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).optional(),
})

export const AddMilestoneTaskSchema = z.object({
  milestone_id: z.string().min(1),
  label: z.string().min(1).max(500),
  priority: z.enum(['P1', 'P2', 'P3', 'P4']).optional().default('P2'),
  acceptance_criteria: z.array(z.string()).optional(),
  constraints: z.array(z.string()).optional(),
  depends_on: z.array(z.string()).optional(),
  execution_mode: z.enum(['human', 'agent', 'pair']).optional().default('agent'),
})

export const StartTaskSchema = z.object({
  task_id: z.string().min(1),
  agent_id: z.string().optional().default('orchestrator'),
})

export const CompleteTaskSchema = z.object({
  task_id: z.string().min(1),
  summary: z.string().min(1).max(1000),
  agent_id: z.string().optional().default('orchestrator'),
})

export const ApproveTaskSchema = z.object({
  task_id: z.string().min(1),
  feedback: z.string().max(500).optional(),
})

export const RejectTaskSchema = z.object({
  task_id: z.string().min(1),
  feedback: z.string().min(1).max(1000),
})

export const BlockTaskSchema = z.object({
  task_id: z.string().min(1),
  reason: z.string().min(1).max(500),
})

export const UnblockTaskSchema = z.object({
  task_id: z.string().min(1),
  resolution: z.string().max(500).optional(),
})

export const UpdateTaskSchema = z.object({
  task_id: z.string().min(1),
  priority: z.enum(['P1', 'P2', 'P3', 'P4']).optional(),
  assignee: z.string().optional(),
  execution_mode: z.enum(['human', 'agent', 'pair']).optional(),
  notes: z.string().optional(),
})

export const EnrichTaskSchema = z.object({
  task_id: z.string().min(1),
  prompt: z.string().optional(),
  builder_prompt: z.string().optional(),
  acceptance_criteria: z.array(z.string()).optional(),
  constraints: z.array(z.string()).optional(),
  context_files: z.array(z.string()).optional(),
  reference_docs: z.array(z.string()).optional(),
})

export const LogActionSchema = z.object({
  task_id: z.string().min(1),
  action: z.string().min(1).max(100),
  description: z.string().min(1).max(1000),
  tags: z.array(z.string()).optional(),
  agent_id: z.string().optional().default('orchestrator'),
})

export const RegisterAgentSchema = z.object({
  agent_id: z.string().min(1),
  name: z.string().min(1).max(100),
  type: z.enum(['orchestrator', 'sub-agent', 'human', 'external']),
  permissions: z.array(z.enum(['read', 'write'])).min(1),
  color: z.string().regex(/^#[0-9a-fA-F]{6}$/).optional().default('#9B9BAA'),
  parent_id: z.string().optional(),
})

export const SetMilestoneDatesSchema = z.object({
  milestone_id: z.string().min(1),
  actual_start: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).optional(),
  actual_end: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).optional(),
})

export const UpdateDriftSchema = z.object({
  milestone_id: z.string().min(1),
  drift_days: z.number().int(),
})

export const AddMilestoneNoteSchema = z.object({
  milestone_id: z.string().min(1),
  note: z.string().min(1).max(500),
})

export const ListTasksSchema = z.object({
  milestone_id: z.string().optional(),
  status: z.enum(['todo', 'in_progress', 'review', 'done', 'blocked']).optional(),
  domain: z.string().optional(),
})

export const GetActivityFeedSchema = z.object({
  agent_id: z.string().optional(),
  limit: z.number().int().min(1).max(200).optional().default(30),
})

export const GetTaskContextSchema = z.object({
  task_id: z.string().min(1),
})

export const GetMilestoneOverviewSchema = z.object({
  milestone_id: z.string().min(1),
})

export const GetTaskHistorySchema = z.object({
  task_id: z.string().min(1),
})
```

### Backup & Undo (src/backup.ts)

Protects the tracker from corruption. Every write operation is preceded by a backup and logged for undo.

**Backup:**
```typescript
const BACKUP_DIR = path.join(os.homedir(), '.command-center', 'backups')
const MAX_BACKUPS = 20

function backupTracker(trackerPath: string): void {
  // Create BACKUP_DIR if it doesn't exist
  // Copy tracker to BACKUP_DIR/tracker_{timestamp}.json
  // Prune oldest backups if count > MAX_BACKUPS
}
```

**Undo Log:**
```typescript
const UNDO_LOG_PATH = path.join(os.homedir(), '.command-center', 'undo-log.jsonl')
const MAX_UNDO_ENTRIES = 50

interface UndoEntry {
  timestamp: string       // ISO 8601
  tool: string            // Which MCP tool caused the change
  before: string          // JSON snapshot of the affected entity before the change
  after: string           // JSON snapshot of the affected entity after the change
}

function appendUndoEntry(entry: UndoEntry): void {
  // Append JSONL line to UNDO_LOG_PATH
  // Prune oldest entries if count > MAX_UNDO_ENTRIES
}

function readUndoLog(): UndoEntry[] {
  // Read and parse all JSONL lines from UNDO_LOG_PATH
}
```

### Server Entry (src/index.ts)

Set up an MCP server with stdio transport:
- Server name: `"command-center"`
- Version: `"1.0.0"`
- Transport: `StdioServerTransport` from `@modelcontextprotocol/sdk/server/stdio`
- Register `ListToolsRequestSchema` handler → returns all tool definitions
- Register `CallToolRequestSchema` handler → routes to `handleTool(name, args)`
- Log startup message via pino: `"Command Center MCP server running on stdio"`

### Tracker Utilities (src/tracker.ts)

Include the TypeScript interfaces from Phase 1, plus these utility functions:

**Path Resolution:**
```
PROJECT_ROOT = process.env.PROJECT_ROOT
             ?? readDotEnv('PROJECT_ROOT')   // fallback: read from .env file
TRACKER_PATH = path.join(PROJECT_ROOT, 'project-tracker.json')
```

**Schema Migration:**
```typescript
const CURRENT_SCHEMA_VERSION = 1

function migrateTracker(state: any): TrackerState {
  let version = state.schemaVersion ?? 0
  while (version < CURRENT_SCHEMA_VERSION) {
    switch (version) {
      case 0:
        // Migration from unversioned to v1: add schemaVersion field
        state.schemaVersion = 1
        break
      // Future migrations go here:
      // case 1:
      //   // Migration from v1 to v2: ...
      //   state.schemaVersion = 2
      //   break
    }
    version++
  }
  return state as TrackerState
}
```

**readTracker(): TrackerState**
- Read and parse TRACKER_PATH
- Check `schemaVersion` — call `migrateTracker()` if behind current version
- Return parsed state

**writeTracker(state: TrackerState, toolName?: string): void**
- Validate `state` matches TrackerState shape (Zod parse or manual check)
- Recompute derived fields before writing:
  - `overall_progress = done_count / total_count` across all milestones
  - `current_week` = live calculation (see selector formula in Phase 4)
  - `schedule_status` = recalculate from milestone drift (see below)
  - `schemaVersion` = CURRENT_SCHEMA_VERSION
- Call `backupTracker(TRACKER_PATH)` before writing
- Write JSON with 2-space indent to TRACKER_PATH
- Log write via pino (level: 'debug', tool name, milestone/task counts)

**findTask(state, taskId): { subtask, milestone } | null**
- Search all milestones' subtasks for matching ID
- Return the subtask and its parent milestone, or null

**touchAgent(state, agentId = 'orchestrator'): void**
- Find agent by ID in `state.agents[]`
- Set `last_action_at` to current ISO timestamp
- Increment `session_action_count` by 1
- Set `status` to `'active'`
- Called by every write tool to keep Agent Hub current

**autoUnblockDependents(state, completedTaskId, completedMilestoneId): string[]**
- Called when a task is approved (moved to done)
- Returns array of descriptions of what was unblocked
- Logic:
  1. Find all subtasks across ALL milestones whose `depends_on` contains `completedTaskId`
  2. For each: check if ALL items in their `depends_on` array now have `status === 'done'`
  3. If yes AND the subtask has `status === 'blocked'`: set `status = 'todo'`, clear `blocked_by` and `blocked_reason`
  4. If the parent milestone is now fully complete (all subtasks done): check all milestones whose `dependencies` array contains `completedMilestoneId`
  5. For each downstream milestone: check if ALL its dependency milestones are fully complete
  6. If yes: unblock any blocked tasks in that downstream milestone
  7. Log each auto-unblock action to `agent_log`

**Schedule Status Calculation:**
```
max_drift = Math.max(...milestones.map(m => m.drift_days))
min_drift = Math.min(...milestones.map(m => m.drift_days))
if (max_drift > 3) → 'behind'
else if (min_drift < -3) → 'ahead'
else → 'on_track'
```

### Context Builders (src/context.ts)

These functions assemble Markdown text returned by read tools. Agents consume this Markdown as context for their work.

**buildTaskContext(state, subtask, milestone): string**

Returns comprehensive Markdown (~8K tokens) with these sections:
1. **Task metadata** — ID, status, priority, execution mode, assignee, notes, blocked reason
2. **Acceptance criteria** — Checklist format (`- [ ] criterion`)
3. **Constraints** — Bullet list
4. **Context files** — Paths the agent should read first
5. **Reference docs** — URLs/paths for research
6. **Revision history** — From `agent_log` entries where `target_id === task_id` and `action === 'revision_requested'`. Shows revision number, feedback, and timestamp.
7. **Builder prompt** — If `builder_prompt` path exists, read the file and include its content
8. **Milestone info** — Domain, phase, week, planned dates, drift
9. **Exit criteria** — `milestone.notes[]`
10. **Sibling tasks** — All other subtasks in the same milestone with their status and progress count
11. **Upstream dependencies** — Milestones in `milestone.dependencies[]` with their completion percentage
12. **Downstream milestones** — Milestones that depend on this milestone

**buildTaskSummary(state, subtask, milestone): string**

Slim version (~500 tokens) for post-build verification. Includes only:
- Task metadata (ID, label, status, domain)
- Acceptance criteria
- Constraints
- Context files
- Revision history

**buildProjectStatus(state): string**

Returns Markdown with:
- Project name, start date, target date, current week
- Schedule status
- Progress: done/total tasks, in-progress count, blocked count
- Milestone count
- Current phase name

**buildMilestoneOverview(milestone, state): string**

Returns Markdown with:
- Milestone ID, domain, phase, week, planned dates
- Progress: done/total with percentage
- Drift days
- Key milestone label (if any)
- Exit criteria (milestone.notes)
- Task list with status icons: done=`done`, in_progress=`in progress`, blocked=`blocked`, todo=`todo`
- Dependencies and their completion status

### Tool Definitions (src/tools.ts)

24 tools organized into 4 categories. Every write tool:
1. Validates input with the corresponding Zod schema
2. Calls `backupTracker()` + `appendUndoEntry()` via `writeTracker()`
3. Calls `touchAgent()`
4. Pushes an entry to `agent_log`
5. Logs the action via pino

---

#### READ TOOLS (8 tools)

**1. get_task_context**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |

Handler:
1. Validate input with `GetTaskContextSchema`
2. Call `findTask(state, task_id)` — return error if not found
3. Call `buildTaskContext(state, subtask, milestone)`
4. Return Markdown text

---

**2. get_task_summary**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |

Handler:
1. Validate input with `GetTaskContextSchema`
2. Call `findTask(state, task_id)` — return error if not found
3. Call `buildTaskSummary(state, subtask, milestone)`
4. Return Markdown text

---

**3. get_project_status**

No parameters.

Handler:
1. Call `buildProjectStatus(state)`
2. Return Markdown text

---

**4. get_milestone_overview**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| milestone_id | string | yes | The milestone ID |

Handler:
1. Validate input with `GetMilestoneOverviewSchema`
2. Find milestone by ID — return error if not found
3. Call `buildMilestoneOverview(milestone, state)`
4. Return Markdown text

---

**5. list_tasks**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| milestone_id | string | no | Filter by milestone |
| status | string | no | Filter: 'todo', 'in_progress', 'review', 'done', 'blocked' |
| domain | string | no | Filter by domain name |

Handler:
1. Validate input with `ListTasksSchema`
2. Collect all subtasks across milestones, applying filters
3. Group by milestone
4. Return Markdown list with status icons and priority badges

---

**6. get_task_history**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |

Handler:
1. Validate input with `GetTaskHistorySchema`
2. Filter `agent_log` entries where `target_id === task_id`
3. Return chronological Markdown list with action, description, agent, timestamp, tags
4. Return "No history found" if empty

---

**7. list_agents**

No parameters.

Handler:
1. For each agent in `state.agents`:
   - Determine active status: `Date.now() - last_action_at < 30 minutes` → ACTIVE, else IDLE
   - Calculate weekly stats from `agent_log` (action count, tag breakdown)
2. Return Markdown report with agent details, status, permissions, weekly stats

---

**8. get_activity_feed**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| agent_id | string | no | Filter by agent |
| limit | number | no | Max entries (default: 30) |

Handler:
1. Validate input with `GetActivityFeedSchema`
2. Sort `agent_log` by timestamp descending
3. Apply agent_id filter if provided
4. Take first `limit` entries
5. Group by date
6. Return Markdown with day headers and per-entry details (agent name, action, description, target, tags, time)

---

#### WRITE TOOLS — Task Lifecycle (9 tools)

**9. start_task**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |
| agent_id | string | no | Who is starting (default: 'orchestrator') |

Handler:
1. Validate input with `StartTaskSchema`
2. Find task — error if not found
3. Set `task.status = 'in_progress'`
4. Set `task.assignee = agent_id` (if not already assigned)
5. Set `task.last_run_id = 'run_' + Date.now()`
6. **Auto-stamp milestone**: If `milestone.actual_start` is null, set it to today's date. Calculate drift: `drift_days = (actual_start - planned_start) in days`
7. Push `agent_log` entry: action `'task_started'`, tags `['start', 'mcp']`
8. Call `touchAgent(state, agent_id)`
9. Call `writeTracker(state, 'start_task')`
10. Return confirmation with milestone/task names

---

**10. complete_task**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |
| summary | string | yes | 1-3 sentence summary of work done |
| agent_id | string | no | Who completed (default: 'orchestrator') |

Handler:
1. Validate input with `CompleteTaskSchema`
2. Find task — error if not found
3. Set `task.status = 'review'` (NOT done — requires operator approval)
4. Clear `blocked_by` and `blocked_reason`
5. Push `agent_log` entry: action `'task_submitted_for_review'`, description = summary
6. Call `touchAgent(state, agent_id)`
7. Call `writeTracker(state, 'complete_task')`
8. Return confirmation with summary and milestone progress (done/total)

---

**11. approve_task** (OPERATOR ONLY)

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |
| feedback | string | no | Optional approval feedback |

Handler:
1. Validate input with `ApproveTaskSchema`
2. Find task — error if not found
3. Verify `task.status === 'review'` — error if not
4. Set `task.status = 'done'`, `task.done = true`
5. Set `task.completed_at = new Date().toISOString()`
6. Set `task.completed_by` to operator name
7. **Auto-stamp milestone**: If ALL subtasks in the milestone are now done, set `milestone.actual_end` to today
8. Call `autoUnblockDependents(state, task_id, milestone_id)` — cascade unblocking
9. Push `agent_log` entry: action `'task_approved'`, agent_id = operator
10. Call `touchAgent(state, operator_id)`
11. Call `writeTracker(state, 'approve_task')`
12. Return confirmation with milestone progress + auto-unblock details

---

**12. reject_task** (OPERATOR ONLY)

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |
| feedback | string | yes | What needs to change |

Handler:
1. Validate input with `RejectTaskSchema`
2. Find task — error if not found
3. Verify `task.status === 'review'` — error if not
4. Set `task.status = 'in_progress'`
5. Count prior revisions: count `agent_log` entries where `target_id === task_id` AND `action === 'revision_requested'`
6. Push `agent_log` entry: action `'revision_requested'`, description includes revision number and feedback text
7. Call `touchAgent(state, operator_id)`
8. Call `writeTracker(state, 'reject_task')`
9. Return confirmation with revision number and feedback

---

**13. reset_task** (OPERATOR ONLY)

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |

Handler:
1. Validate input with `GetTaskContextSchema`
2. Find task — error if not found
3. Set `status = 'todo'`, `done = false`
4. Clear: `assignee`, `blocked_by`, `blocked_reason`, `completed_at`, `completed_by`, `last_run_id`
5. Push `agent_log` entry: action `'task_reset'`
6. Call `writeTracker(state, 'reset_task')`
7. Return confirmation with previous status

---

**14. block_task**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |
| reason | string | yes | Why the task is blocked |

Handler:
1. Validate input with `BlockTaskSchema`
2. Find task — error if not found
3. Set `task.status = 'blocked'`
4. Set `task.blocked_reason = reason`
5. Set `task.blocked_by` to agent_id (default 'orchestrator')
6. Push `agent_log` entry: action `'task_blocked'`
7. Call `touchAgent(state, agent_id)`
8. Call `writeTracker(state, 'block_task')`
9. Return confirmation

---

**15. unblock_task**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |
| resolution | string | no | How the block was resolved |

Handler:
1. Validate input with `UnblockTaskSchema`
2. Find task — error if not found
3. Verify `task.status === 'blocked'` — error if not
4. Set `task.status` to `'in_progress'` if `last_run_id` exists, else `'todo'`
5. Clear `blocked_by` and `blocked_reason`
6. Push `agent_log` entry: action `'task_unblocked'`, description includes resolution
7. Call `touchAgent(state, agent_id)`
8. Call `writeTracker(state, 'unblock_task')`
9. Return confirmation with previous blocker reason and new status

---

**16. update_task**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |
| priority | string | no | New priority (P1/P2/P3/P4) |
| assignee | string | no | New assignee (empty string to unassign) |
| execution_mode | string | no | 'human', 'agent', or 'pair' |
| notes | string | no | Updated notes |

Handler:
1. Validate input with `UpdateTaskSchema`
2. Find task — error if not found
3. Only update fields that are provided (non-undefined)
4. Push `agent_log` entry: action `'task_updated'`, description lists all changes
5. Call `touchAgent(state, agent_id)`
6. Call `writeTracker(state, 'update_task')`
7. Return confirmation with change list

---

**17. log_action**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The target entity ID |
| action | string | yes | Action label (e.g., 'file_created', 'test_passed') |
| description | string | yes | What happened |
| tags | string[] | no | Categorization tags |
| agent_id | string | no | Who performed (default: 'orchestrator') |

Handler:
1. Validate input with `LogActionSchema`
2. Create `AgentLogEntry` with unique ID, timestamp, provided fields
3. Append `'mcp'` to tags array
4. Push to `state.agent_log`
5. Call `touchAgent(state, agent_id)`
6. Call `writeTracker(state, 'log_action')`
7. Return confirmation

---

#### WRITE TOOLS — Task Enrichment (1 tool)

**18. enrich_task**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| task_id | string | yes | The subtask ID |
| prompt | string | no | Task description/prompt |
| builder_prompt | string | no | Path to per-task prompt file |
| acceptance_criteria | string[] | no | Replaces existing criteria |
| constraints | string[] | no | Replaces existing constraints |
| context_files | string[] | no | Replaces existing file list |
| reference_docs | string[] | no | Replaces existing doc list |

Handler:
1. Validate input with `EnrichTaskSchema`
2. Find task — error if not found
3. Only update fields that are provided (non-undefined)
4. Arrays REPLACE existing values (not merge)
5. Push `agent_log` entry: action `'task_enriched'`, description lists changes
6. Call `touchAgent(state, agent_id)`
7. Call `writeTracker(state, 'enrich_task')`
8. Return confirmation

---

#### WRITE TOOLS — Milestone Management (5 tools)

**19. add_milestone_note**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| milestone_id | string | yes | The milestone ID |
| note | string | yes | Exit criterion or note text |

Handler:
1. Validate input with `AddMilestoneNoteSchema`
2. Find milestone — error if not found
3. Append `note` to `milestone.notes[]`
4. Push `agent_log` entry: action `'milestone_note_added'`
5. Call `writeTracker(state, 'add_milestone_note')`
6. Return confirmation with total note count

---

**20. set_milestone_dates**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| milestone_id | string | yes | The milestone ID |
| actual_start | string | no | YYYY-MM-DD |
| actual_end | string | no | YYYY-MM-DD |

Handler:
1. Validate input with `SetMilestoneDatesSchema`
2. Find milestone — error if not found
3. Update `actual_start` and/or `actual_end` if provided
4. **Auto-calculate drift**: `drift_days = (actual_start - planned_start)` in calendar days (positive = behind, negative = ahead)
5. **Recalculate schedule_status** using the formula in Tracker Utilities
6. Push `agent_log` entry: action `'milestone_dates_set'`
7. Call `writeTracker(state, 'set_milestone_dates')`
8. Return confirmation with changes and schedule status

---

**21. update_drift**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| milestone_id | string | yes | The milestone ID |
| drift_days | number | yes | Positive = behind, negative = ahead |

Handler:
1. Validate input with `UpdateDriftSchema`
2. Find milestone — error if not found
3. Set `milestone.drift_days` to provided value
4. **Recalculate schedule_status**
5. Push `agent_log` entry: action `'drift_updated'`, description shows old → new
6. Call `writeTracker(state, 'update_drift')`
7. Return confirmation

---

**22. create_milestone**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| id | string | yes | Unique snake_case ID |
| title | string | yes | Display name |
| domain | string | no | Category (default: 'general') |
| phase | string | no | Phase name (default: same as id) |
| planned_start | string | no | YYYY-MM-DD |
| planned_end | string | no | YYYY-MM-DD |

Handler:
1. Validate input with `CreateMilestoneSchema`
2. Check if milestone ID already exists — error if duplicate
3. Create new Milestone with empty subtasks, dependencies, notes
4. Set defaults for all optional fields
5. Append to `state.milestones`
6. Call `writeTracker(state, 'create_milestone')`
7. Return confirmation

---

**23. add_milestone_task**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| milestone_id | string | yes | Parent milestone ID |
| label | string | yes | Task description |
| priority | string | no | Default: 'P2' |
| acceptance_criteria | string[] | no | What "done" means |
| constraints | string[] | no | Implementation rules |
| depends_on | string[] | no | Task IDs this depends on |
| execution_mode | string | no | Default: 'agent' |

Handler:
1. Validate input with `AddMilestoneTaskSchema`
2. Find milestone — error if not found
3. Generate task ID: `{milestone_id}_{NNN}` where NNN is zero-padded count + 1
4. Create Subtask with `status = 'todo'`, `done = false`, all optional fields set to defaults
5. Append to `milestone.subtasks`
6. Call `writeTracker(state, 'add_milestone_task')`
7. Return confirmation with new task ID

---

#### WRITE TOOLS — Agent Management (1 tool)

**24. register_agent**

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| agent_id | string | yes | Unique identifier |
| name | string | yes | Display name |
| type | string | yes | 'orchestrator', 'sub-agent', 'human', 'external' |
| permissions | string[] | yes | e.g., ['read', 'write'] |
| color | string | no | Hex color (default: '#9B9BAA') |
| parent_id | string | no | Parent orchestrator ID (for sub-agents) |

Handler:
1. Validate input with `RegisterAgentSchema`
2. If agent exists: update all fields, set `status = 'active'`, set `last_action_at = now`
3. If new: create Agent with `session_action_count = 0`, `status = 'active'`
4. Push `agent_log` entry: action `'agent_registered'` or `'agent_updated'`
5. Call `writeTracker(state, 'register_agent')`
6. Return confirmation

---

### CLI Interface (src/cli.ts)

Map shell commands to the same `handleTool()` function used by MCP. Examples:

```bash
command-center get-task-context <task_id>
command-center start-task <task_id>
command-center complete-task <task_id> "<summary>"
command-center list-tasks [--milestone id] [--status todo] [--domain name]
command-center list-agents
command-center register-agent <id> "<name>" <type> --permissions read,write
```

Output goes to stdout. Errors go to stderr with exit code 1.

### MCP Configuration

Users add this to their `.mcp.json` (or equivalent for their agent platform):

```json
{
  "command-center": {
    "command": "command-center-mcp",
    "env": {
      "PROJECT_ROOT": "/absolute/path/to/project"
    }
  }
}
```

### Error Handling Pattern

All tools use the same error response format:
```typescript
{ content: [{ type: 'text', text: errorMessage }], isError: true }
```

Common errors:
- Task not found: `"Task '{id}' not found in any milestone"`
- Milestone not found: `"Milestone '{id}' not found"`
- Invalid status transition: `"Task '{id}' is in status '{status}', expected 'review'"`
- Validation error: `"Invalid input: {zod_error_message}"`

### Test Structure (tests/)

**tests/tracker.test.ts:**
- `readTracker()` parses valid JSON and returns TrackerState
- `readTracker()` migrates unversioned tracker to schemaVersion 1
- `writeTracker()` recomputes `overall_progress` correctly
- `writeTracker()` creates a backup before writing
- `findTask()` returns null for non-existent task IDs
- `autoUnblockDependents()` unblocks downstream tasks when dependencies are met
- `migrateTracker()` applies all pending migrations in sequence

**tests/schemas.test.ts:**
- Each Zod schema accepts valid input
- Each Zod schema rejects invalid input with clear error messages
- Edge cases: empty strings, too-long strings, invalid date formats

**tests/tools.test.ts:**
- `create_milestone` creates a milestone and persists to tracker
- `start_task` sets status and auto-stamps milestone actual_start
- `complete_task` moves to review (not done)
- `approve_task` moves to done and triggers auto-unblock cascade
- `reject_task` moves back to in_progress with revision count
- `block_task` / `unblock_task` cycle works correctly
- Invalid tool inputs are rejected by Zod schemas

**tests/backup.test.ts:**
- `backupTracker()` creates a backup file
- `backupTracker()` prunes oldest backups beyond MAX_BACKUPS
- `appendUndoEntry()` writes JSONL entries
- `appendUndoEntry()` prunes oldest entries beyond MAX_UNDO_ENTRIES

> **Checkpoint:** After building and running `npm run build`, the CLI should work. Test with `command-center get-project-status` — it should return the empty project status from the initial tracker. Test `command-center create-milestone test_milestone "Test Milestone"` — it should create a milestone in the tracker JSON. Run `npm test` — all tests pass. Check `~/.command-center/backups/` for backup files. Check `~/.command-center/logs/` for log output.

---

## PHASE 3: TUI SHELL

A terminal-based dashboard that watches the tracker file and renders project state using blessed.

### Project Structure

```
command-center-tui/
├── package.json
├── tsconfig.json
├── src/
│   ├── index.ts          # TUI entry point + blessed screen
│   ├── store.ts          # In-memory state + read/write tracker with debounce
│   ├── theme.ts          # ANSI color scheme + blessed widget style definitions
│   ├── config.ts         # PROJECT_ROOT resolution
│   └── widgets/          # Reusable blessed widget factories
```

### Dependencies

```json
{
  "name": "command-center-tui",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "tsx src/index.ts",
    "build": "tsc",
    "start": "node dist/index.js"
  },
  "dependencies": {
    "blessed": "^0.1.81",
    "blessed-contrib": "^4.11.0",
    "chokidar": "^4.0.0"
  },
  "devDependencies": {
    "typescript": "^5.7.0",
    "@types/node": "^22.0.0",
    "tsx": "^4.0.0"
  }
}
```

### Config (src/config.ts)

Resolve the project root:
1. Check `PROJECT_ROOT` environment variable
2. Fallback: read `.env` file for `PROJECT_ROOT=...`
3. Export `TRACKER_PATH = path.join(PROJECT_ROOT, 'project-tracker.json')`
4. Use `path.resolve()` for all path operations (cross-platform safety)

### Store (src/store.ts)

**State Interface:**
```typescript
interface TUIState {
  tracker: TrackerState | null
  loading: boolean
  error: string | null
  synced: boolean
  activeTab: TabId
  selectedMilestoneId: string | null
  theme: 'dark' | 'light'
}

type TabId = 'swim-lane' | 'task-board' | 'agent-hub' | 'calendar'
```

**Read Tracker:**
```typescript
function readTrackerFromDisk(): TrackerState | null {
  const raw = fs.readFileSync(TRACKER_PATH, 'utf-8')
  return JSON.parse(raw)
}
```

**Write-Back Debounce:**
```typescript
let writeTimer: ReturnType<typeof setTimeout> | null = null
let suppressExternalRefresh = false

function scheduleWriteBack(tracker: TrackerState) {
  if (writeTimer) clearTimeout(writeTimer)
  writeTimer = setTimeout(() => {
    suppressExternalRefresh = true
    fs.writeFileSync(TRACKER_PATH, JSON.stringify(tracker, null, 2))
    setTimeout(() => { suppressExternalRefresh = false }, 700)
  }, 500)
}
```

**File Watcher:**
```typescript
chokidar.watch(TRACKER_PATH).on('change', () => {
  if (suppressExternalRefresh) return
  try {
    const data = JSON.parse(fs.readFileSync(TRACKER_PATH, 'utf-8'))
    state.tracker = data
    render()
  } catch { /* ignore corrupt JSON (file mid-write) */ }
})
```

### Theme (src/theme.ts)

ANSI color definitions for blessed widgets. All views reference these constants.

```typescript
export const COLORS = {
  accent:     { hex: '#585CF0', ansi: 63  },
  accentLt:   { hex: '#8286FF', ansi: 105 },
  onTrack:    { hex: '#22c55e', ansi: 35  },
  behind:     { hex: '#ef4444', ansi: 196 },
  review:     { hex: '#f59e0b', ansi: 214 },
  muted:      { hex: '#9B9BAA', ansi: 247 },
  surface:    { hex: '#111118', ansi: 233 },
  dark:       { hex: '#0A0A10', ansi: 16  },
  border:     { hex: '#1a1a2e', ansi: 234 },
  white:      { hex: '#FFFFFF', ansi: 255 },
  black:      { hex: '#000000', ansi: 0   },

  domainPalette: [
    { hex: '#f59e0b', ansi: 214 },  // amber
    { hex: '#22c55e', ansi: 35  },  // green
    { hex: '#8286FF', ansi: 105 },  // indigo
    { hex: '#ef4444', ansi: 196 },  // red
    { hex: '#14B8A6', ansi: 37  },  // teal
    { hex: '#EC4899', ansi: 199 },  // pink
    { hex: '#F97316', ansi: 208 },  // orange
    { hex: '#6366F1', ansi: 63  },  // violet
    { hex: '#06B6D4', ansi: 38  },  // cyan
    { hex: '#9B9BAA', ansi: 247 },  // muted (fallback)
  ],
} as const

export function domainColor(domain: string, domains: string[]): number {
  const idx = domains.indexOf(domain)
  return COLORS.domainPalette[idx % COLORS.domainPalette.length].ansi
}

export const WIDGET_STYLES = {
  screen: {
    bg: COLORS.dark.ansi,
    fg: COLORS.white.ansi,
  },
  box: {
    bg: COLORS.surface.ansi,
    fg: COLORS.white.ansi,
    border: { fg: COLORS.border.ansi },
  },
  list: {
    bg: COLORS.surface.ansi,
    fg: COLORS.white.ansi,
    selectedBg: COLORS.accent.ansi,
    selectedFg: COLORS.white.ansi,
    border: { fg: COLORS.border.ansi },
  },
  table: {
    bg: COLORS.surface.ansi,
    fg: COLORS.white.ansi,
    selectedBg: COLORS.accent.ansi,
    selectedFg: COLORS.white.ansi,
    border: { fg: COLORS.border.ansi },
    headerBg: COLORS.border.ansi,
    headerFg: COLORS.white.ansi,
  },
  tabBar: {
    bg: COLORS.dark.ansi,
    fg: COLORS.muted.ansi,
    activeBg: COLORS.accent.ansi,
    activeFg: COLORS.white.ansi,
  },
  statusBar: {
    bg: COLORS.surface.ansi,
    fg: COLORS.muted.ansi,
  },
}
```

### Entry Point (src/index.ts)

```typescript
import blessed from 'blessed'

const screen = blessed.screen({
  smartCSR: true,
  title: 'Command Center',
  fullUnicode: true,
})

screen.key(['q', 'C-c'], () => process.exit(0))
screen.key(['1'], () => switchTab('swim-lane'))
screen.key(['2'], () => switchTab('task-board'))
screen.key(['3'], () => switchTab('agent-hub'))
screen.key(['4'], () => switchTab('calendar'))

// Layout: tab bar (top), status bar (bottom), view area (center)
// Start file watcher
// Initial render
```

> **Checkpoint:** Run `npm run dev`. The TUI dashboard launches in the terminal with an empty state, reads the tracker file, and shows tab labels. Pressing 1-4 switches tabs (can be placeholder areas). File watcher is active. Press `q` to quit.

---

## PHASE 4: TUI NAVIGATION & LAYOUT

### Dashboard Layout (src/dashboard.ts)

```
┌─────────────────────────────────────────────────────────┐
│ [1] Swim Lane │ [2] Task Board │ [3] Hub │ [4] Calendar│  ← Tab Bar
├─────────────────────────────────────────────────────────┤
│                                                         │
│                                                         │
│                  [Active View - flex: 1]                 │
│                                                         │
│                                                         │
├─────────────────────────────────────────────────────────┤
│ WEEK 3 · Core Features │ 12/27 (44%) │ ON TRACK │ ● Sync│  ← Status Bar
└─────────────────────────────────────────────────────────┘
```

### TabBar Widget

4 tabs rendered as blessed box elements in a horizontal row:

| Tab | ID | Key |
|-----|----|-----|
| Swim Lane | `swim-lane` | `1` |
| Task Board | `task-board` | `2` |
| Agent Hub | `agent-hub` | `3` |
| Calendar | `calendar` | `4` |

- Active tab: accent background, white text
- Inactive tabs: dark background, muted text
- Agent Hub tab: show `*` indicator if any `agent_log` entry has timestamp within last 30 minutes
- Keyboard: press number key (1-4) to switch

### StatusBar Widget

Rendered as a blessed box at the bottom of the screen, showing:

1. **Week + Phase** — "WEEK 3 · Core Features"
2. **Progress** — "12/27 (44%)"
3. **Schedule chip** — "ON TRACK" (green), "BEHIND" (red), or "AHEAD" (green)
4. **Sync indicator** — "● Sync" (green) if `synced`, "● Desync" (red) if not

### Derived Selectors (Pure Functions)

```typescript
function selectCurrentWeek(tracker: TrackerState | null): number {
  if (!tracker) return 1
  const start = new Date(tracker.project.start_date)
  const now = new Date()
  const diffDays = (now.getTime() - start.getTime()) / (1000 * 60 * 60 * 24)
  const totalWeeks = Math.ceil(
    (new Date(tracker.project.target_date).getTime() - start.getTime())
    / (1000 * 60 * 60 * 24 * 7)
  )
  return Math.max(1, Math.min(totalWeeks, Math.floor(diffDays / 7) + 1))
}

function selectCurrentWeekFractional(tracker: TrackerState | null): number {
  if (!tracker) return 1
  const start = new Date(tracker.project.start_date)
  const now = new Date()
  const diffDays = (now.getTime() - start.getTime()) / (1000 * 60 * 60 * 24)
  const totalWeeks = /* same calculation as above */
  return Math.max(1, Math.min(totalWeeks + 0.99, diffDays / 7 + 1))
}

function selectCurrentPhase(tracker: TrackerState | null): string {
  const week = selectCurrentWeek(tracker)
  const phase = tracker?.schedule.phases.find(
    p => week >= p.start_week && week <= p.end_week
  )
  return phase?.title ?? ''
}

function selectScheduleStatus(tracker: TrackerState | null): 'on_track' | 'behind' | 'ahead' {
  if (!tracker || tracker.milestones.length === 0) return 'on_track'
  const drifts = tracker.milestones.map(m => m.drift_days)
  if (Math.max(...drifts) > 3) return 'behind'
  if (Math.min(...drifts) < -3) return 'ahead'
  return 'on_track'
}

function selectOverallProgress(tracker: TrackerState | null): number {
  return tracker?.project.overall_progress ?? 0
}

function selectMilestoneProgress(milestone: Milestone): { done: number; total: number; pct: number } {
  const total = milestone.subtasks.length
  const done = milestone.subtasks.filter(t => t.done).length
  return { done, total, pct: total > 0 ? Math.round((done / total) * 100) : 0 }
}
```

### Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `1` | Switch to Swim Lane tab |
| `2` | Switch to Task Board tab |
| `3` | Switch to Agent Hub tab |
| `4` | Switch to Calendar tab |
| `q` / `Ctrl+C` | Quit dashboard |
| `t` | Toggle theme (dark/light) |
| `r` | Force refresh from tracker file |
| `?` | Show help overlay with all shortcuts |
| `Escape` | Close any open detail panel/modal |
| `j` / `k` / `↑` / `↓` | Navigate items in current view |
| `Enter` | Select/open focused item |
| `h` / `l` / `←` / `→` | Navigate horizontally (weeks, milestones) |

> **Checkpoint:** Tab switching works via number keys (1-4). StatusBar shows project metadata. Theme toggle works. Store syncs with tracker file changes. All keyboard shortcuts function correctly.

---

## PHASE 5: SWIM LANE VIEW

### Wireframe

```
┌──────────┬──────────────────────────────────────────────────────────────┐
│          │  W1       W2       W3   │  W4       W5       W6       W7   │
│          │  01-01    01-08    01-15│  01-22    01-29    02-05    02-12 │
├──────────┼──────────── Phase A ────┼──────────── Phase B ─────────────┤
│          │                         │                                   │
│ Domain A │    [6/11]──[3/8]        │                                   │
│ ████████ │                         │                                   │
│          │                         │                                   │
├──────────┤                         │                                   │
│ Domain B │       [4/4]             │     [2/7]────[0/5]                │
│ ████████ │                         │                                   │
│          │                         │                                   │
├──────────┤                         │                                   │
│ Domain C │                    [1/3]│         [0/6]                     │
│ ████████ │                         │                                   │
│          │                         │                                   │
├──────────┤       ◆ Beta Release    │                  ◆ V1.0 Launch   │
└──────────┴─────────────────────────┴──────────────────────────────────┘
                                     │
                                   NOW marker (vertical line + date label)
```

Legend:
- `[6/11]` = Milestone node with done/total progress
- `────` = Connection line between adjacent milestones in same lane
- `◆` = Major milestone marker (at bottom)
- `████████` = Domain color bar (left label area)
- `│` = NOW marker (vertical line at fractional week position)

### Constants

| Constant | Value | Description |
|----------|-------|-------------|
| `WEEK_W` | 12 | Characters width per week column |
| `LANE_H` | 3 | Lines per swim lane |
| `LABEL_W` | 10 | Characters for sticky left domain labels |
| `NODE_FMT` | `{done}/{total}` | Format string for milestone nodes |

`totalWeeks` is calculated dynamically from `project.start_date` and `project.target_date`.

### Layout Sections (rendered top to bottom)

**1. Week Headers**
- Row of week labels: "W1", "W2", etc.
- Below each: date string (start date of that week, formatted as MM-DD)

**2. Phase Bands**
- For each phase in `schedule.phases`: render a horizontal band spanning week columns
- Label with phase title, tinted with phase color

**3. NOW Marker**
- Vertical line at fractional week position
- Character: `│` in accent color
- Label: "NOW" + current date
- Auto-scroll to center on NOW marker on initial render

**4. Swim Lanes**
- One lane per unique domain in `milestones[].domain`
- Each lane has:
  - **Left label**: Domain name, colored background
  - **Milestone nodes**: `[done/total]` text positioned at milestone's week column
  - **Connection lines**: `────` between adjacent milestones in same domain, sorted by week

**5. Major Milestone Markers**
- Below swim lanes, render `◆` markers for milestones where `is_key_milestone === true`
- Show `key_milestone_label` text next to marker

### Milestone Node Rendering (Text)

Each node renders as: `[done/total]` in domain color.

Drift visualization:
- When `milestone.drift_days !== 0`:
  - Show drift indicator: `+3d` (red, behind) or `-2d` (green, ahead) next to the node
  - Ghost position shown in parentheses: `(3/8)` in muted color at planned position

### Detail Panel (blessed box overlay)

When a milestone node is selected (via `Enter` key), show a detail panel as a blessed box overlay.

**Header:**
- Domain color tag + "W{week}" badge + key milestone label (if any)
- Milestone title
- Progress: done/total with percentage

**Sections:**

1. **Schedule** — 2-column layout:
   - Planned Start / Planned End (editable via blessed input)
   - Actual Start / Actual End (read-only, auto-calculated)
   - Drift label if non-zero: "X DAYS BEHIND/AHEAD"
   - Save button (calls `scheduleWriteBack` to persist date changes)

2. **Subtasks List** — blessed list widget:
   - Per task: `[x]` or `[ ]` + label + assignee + status color + priority
   - Arrow keys to navigate, `Enter` to toggle done status

3. **Dependencies** — If `milestone.dependencies` is non-empty:
   - List upstream milestones with progress: `[3/5] Title`

4. **Notes** — Exit criteria:
   - Existing notes displayed as text lines
   - Input + `Enter` to append new notes

### Interactions

- **`j`/`k` or arrow keys** → navigate between milestone nodes
- **`Enter`** → open detail panel for focused node
- **`Escape`** → close detail panel
- **`h`/`l`** → scroll timeline horizontally (week-by-week)
- **`n`** → scroll to NOW marker

### Empty State

When `milestones[]` is empty:
- Show the week grid and NOW marker
- Show empty lanes with text: "Milestones will appear here after hydration"
- No detail panel available

> **Checkpoint:** Swim Lane renders with week grid, NOW marker at the correct fractional week, and empty lane placeholders. If you manually add a milestone to the tracker JSON, it should appear as a node in the correct lane and week position. Arrow keys navigate nodes. Enter opens detail panel. Escape closes it.

---

## PHASE 6: TASK BOARD VIEW

### Wireframe

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  [6/11]  Domain · W3 · Milestone Title                    ← [Select] → →  │
├─────────────────────────────────────────────────────────────────────────────┤
│  [All: 11]   [My Tasks: 3]   [Agent Tasks: 5]   [Blocked: 1]              │
├──────────────┬──────────────┬──────────────┬──────────────┬────────────────┤
│  TO DO (5)   │ IN PROGRESS  │ REVIEW (2)   │  DONE (1)    │ BLOCKED (1)   │
│  ──────────  │  ──────────  │  ──────────  │  ──────────  │  ──────────   │
│  P2 domain   │  P1 domain   │  P1 domain   │  ✓ domain   │  ⊘ domain    │
│  Title       │  Title       │              │  Title       │  Reason:      │
│  desc...     │  desc...     │              │  04/10       │  dep...       │
│    @agent    │    @agent    │   @human     │              │               │
│              │              │              │              │               │
│  P3 domain   │  P2 domain   │              │              │               │
│  Title       │  Title       │              │              │               │
│──────────────│──────────────│──────────────│──────────────│───────────────│
│              │              │              │              │               │
│  ↑↓ navigate│  Tab: next   │  Enter: open │              │               │
└──────────────┴──────────────┴──────────────┴──────────────┴───────────────┘
```

### Column Definitions

| Column ID | Label | ANSI Color | Description |
|-----------|-------|-----------|-------------|
| `todo` | TO DO | 247 (muted) | New tasks |
| `in_progress` | IN PROGRESS | 63 (accent) | Currently being worked |
| `review` | REVIEW | 214 (amber) | Awaiting operator approval |
| `done` | DONE | 35 (green) | Completed |
| `blocked` | BLOCKED | 196 (red) | Blocked by dependency or issue |

### ContextBar Component (blessed box)

**Layout (left to right):**
1. Progress indicator: `[done/total]` in domain color
2. Info: domain tag + "W{week}" + milestone title
3. Navigation: `←` / `→` keys to switch between milestones, select dropdown via `Tab`

### FilterBar Component (blessed box)

**Filters:**

| FilterType | Label | Filter Logic |
|------------|-------|-------------|
| `all` | All | No filter |
| `my_tasks` | My Tasks | `assignee === operator_name` |
| `agent_tasks` | Agent Tasks | `assignee !== null && assignee !== operator_name` |
| `blocked` | Blocked | `status === 'blocked'` |

Render as horizontal text: `[F1:All 11] [F2:My 3] [F3:Agent 5] [F4:Blocked 1]`
Active filter highlighted in accent color. Toggle via `F1`-`F4` keys.

### KanbanColumn Component (blessed list)

Each column is a blessed list widget:

- Column header: colored label + count
- Each task is a list item, formatted as:
  ```
  P{priority} {domain} — {title}
    @{assignee} | {status_color_indicator}
  ```
- Blocked tasks show: `⊘ {blocked_reason}`
- In-progress tasks show pulsing-style indicator: `●` (bright)

**Keyboard Navigation:**
- `j`/`k` or `↑`/`↓` — move focus between tasks within a column
- `Tab` / `Shift+Tab` — move focus between columns
- `s` — move selected task to next status (todo → in_progress → review → done)
- `b` — move selected task to blocked status (prompts for reason)
- `Enter` — open TaskDetailModal for focused task

### TaskDetailModal Component (blessed box overlay)

Full-screen overlay opened when pressing `Enter` on a task.

**Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│ [domain] P2 · agent · {task_id}                    [ESC] × │
├─────────────────────────────────────────────────────────────┤
│ Status: in_progress     Priority: P2     Mode: agent       │
│ Assignee: claude_code                                       │
│ Blocked: No                                                 │
├─────────────────────────────────────────────────────────────┤
│ Label:                                                      │
│ {task_label}                                                │
├─────────────────────────────────────────────────────────────┤
│ Notes:                                                      │
│ {task_notes}                                                │
├─────────────────────────────────────────────────────────────┤
│ Acceptance Criteria:                                        │
│ - [ ] criterion 1                                           │
│ - [ ] criterion 2                                           │
├─────────────────────────────────────────────────────────────┤
│ Dependencies: task_001 ✓, task_003 ○                        │
│ Siblings: 3/8 done in milestone                             │
├─────────────────────────────────────────────────────────────┤
│ [Tab: History] [s:Status] [p:Priority] [a:Assignee] [ESC]  │
└─────────────────────────────────────────────────────────────┘
```

**History Tab** (`Tab` key to switch):
- Chronological log from `agent_log` where `target_id === task.id`
- Per entry: timestamp, agent, action, description, tags
- Focus on review cycle: `task_submitted_for_review`, `revision_requested`, `task_approved`

**Keyboard:**
- `Escape` — close modal
- `Tab` — toggle between Details and History tabs
- `s` — cycle status (prompted)
- `p` — cycle priority (P1→P2→P3→P4)
- `a` — change assignee (show agent list)
- Save writes changes via `scheduleWriteBack()`

### Empty State

When no subtasks exist in the selected milestone:
- Show 5 empty columns with headers
- Center text: "No tasks yet — tasks will appear after hydration"

> **Checkpoint:** Task board renders with 5 columns and milestone carousel. Keyboard navigation works between columns and cards. `s` key changes task status. `Enter` opens detail modal. If you manually add subtasks to a milestone in the tracker JSON, they appear as cards in the correct columns.

---

## PHASE 7: AGENT HUB VIEW

### Wireframe

```
┌───────────────────────────┬─────────────────────────────────────────────────┐
│  CONNECTED AGENTS          │  ACTIVITY FEED                                  │
│  ─────────────────────    │  [F1:All] [F2:Agent1] [F3:Agent2] [F4:System]  │
│                            │  [/:Search...]                                  │
│  ▼ Orchestrator            │  ─────────────────────────────────────────────  │
│    ● Agent1  ACTIVE 2m ago │  TODAY                                          │
│      [READ] [WRITE]  24act │  ● agent1 · started task_005 · [START] [MCP]  │
│                            │    10:30 AM                                     │
│    ○ Agent2  IDLE   2h ago │  ● agent1 · completed build · [WRITE]          │
│      [READ]         12act  │    10:15 AM                                     │
│                            │  ─────────────────────────────────────────────  │
│  ─────────────────────    │  YESTERDAY                                      │
│  SHARED STATE              │  ● agent2 · exploration_complete · [MCP]       │
│  ─────────────────────    │    04:30 PM                                     │
│  File: project-tracker     │                                                │
│  Watcher: ● Active         │  [Load More: m]                                │
│  Milestones: 9             │                                                │
│  Subtasks: 27              │  ─────────────────────────────────────────────  │
│  Log entries: 142          │  AGENT PERFORMANCE (THIS WEEK)                 │
│                            │  Agent1: ████████████ 24 actions               │
│  ─────────────────────    │  Agent2: ██████ 12 actions                     │
│  CONTEXT INJECTION         │  Agent3: █ 3 actions                           │
│  ─────────────────────    │                                                │
│  WEEK 3, Phase: Core       │                                                │
│  Progress: 45% (12/27)     │                                                │
│  Schedule: ON TRACK        │                                                │
│  Blocked: 2                │                                                │
│  [c:Copy]                  │                                                │
│                            │                                                │
│  ─────────────────────    │                                                │
│  TODAY'S SUMMARY           │                                                │
│  ─────────────────────    │                                                │
│  Done: 3  InProg: 5  Block │                                                │
│  Agent1: 5 · Agent2: 2     │                                                │
└───────────────────────────┴─────────────────────────────────────────────────┘
```

### Left Column (fixed width: 30 chars)

#### Panel 1: Connected Agents (blessed list)

- Read `state.agents[]`
- Group agents hierarchically:
  - Orchestrators (type === 'orchestrator') at top level
  - Sub-agents nested under their parent (matched by `parent_id`)
  - Standalone agents (no parent, not orchestrator) listed separately
- Per agent item:
  - `●` (green) if active, `○` (gray) if idle — based on `isAgentActive(agent)`
  - Name + status + time since last action
  - Permission badges: `[R]` `[W]` shorthand
  - Session action count

**isAgentActive(agent):**
```typescript
return agent.last_action_at != null &&
  (Date.now() - new Date(agent.last_action_at).getTime()) < 30 * 60 * 1000
```

**Keyboard:** `j`/`k` to navigate, `Enter` to expand/collapse orchestrator sections.

#### Panel 2: Shared State File Info (blessed box)

- File path: "project-tracker.json"
- Watcher status: `● Active` (green) if `synced`, `● Inactive` (red) otherwise
- Counts: milestones, subtasks, log entries

#### Panel 3: Context Injection Preview (blessed box)

Auto-generated one-line context string:

```
WEEK {current_week}, Phase: {current_phase}, Progress: {pct}% ({done}/{total}), Schedule: {schedule_status}, Blocked: {blocked_count}
```

- `c` key copies the string to clipboard (using `child_process` to call `xclip`/`pbcopy`)

#### Panel 4: Today's Summary (blessed box)

- Three stats: Done (count), In Progress (count), Blocked (count)
- Contribution breakdown: agent color dot + name + action count (sorted descending)

### Right Column (flex-1)

#### Activity Feed (blessed list)

**Filter tabs:** `F1` through `Fn` keys — "All" + one per registered agent + "Manual" + "System"

**Search:** `/` key activates search input, filters by description (case-insensitive)

**Feed entries:**
- Sorted by timestamp descending
- Grouped by day with headers: "TODAY", "YESTERDAY", "MON APR 14"
- Per entry:
  - Agent name (colored) + action + description + target ID
  - Tags as styled text: `[WRITE]` `[START]` `[MCP]`
  - Timestamp right-aligned: "10:30 AM"

**Tag Styles (ANSI):**

| Tag | ANSI Color |
|-----|-----------|
| WRITE | 35 (green) |
| COMMIT | 63 (accent) |
| START | 38 (cyan) |
| ALERT | 196 (red) |
| NOTE | 247 (muted) |
| MCP | 105 (accent light) |

**Pagination:** Show 30 entries initially. `m` key loads next 30.

#### Agent Performance Stats (blessed-contrib bar chart)

Below the activity feed:

- **Scope:** This calendar week only (filter `agent_log` by timestamp)
- blessed-contrib horizontal bar chart
- Per agent: bar length = total actions, color = agent color
- Legend below chart: agent name + action count

### Empty State

When `agents[]` is empty and `agent_log[]` is empty:
- Connected Agents: "No agents registered. Agents register via MCP register_agent tool."
- Activity Feed: "No activity recorded yet"
- Performance Stats: hidden
- Context Injection + Today's Summary: still functional (computed from tracker)

> **Checkpoint:** Agent Hub renders with 4 left panels and the activity feed. Context Injection shows correct project stats. `c` key copies context string. If you manually add an agent and log entries to the tracker JSON, they appear in the Connected Agents panel and Activity Feed. Filter keys work. Search works.

---

## PHASE 8: CALENDAR VIEW

### Wireframe

```
┌──────────────────────────────────────────────────────────────────────────────┐
│  [h:Prev]   Week 3 · Jan 15 – Jan 21, 2026 · 3 completed   [t:Today] [l:Next] │
├──────────┬──────────┬──────────┬──────────┬──────────┬──────────┬───────────┤
│   MON    │   TUE    │   WED    │   THU    │   FRI    │   SAT    │   SUN     │
│   15     │   16     │   17     │   18     │   19     │   20     │   21      │
│  ═══     │          │  ═══     │          │          │          │           │
│  ✓ Task  │          │  ✓ Task  │          │          │          │           │
│  [domain]│          │  [domain]│          │          │          │           │
│  ✓ Task  │          │          │          │          │          │           │
│  [domain]│          │          │          │          │          │           │
└──────────┴──────────┴──────────┴──────────┴──────────┴──────────┴───────────┘
                 ▲
                 Today indicator (colored bar under header)
```

### Week Grid Layout (blessed grid)

- **7 columns** (Mon–Sun), equal width
- **Header per column:** Day abbreviation (MON, TUE, etc.) + date number
- **Today indicator:** accent-colored bar below the header of today's column
- **Task chips:** Stacked vertically in the column of their completion date

### Task Placement Logic

This calendar shows ONLY completed tasks:

1. Collect all subtasks across all milestones where `status === 'done'` AND `completed_at` is not null
2. Parse `completed_at` to a date
3. Place each task chip in the column matching that date
4. If a task's `completed_at` falls outside the currently displayed week, it doesn't appear

### Task Chip Rendering (Text)

Small formatted line for each completed task:

```
✓ {truncated_label} [{domain_tag}]
```

- `✓` in green (ANSI 35)
- Label truncated to fit column width
- Domain tag in domain color

### Navigation

- **`h` / `←`**: Previous week
- **`l` / `→`**: Next week
- **`t`**: Jump to today's week
- **Header:** "Week {N} · {start_date} – {end_date} · {count} completed"

### Week Calculation

- Week 1 starts on the Monday of the week containing `project.start_date`
- Each subsequent week is 7 days
- Total weeks calculated from `project.start_date` to `project.target_date`

### Empty State

When no completed tasks exist:
- Show the week grid with headers
- Center text: "Completed tasks will appear here as work is finished"

> **Checkpoint:** Calendar renders with 7-column week grid. Today indicator highlights the correct day. `h`/`l` navigation works. `t` jumps to today. If you manually set a subtask's `status` to `done` and add a `completed_at` timestamp in the tracker JSON, it appears as a chip in the correct day column.

---

## PHASE 9: DESIGN SYSTEM

### ANSI Color Palette

**Dark Theme (default):**

| Token | ANSI 256 | Hex | Usage |
|-------|---------|-----|-------|
| Dark | 16 | `#0A0A10` | App background |
| Surface | 233 | `#111118` | Card/panel backgrounds |
| Border | 234 | `#1a1a2e` | Borders, dividers |
| Muted | 247 | `#9B9BAA` | Secondary text, inactive |
| Primary Text | 255 | `#FFFFFF` | Primary text |
| Accent | 63 | `#585CF0` | Primary action, active states |
| Accent Light | 105 | `#8286FF` | Hover, secondary accent |
| On Track | 35 | `#22c55e` | Schedule on track, done |
| Behind | 196 | `#ef4444` | Behind, blocked, errors |
| Review | 214 | `#f59e0b` | Review/pending |

**Light Theme:**

| Token | ANSI 256 | Hex |
|-------|---------|-----|
| Dark | 231 | `#F8F9FA` |
| Surface | 255 | `#FFFFFF` |
| Border | 252 | `#E5E7EB` |
| Muted | 243 | `#6B7280` |
| Primary Text | 234 | `#1A1A2E` |

**Fixed Colors (same in both themes):**

| Token | ANSI 256 | Hex | Usage |
|-------|---------|-----|-------|
| Accent | 63 | `#585CF0` | Active states |
| On Track | 35 | `#22c55e` | Done, on schedule |
| Behind | 196 | `#ef4444` | Blocked, behind |
| Review | 214 | `#f59e0b` | Pending review |

**Domain Color Palette (assigned during hydration):**

When the user's manifesto is processed, each domain gets the next color from this list:

```
1. 214  #f59e0b  (amber)
2. 35   #22c55e  (green)
3. 105  #8286FF  (indigo)
4. 196  #ef4444  (red)
5. 37   #14B8A6  (teal)
6. 199  #EC4899  (pink)
7. 208  #F97316  (orange)
8. 63   #6366F1  (violet)
9. 38   #06B6D4  (cyan)
10. 247 #9B9BAA  (muted — fallback)
```

Store the domain → color mapping in the tracker. All views reference this mapping via `domainColor()` in `theme.ts`.

### Widget Style Patterns

**Tag/Badge:** Colored text using ANSI escape codes. Format: `[{tag_text}]` in tag color.

**Progress Bar:** Horizontal bar using Unicode block characters: `████░░░░` where `█` = filled, `░` = track. Filled portion in domain color.

**Status Indicator:**
- `●` green (active/on-track)
- `○` gray (idle/inactive)
- `⊘` red (blocked/error)
- `✓` green (done)

**Modal Backdrop:** blessed overlay with darkened background. All key events captured by modal until `Escape`.

**Panel Layout:** blessed-contrib grid with configurable rows/columns. Panels separated by 1-char border lines.

### Typography

All text uses the terminal's default monospace font. No font loading needed.

**Conventions:**
- Headers: UPPERCASE, accent color
- Labels: Title Case, primary text color
- Values: lowercase or original case, muted color
- Numbers: right-aligned in columns
- Status text: colored using status ANSI color

### Terminal Compatibility

- **Truecolor terminals** (iTerm2, Windows Terminal, Kitty): Use hex colors via blessed's `style.fg`/`style.bg`
- **256-color terminals**: Fall back to ANSI 256 palette (mapped in `theme.ts`)
- **16-color terminals**: Fall back to basic ANSI colors (red, green, blue, yellow, etc.)
- Detect capability at startup using `process.env.TERM` and `process.env.COLORTERM`
- Store detection result in `theme.ts` and use appropriate color tier throughout

> **Checkpoint:** All views use consistent colors from the theme. Theme toggle (`t` key) switches between dark and light modes. Domain colors are consistent across all views. Terminal color detection works and falls back gracefully.

---

## PHASE 10: WORKFLOW STATE MACHINE

This phase creates workflow documentation and agent role templates that describe how AI agents interact with the command center via MCP tools. These are reference documents — the implementing agent should create them as files in the user's project.

### Task Lifecycle States

```
                    ┌──────────┐
                    │   TODO   │
                    └────┬─────┘
                         │ start_task()
                    ┌────▼─────┐         block_task()    ┌──────────┐
                    │IN PROGRESS├───────────────────────►│ BLOCKED  │
                    └────┬─────┘                         └────┬─────┘
                         │ complete_task()                     │ unblock_task()
                    ┌────▼─────┐                              │
           ┌────────┤  REVIEW  │◄─────────────────────────────┘
           │        └────┬─────┘         (returns to previous state)
           │             │ approve_task()
           │        ┌────▼─────┐
           │        │   DONE   │
           │        └──────────┘
           │ reject_task()
           │
           └──► back to IN PROGRESS
```

### State Transition Table

| Current State | Trigger | MCP Tool | Agent Dispatch | Next State |
|--------------|---------|----------|---------------|------------|
| `todo` | Operator says "prepare task X" | `get_task_context` | Explorer, then Researcher | `todo` (enriched) |
| `todo` | Operator says "start task X" | `start_task` | — | `in_progress` |
| `in_progress` | Implementation complete | — | — | `in_progress` |
| `in_progress` | Build/typecheck/lint pass | — | Post-Build Auditor | `in_progress` |
| `in_progress` | Auditor passes | `complete_task` | — | `review` |
| `review` | Operator gives code feedback | `reject_task` | — | `in_progress` |
| `review` | Operator approves | `approve_task` | — | `done` |
| `any` | Blocker encountered | `block_task` | — | `blocked` |
| `blocked` | Blocker resolved | `unblock_task` | — | `todo` or `in_progress` |

### Prepare Phase (Enrichment)

When the operator says "prepare task X":

1. **Get context:** Call `get_task_context(task_id)` to read the task
2. **Dispatch Explorer agent:**
   - Pass the task_id and ask it to investigate the codebase
   - Explorer returns: relevant files, existing patterns, gaps, integration points
   - Explorer MUST call `log_action(task_id, "exploration_complete", summary, agent_id: "explorer")`
3. **Dispatch Researcher agent:**
   - Pass the task_id AND a compressed brief of explorer findings (max 500 tokens — file paths, patterns, gaps, not raw output)
   - Researcher looks up external docs, API references, best practices
   - Researcher MUST call `log_action(task_id, "research_complete", summary, agent_id: "researcher")`
4. **Ask operator** clarifying questions if ambiguity remains (skip if already answered)
5. **Write prompt file** at `docs/prompts/{task_id}.md` incorporating explorer findings + researcher findings + operator context
6. **Enrich task:** Call `enrich_task(task_id)` with updated acceptance criteria, constraints, context files, reference docs, and `builder_prompt` path
7. **Task stays in `todo`** — do NOT call `start_task`

### Start Phase (Implementation)

When the operator says "start task X":

1. **Start:** Call `start_task(task_id)` — moves to `in_progress`
2. **Get context:** Call `get_task_context(task_id)` to read the enriched task
3. **Implement:** The orchestrator (or builder agent) does the work
4. **Validate:** Run the project's build/typecheck/lint commands
   - If any fail: fix errors and re-run until clean
5. **Dispatch Post-Build Auditor:**
   - Pass `task_id` AND an explicit list of modified files
   - Auditor performs: build validation, code review, security scan
   - Auditor MUST call `log_action(task_id, "audit_complete", summary, agent_id: "post-build-auditor")`
   - If auditor returns "FIXED": re-run build/typecheck/lint
   - If auditor returns "FAIL" it could not resolve: do NOT call `complete_task` — report to operator
6. **Complete:** Call `complete_task(task_id, summary)` — moves to `review`

### Review Phase

When the operator gives feedback on a task in `review`:

- **If feedback involves ANY code changes** (refactoring, fixes, additions, modifications):
  1. IMMEDIATELY call `reject_task(task_id, feedback)` — moves back to `in_progress`
  2. Do the work
  3. Re-run validation + auditor
  4. Call `complete_task(task_id, summary)` to resubmit

- **If feedback is purely conversational** (questions, "explain why you..."):
  - Answer the question, keep task in `review`

### Approve Phase

When the operator explicitly says "approve task X" / "complete task X" / "done":

1. Call `approve_task(task_id)` — moves to `done`
2. Auto-unblock cascade runs (downstream dependent tasks are unblocked if all their dependencies are now satisfied)

This is the ONLY way a task reaches `done`. Never call `approve_task` without explicit operator instruction.

### General Rules

- Always call `start_task` before implementation. Never write code for a task in `todo`.
- Always call `complete_task` after finishing. Never leave a task stuck in `in_progress`.
- Use `log_action` to record significant events (files created, tests passed, architecture decisions).
- Use `block_task` if you hit a blocker you cannot resolve.
- If a task has revision history (from prior `reject_task` calls), address ALL prior feedback before resubmitting.

### Agent Role Templates

Create these as agent definition files in whatever format the user's agent platform requires.

---

#### Explorer Agent

**Role:** Codebase investigator. Dispatched during the prepare phase to understand what exists before building.

**When dispatched:** First agent in the prepare phase.

**Input:** Task ID.

**Tools needed:** File reading, file search (glob), content search (grep), shell commands (read-only).

**Responsibilities:**
- Read context files listed in the task
- Search for domain-relevant files using glob patterns
- Search for patterns, function names, and imports using grep
- Read key files to understand architecture, data models, and conventions
- Identify what exists vs. what needs creating or modifying
- Check upstream milestones to understand foundation

**What to look for:**
- Existing patterns to follow (naming, file structure, abstractions)
- Utilities, helpers, and shared code to reuse
- Data models and relationships
- Integration points where new code connects
- Potential conflicts with sibling or in-progress tasks

**Depth adjustment:**
- Simple tasks (config, static pages): quick scan, 5-10 files
- Moderate tasks (new routes, API integrations): thorough scan, trace full data flows
- Complex tasks (new domains, architecture changes): deep investigation, map all dependencies

**Output:** Structured findings with: relevant files (paths + why), existing patterns, dependencies and integration points, gaps.

**MUST call:** `log_action(task_id, "exploration_complete", description, agent_id: "explorer")`

---

#### Researcher Agent

**Role:** External documentation and best-practices lookup. Dispatched during the prepare phase after the Explorer.

**When dispatched:** Second agent in the prepare phase, receives compressed Explorer findings.

**Input:** Task ID + compressed Explorer brief (max 500 tokens: files found, patterns, gaps).

**Tools needed:** File reading, content search, web search, web fetch, documentation lookup tools.

**Responsibilities:**
- Review the Explorer's findings to understand what the task requires
- Look up external documentation for APIs, libraries, and frameworks used by the project
- Research best practices and known gotchas for the technologies involved
- Identify any documentation relevant to the task's domain

**Output:** Structured research report with: API references (exact signatures, required fields, return types), best practices, gotchas (things that could go wrong), questions for the operator (with recommendations).

**MUST call:** `log_action(task_id, "research_complete", description, agent_id: "researcher")`

---

#### Post-Build Auditor Agent

**Role:** Quality gate. Dispatched after implementation, before `complete_task`. Reviews code quality and security in a single pass.

**When dispatched:** After the orchestrator finishes implementation and build/typecheck/lint pass.

**Input:** Task ID + explicit list of modified files.

**Tools needed:** File reading, content search, file editing, shell commands.

**Responsibilities (single pass — read each file once, apply all checks):**

**Step 1: Build Validation**
- Run the project's build, typecheck, and lint commands
- If any fail: fix with file edits and re-run
- If cannot fix: report FAIL immediately

**Step 2: Code Review**
- Read all modified files
- Check each acceptance criterion against the code
- Verify codebase patterns are followed (naming, structure, conventions)
- Check for edge cases at system boundaries
- Check for unused imports or dead code
- If issues found: fix directly

**Step 3: Security Scan**
- In the same files already read, check for:
  - Injection vulnerabilities (SQL, XSS, command injection)
  - Hardcoded secrets or API keys
  - User input not sanitized before database queries
  - Error messages that leak internal details
- If issues found: fix directly

**Output:** Structured report:
```
## Build Validation: PASS | FIXED | FAIL
## Code Review: PASS | FIXED
## Security: PASS | FIXED
## Overall: PASS | FIXED | FAIL
```

**MUST call:** `log_action(task_id, "audit_complete", description, agent_id: "post-build-auditor")`

---

### Files to Create

Phase 10 should produce these files in the user's project:

1. **Workflow documentation** — A markdown file describing the task lifecycle, state transitions, agent dispatch points, and MCP tool call sequences. Place at a logical location (e.g., `docs/workflow.md` or `.claude/rules/task-workflow.md`).

2. **Agent role definitions** — One file per agent role (Explorer, Researcher, Post-Build Auditor) in whatever format the user's agent platform requires. Include the role description, when dispatched, tools needed, responsibilities, and required `log_action` call.

3. **MCP configuration** — The `.mcp.json` file (or equivalent) pointing to the globally-installed `command-center-mcp` package with the `PROJECT_ROOT` environment variable.

> **Checkpoint:** Workflow documentation exists in the project. Agent role definitions are created. MCP configuration points to the command center server. An agent can call `get_project_status` via MCP and receive a valid response.

---

## PHASE 11: TESTING INFRASTRUCTURE

### MCP Server Tests

Already defined in Phase 2 (`tests/` directory). Ensure all tests pass:

```bash
cd command-center-mcp && npm test
```

Test coverage targets:
- `tracker.ts`: 90%+ (all utility functions, migrations, validation)
- `schemas.ts`: 95%+ (all Zod schemas, edge cases)
- `tools.ts`: 80%+ (all 24 tool handlers, happy path + error cases)
- `backup.ts`: 90%+ (backup, undo, pruning)

### TUI Dashboard Tests

TUI testing uses blessed's programmatic API to simulate user interactions:

```typescript
// tests/dashboard.test.ts
import { createTestScreen } from './helpers'

test('tab switching via number keys', () => {
  const { screen, getState } = createTestScreen()
  screen.program.emit('keypress', '2')
  expect(getState().activeTab).toBe('task-board')
})

test('status bar shows project metadata', () => {
  const { getContent } = createTestScreen(trackerWithMilestones)
  expect(getContent('statusBar')).toContain('WEEK 3')
  expect(getContent('statusBar')).toContain('ON TRACK')
})
```

### Integration Test

End-to-end test that verifies the full cycle:

1. Create tracker file
2. Start MCP server
3. Call `create_milestone` via CLI
4. Call `add_milestone_task` via CLI
5. Call `start_task` via CLI
6. Verify tracker JSON updated
7. Verify backup created
8. Verify undo log entry exists
9. Verify pino log output

> **Checkpoint:** All tests pass. `npm test` in `command-center-mcp/` runs without errors. Integration test verifies full create-start cycle.

---

## POST-BUILD: HYDRATION NOTICE

After all phases are complete, the implementing agent should tell the user:

---

**The Command Center skeleton is built and running.**

All four views render with empty states:
- **Swim Lane** — Week grid with NOW marker, empty domain lanes
- **Task Board** — 5-column Kanban with milestone carousel, no cards
- **Agent Hub** — Connected Agents panel, Activity Feed, Context Injection (showing project metadata)
- **Calendar** — Week grid with day headers, no completed tasks

The MCP server is installed and operational. All 24 tools respond correctly. Zod validation protects all inputs. Auto-backups and undo log are active. Structured logging writes to `~/.command-center/logs/`.

**To populate the command center with your project data, provide:**

1. **Your project manifesto** — Product vision, domains/areas of work, key workflows, principles. This determines the swim lane lanes and domain colors.

2. **Your project roadmap** — Timeline with phases, milestones, deliverables, dependencies, and target dates. This populates the milestones, subtasks, and schedule.

I will read these documents and:
- Extract your domains → create swim lane lanes with assigned colors
- Extract your phases → create schedule phases with week ranges
- Extract your milestones → call `create_milestone()` for each with planned dates
- Extract your deliverables → call `add_milestone_task()` for each as subtasks
- Map dependencies → set milestone `dependencies` arrays
- Register your agent roster → call `register_agent()` for each AI agent you use

After hydration, all four views will be populated and the task workflow will be ready for use.

---
