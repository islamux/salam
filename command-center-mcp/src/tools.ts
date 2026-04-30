import type { TrackerState, Subtask, Milestone, AgentLogEntry, Agent } from './tracker.js'
import {
  readTracker, writeTracker, findTask, touchAgent, autoUnblockDependents,
  generateTaskId, generateLogId, todayDateString, selectMilestoneProgress,
  logger,
} from './tracker.js'
import { appendUndoEntry } from './backup.js'
import {
  buildTaskContext, buildTaskSummary, buildProjectStatus, buildMilestoneOverview,
} from './context.js'
import {
  GetTaskContextSchema, GetTaskHistorySchema, GetMilestoneOverviewSchema,
  ListTasksSchema, GetActivityFeedSchema,
  StartTaskSchema, CompleteTaskSchema, ApproveTaskSchema, RejectTaskSchema,
  BlockTaskSchema, UnblockTaskSchema, UpdateTaskSchema, LogActionSchema,
  EnrichTaskSchema,
  CreateMilestoneSchema, AddMilestoneTaskSchema, SetMilestoneDatesSchema,
  UpdateDriftSchema, AddMilestoneNoteSchema, RegisterAgentSchema,
} from './schemas.js'

function snapshotEntity(entity: any): string {
  return JSON.stringify(entity)
}

function logAndWrite(state: TrackerState, toolName: string, before: string, after: string): void {
  appendUndoEntry({
    timestamp: new Date().toISOString(),
    tool: toolName,
    before,
    after,
  })
  writeTracker(state, toolName)
}

function makeLogEntry(
  agentId: string,
  action: string,
  targetType: string,
  targetId: string,
  description: string,
  tags: string[] = [],
): AgentLogEntry {
  return {
    id: generateLogId(),
    agent_id: agentId,
    action,
    target_type: targetType,
    target_id: targetId,
    description,
    timestamp: new Date().toISOString(),
    tags,
  }
}

type ToolResult = { content: { type: string; text: string }[]; isError?: boolean }

function ok(text: string): ToolResult {
  return { content: [{ type: 'text', text }] }
}

function err(text: string): ToolResult {
  return { content: [{ type: 'text', text }], isError: true }
}

function validate(schema: any, args: any): { data?: any; error?: string } {
  const result = schema.safeParse(args)
  if (result.success) return { data: result.data }
  const messages = result.error.issues.map((i: any) => `${i.path.join('.')}: ${i.message}`).join('; ')
  return { error: `Invalid input: ${messages}` }
}

export const toolDefinitions = [
  { name: 'get_task_context', description: 'Get full context for a task (~8K tokens)', inputSchema: { type: 'object', properties: { task_id: { type: 'string' } }, required: ['task_id'] } },
  { name: 'get_task_summary', description: 'Get slim summary of a task (~500 tokens)', inputSchema: { type: 'object', properties: { task_id: { type: 'string' } }, required: ['task_id'] } },
  { name: 'get_project_status', description: 'Get current project status overview', inputSchema: { type: 'object', properties: {} } },
  { name: 'get_milestone_overview', description: 'Get milestone details with task list', inputSchema: { type: 'object', properties: { milestone_id: { type: 'string' } }, required: ['milestone_id'] } },
  { name: 'list_tasks', description: 'List tasks with optional filters', inputSchema: { type: 'object', properties: { milestone_id: { type: 'string' }, status: { type: 'string', enum: ['todo', 'in_progress', 'review', 'done', 'blocked'] }, domain: { type: 'string' } } } },
  { name: 'get_task_history', description: 'Get chronological history for a task', inputSchema: { type: 'object', properties: { task_id: { type: 'string' } }, required: ['task_id'] } },
  { name: 'list_agents', description: 'List all registered agents with status', inputSchema: { type: 'object', properties: {} } },
  { name: 'get_activity_feed', description: 'Get recent activity feed', inputSchema: { type: 'object', properties: { agent_id: { type: 'string' }, limit: { type: 'number' } } } },
  { name: 'start_task', description: 'Move a task to in_progress', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, agent_id: { type: 'string' } }, required: ['task_id'] } },
  { name: 'complete_task', description: 'Submit task for review', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, summary: { type: 'string' }, agent_id: { type: 'string' } }, required: ['task_id', 'summary'] } },
  { name: 'approve_task', description: 'Approve a task in review (operator only)', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, feedback: { type: 'string' } }, required: ['task_id'] } },
  { name: 'reject_task', description: 'Reject a task in review (operator only)', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, feedback: { type: 'string' } }, required: ['task_id', 'feedback'] } },
  { name: 'reset_task', description: 'Reset a task to todo (operator only)', inputSchema: { type: 'object', properties: { task_id: { type: 'string' } }, required: ['task_id'] } },
  { name: 'block_task', description: 'Block a task with a reason', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, reason: { type: 'string' } }, required: ['task_id', 'reason'] } },
  { name: 'unblock_task', description: 'Unblock a blocked task', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, resolution: { type: 'string' } }, required: ['task_id'] } },
  { name: 'update_task', description: 'Update task fields', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, priority: { type: 'string', enum: ['P1', 'P2', 'P3', 'P4'] }, assignee: { type: 'string' }, execution_mode: { type: 'string', enum: ['human', 'agent', 'pair'] }, notes: { type: 'string' } }, required: ['task_id'] } },
  { name: 'log_action', description: 'Log a custom action', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, action: { type: 'string' }, description: { type: 'string' }, tags: { type: 'array', items: { type: 'string' } }, agent_id: { type: 'string' } }, required: ['task_id', 'action', 'description'] } },
  { name: 'enrich_task', description: 'Enrich a task with context', inputSchema: { type: 'object', properties: { task_id: { type: 'string' }, prompt: { type: 'string' }, builder_prompt: { type: 'string' }, acceptance_criteria: { type: 'array', items: { type: 'string' } }, constraints: { type: 'array', items: { type: 'string' } }, context_files: { type: 'array', items: { type: 'string' } }, reference_docs: { type: 'array', items: { type: 'string' } } }, required: ['task_id'] } },
  { name: 'add_milestone_note', description: 'Add a note to a milestone', inputSchema: { type: 'object', properties: { milestone_id: { type: 'string' }, note: { type: 'string' } }, required: ['milestone_id', 'note'] } },
  { name: 'set_milestone_dates', description: 'Set actual dates for a milestone', inputSchema: { type: 'object', properties: { milestone_id: { type: 'string' }, actual_start: { type: 'string' }, actual_end: { type: 'string' } }, required: ['milestone_id'] } },
  { name: 'update_drift', description: 'Update milestone drift', inputSchema: { type: 'object', properties: { milestone_id: { type: 'string' }, drift_days: { type: 'number' } }, required: ['milestone_id', 'drift_days'] } },
  { name: 'create_milestone', description: 'Create a new milestone', inputSchema: { type: 'object', properties: { id: { type: 'string' }, title: { type: 'string' }, domain: { type: 'string' }, phase: { type: 'string' }, planned_start: { type: 'string' }, planned_end: { type: 'string' } }, required: ['id', 'title'] } },
  { name: 'add_milestone_task', description: 'Add a task to a milestone', inputSchema: { type: 'object', properties: { milestone_id: { type: 'string' }, label: { type: 'string' }, priority: { type: 'string', enum: ['P1', 'P2', 'P3', 'P4'] }, acceptance_criteria: { type: 'array', items: { type: 'string' } }, constraints: { type: 'array', items: { type: 'string' } }, depends_on: { type: 'array', items: { type: 'string' } }, execution_mode: { type: 'string', enum: ['human', 'agent', 'pair'] } }, required: ['milestone_id', 'label'] } },
  { name: 'register_agent', description: 'Register or update an agent', inputSchema: { type: 'object', properties: { agent_id: { type: 'string' }, name: { type: 'string' }, type: { type: 'string', enum: ['orchestrator', 'sub-agent', 'human', 'external'] }, permissions: { type: 'array', items: { type: 'string', enum: ['read', 'write'] } }, color: { type: 'string' }, parent_id: { type: 'string' } }, required: ['agent_id', 'name', 'type', 'permissions'] } },
]

const ResetTaskSchema = GetTaskContextSchema

export async function handleTool(name: string, args: any): Promise<ToolResult> {
  try {
    switch (name) {
      case 'get_task_context': return handleGetTaskContext(args)
      case 'get_task_summary': return handleGetTaskSummary(args)
      case 'get_project_status': return handleGetProjectStatus()
      case 'get_milestone_overview': return handleGetMilestoneOverview(args)
      case 'list_tasks': return handleListTasks(args)
      case 'get_task_history': return handleGetTaskHistory(args)
      case 'list_agents': return handleListAgents()
      case 'get_activity_feed': return handleGetActivityFeed(args)
      case 'start_task': return handleStartTask(args)
      case 'complete_task': return handleCompleteTask(args)
      case 'approve_task': return handleApproveTask(args)
      case 'reject_task': return handleRejectTask(args)
      case 'reset_task': return handleResetTask(args)
      case 'block_task': return handleBlockTask(args)
      case 'unblock_task': return handleUnblockTask(args)
      case 'update_task': return handleUpdateTask(args)
      case 'log_action': return handleLogAction(args)
      case 'enrich_task': return handleEnrichTask(args)
      case 'add_milestone_note': return handleAddMilestoneNote(args)
      case 'set_milestone_dates': return handleSetMilestoneDates(args)
      case 'update_drift': return handleUpdateDrift(args)
      case 'create_milestone': return handleCreateMilestone(args)
      case 'add_milestone_task': return handleAddMilestoneTask(args)
      case 'register_agent': return handleRegisterAgent(args)
      default: return err(`Unknown tool: ${name}`)
    }
  } catch (error: any) {
    logger.error({ tool: name, error: error.message }, 'tool handler error')
    return err(`Internal error: ${error.message}`)
  }
}

// ─── READ TOOLS ───────────────────────────────────────────────

function handleGetTaskContext(args: any): ToolResult {
  const v = validate(GetTaskContextSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  return ok(buildTaskContext(state, found.subtask, found.milestone))
}

function handleGetTaskSummary(args: any): ToolResult {
  const v = validate(GetTaskContextSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  return ok(buildTaskSummary(state, found.subtask, found.milestone))
}

function handleGetProjectStatus(): ToolResult {
  const state = readTracker()
  return ok(buildProjectStatus(state))
}

function handleGetMilestoneOverview(args: any): ToolResult {
  const v = validate(GetMilestoneOverviewSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const milestone = state.milestones.find(m => m.id === v.data!.milestone_id)
  if (!milestone) return err(`Milestone '${v.data!.milestone_id}' not found`)
  return ok(buildMilestoneOverview(milestone, state))
}

function handleListTasks(args: any): ToolResult {
  const v = validate(ListTasksSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const { milestone_id, status, domain } = v.data!
  let tasks: { task: Subtask; milestone: Milestone }[] = []
  for (const m of state.milestones) {
    if (milestone_id && m.id !== milestone_id) continue
    if (domain && m.domain !== domain) continue
    for (const t of m.subtasks) {
      if (status && t.status !== status) continue
      tasks.push({ task: t, milestone: m })
    }
  }
  if (tasks.length === 0) return ok('No tasks found matching filters.')
  const lines = tasks.map(({ task: t, milestone: m }) => {
    const icon = t.status === 'done' ? 'done' : t.status === 'in_progress' ? 'in progress' : t.status === 'blocked' ? 'blocked' : t.status === 'review' ? 'review' : 'todo'
    return `- ${icon} \`${t.id}\` [${t.priority}] ${t.label} (milestone: ${m.id})${t.assignee ? ` @${t.assignee}` : ''}`
  })
  return ok(`## Tasks (${tasks.length})\n\n${lines.join('\n')}`)
}

function handleGetTaskHistory(args: any): ToolResult {
  const v = validate(GetTaskHistorySchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const entries = state.agent_log
    .filter(e => e.target_id === v.data!.task_id)
    .sort((a, b) => new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime())
  if (entries.length === 0) return ok('No history found.')
  const lines = entries.map(e => {
    const tags = e.tags.length > 0 ? ` [${e.tags.join(', ')}]` : ''
    return `- **${e.action}** by ${e.agent_id}: ${e.description}${tags} (_${e.timestamp}_)`
  })
  return ok(`## Task History: ${v.data!.task_id}\n\n${lines.join('\n')}`)
}

function handleListAgents(): ToolResult {
  const state = readTracker()
  if (state.agents.length === 0) return ok('No agents registered.')
  const now = Date.now()
  const lines = state.agents.map(a => {
    const isActive = a.last_action_at && (now - new Date(a.last_action_at).getTime()) < 30 * 60 * 1000
    const status = isActive ? 'ACTIVE' : 'IDLE'
    const ago = a.last_action_at ? timeAgo(new Date(a.last_action_at)) : 'never'
    const perms = a.permissions.map(p => `[${p.toUpperCase()}]`).join(' ')
    return `- **${a.name}** (${a.id}) — ${status} · ${ago} · ${perms} · ${a.session_action_count} actions`
  })
  return ok(`## Agents (${state.agents.length})\n\n${lines.join('\n')}`)
}

function handleGetActivityFeed(args: any): ToolResult {
  const v = validate(GetActivityFeedSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  let entries = [...state.agent_log].sort((a, b) =>
    new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime()
  )
  if (v.data!.agent_id) {
    entries = entries.filter(e => e.agent_id === v.data!.agent_id)
  }
  entries = entries.slice(0, v.data!.limit)
  if (entries.length === 0) return ok('No activity recorded.')
  const lines = entries.map(e => {
    const tags = e.tags.length > 0 ? ` [${e.tags.join(', ')}]` : ''
    const time = new Date(e.timestamp).toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' })
    return `- **${e.agent_id}** · ${e.action}: ${e.description}${tags} — ${time}`
  })
  return ok(`## Activity Feed\n\n${lines.join('\n')}`)
}

// ─── WRITE TOOLS — Task Lifecycle ─────────────────────────────

function handleStartTask(args: any): ToolResult {
  const v = validate(StartTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task, milestone } = found
  const before = snapshotEntity(task)

  task.status = 'in_progress'
  if (!task.assignee) task.assignee = v.data!.agent_id
  task.last_run_id = `run_${Date.now()}`

  if (!milestone.actual_start) {
    milestone.actual_start = todayDateString()
    if (milestone.planned_start) {
      const planned = new Date(milestone.planned_start)
      const actual = new Date(milestone.actual_start)
      milestone.drift_days = Math.round((actual.getTime() - planned.getTime()) / (1000 * 60 * 60 * 24))
    }
  }

  state.agent_log.push(makeLogEntry(v.data!.agent_id, 'task_started', 'subtask', task.id, `Started task: ${task.label}`, ['start', 'mcp']))
  touchAgent(state, v.data!.agent_id)

  const progress = selectMilestoneProgress(milestone)
  logAndWrite(state, 'start_task', before, snapshotEntity(task))
  return ok(`Started task \`${task.id}\` in milestone \`${milestone.id}\`. Milestone progress: ${progress.done}/${progress.total}`)
}

function handleCompleteTask(args: any): ToolResult {
  const v = validate(CompleteTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task, milestone } = found
  const before = snapshotEntity(task)

  task.status = 'review'
  task.blocked_by = null
  task.blocked_reason = null

  state.agent_log.push(makeLogEntry(v.data!.agent_id, 'task_submitted_for_review', 'subtask', task.id, v.data!.summary, ['review', 'mcp']))
  touchAgent(state, v.data!.agent_id)

  const progress = selectMilestoneProgress(milestone)
  logAndWrite(state, 'complete_task', before, snapshotEntity(task))
  return ok(`Submitted task \`${task.id}\` for review. Summary: ${v.data!.summary}. Milestone progress: ${progress.done}/${progress.total}`)
}

function handleApproveTask(args: any): ToolResult {
  const v = validate(ApproveTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task, milestone } = found
  if (task.status !== 'review') return err(`Task '${task.id}' is in status '${task.status}', expected 'review'`)
  const before = snapshotEntity(task)

  task.status = 'done'
  task.done = true
  task.completed_at = new Date().toISOString()
  task.completed_by = 'operator'

  const allDone = milestone.subtasks.every(t => t.done)
  if (allDone) milestone.actual_end = todayDateString()

  const unblocked = autoUnblockDependents(state, task.id, milestone.id)
  state.agent_log.push(makeLogEntry('operator', 'task_approved', 'subtask', task.id, v.data!.feedback ?? 'Approved', ['approve', 'mcp']))
  touchAgent(state, 'operator')

  const progress = selectMilestoneProgress(milestone)
  logAndWrite(state, 'approve_task', before, snapshotEntity(task))

  let msg = `Approved task \`${task.id}\`. Milestone progress: ${progress.done}/${progress.total}`
  if (unblocked.length > 0) msg += `\n\nAuto-unblocked:\n${unblocked.map(u => `- ${u}`).join('\n')}`
  return ok(msg)
}

function handleRejectTask(args: any): ToolResult {
  const v = validate(RejectTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task } = found
  if (task.status !== 'review') return err(`Task '${task.id}' is in status '${task.status}', expected 'review'`)
  const before = snapshotEntity(task)

  task.status = 'in_progress'
  const revisionCount = state.agent_log.filter(
    e => e.target_id === task.id && e.action === 'revision_requested'
  ).length + 1
  state.agent_log.push(makeLogEntry('operator', 'revision_requested', 'subtask', task.id, `Revision #${revisionCount}: ${v.data!.feedback}`, ['review', 'mcp']))
  touchAgent(state, 'operator')

  logAndWrite(state, 'reject_task', before, snapshotEntity(task))
  return ok(`Rejected task \`${task.id}\` (revision #${revisionCount}). Feedback: ${v.data!.feedback}`)
}

function handleResetTask(args: any): ToolResult {
  const v = validate(ResetTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task } = found
  const before = snapshotEntity(task)
  const prevStatus = task.status

  task.status = 'todo'
  task.done = false
  task.assignee = null
  task.blocked_by = null
  task.blocked_reason = null
  task.completed_at = null
  task.completed_by = null
  task.last_run_id = null

  state.agent_log.push(makeLogEntry('operator', 'task_reset', 'subtask', task.id, `Reset from ${prevStatus}`, ['reset', 'mcp']))
  logAndWrite(state, 'reset_task', before, snapshotEntity(task))
  return ok(`Reset task \`${task.id}\` from ${prevStatus} to todo.`)
}

function handleBlockTask(args: any): ToolResult {
  const v = validate(BlockTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task } = found
  const before = snapshotEntity(task)

  task.status = 'blocked'
  task.blocked_reason = v.data!.reason
  task.blocked_by = 'orchestrator'

  state.agent_log.push(makeLogEntry('orchestrator', 'task_blocked', 'subtask', task.id, `Blocked: ${v.data!.reason}`, ['block', 'mcp']))
  touchAgent(state, 'orchestrator')
  logAndWrite(state, 'block_task', before, snapshotEntity(task))
  return ok(`Blocked task \`${task.id}\`: ${v.data!.reason}`)
}

function handleUnblockTask(args: any): ToolResult {
  const v = validate(UnblockTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task } = found
  if (task.status !== 'blocked') return err(`Task '${task.id}' is in status '${task.status}', expected 'blocked'`)
  const before = snapshotEntity(task)
  const prevReason = task.blocked_reason

  task.status = task.last_run_id ? 'in_progress' : 'todo'
  task.blocked_by = null
  task.blocked_reason = null

  const resolution = v.data!.resolution ?? 'Resolved'
  state.agent_log.push(makeLogEntry('orchestrator', 'task_unblocked', 'subtask', task.id, `Unblocked: ${resolution}. Was blocked by: ${prevReason}`, ['unblock', 'mcp']))
  touchAgent(state, 'orchestrator')
  logAndWrite(state, 'unblock_task', before, snapshotEntity(task))
  return ok(`Unblocked task \`${task.id}\`. New status: ${task.status}. Previous blocker: ${prevReason}`)
}

function handleUpdateTask(args: any): ToolResult {
  const v = validate(UpdateTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task } = found
  const before = snapshotEntity(task)

  const changes: string[] = []
  if (v.data!.priority !== undefined) { changes.push(`priority: ${task.priority} → ${v.data!.priority}`); task.priority = v.data!.priority }
  if (v.data!.assignee !== undefined) { changes.push(`assignee: ${task.assignee} → ${v.data!.assignee || 'unassigned'}`); task.assignee = v.data!.assignee || null }
  if (v.data!.execution_mode !== undefined) { changes.push(`execution_mode: ${task.execution_mode} → ${v.data!.execution_mode}`); task.execution_mode = v.data!.execution_mode }
  if (v.data!.notes !== undefined) { changes.push('notes updated'); task.notes = v.data!.notes }

  if (changes.length === 0) return ok('No changes specified.')
  state.agent_log.push(makeLogEntry('orchestrator', 'task_updated', 'subtask', task.id, changes.join('; '), ['update', 'mcp']))
  touchAgent(state, 'orchestrator')
  logAndWrite(state, 'update_task', before, snapshotEntity(task))
  return ok(`Updated task \`${task.id}\`: ${changes.join(', ')}`)
}

function handleLogAction(args: any): ToolResult {
  const v = validate(LogActionSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const tags = [...(v.data!.tags ?? []), 'mcp']
  state.agent_log.push(makeLogEntry(v.data!.agent_id, v.data!.action, 'subtask', v.data!.task_id, v.data!.description, tags))
  touchAgent(state, v.data!.agent_id)
  logAndWrite(state, 'log_action', '{}', '{}')
  return ok(`Logged action '${v.data!.action}' on ${v.data!.task_id}`)
}

// ─── WRITE TOOLS — Enrichment ─────────────────────────────────

function handleEnrichTask(args: any): ToolResult {
  const v = validate(EnrichTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const found = findTask(state, v.data!.task_id)
  if (!found) return err(`Task '${v.data!.task_id}' not found in any milestone`)
  const { subtask: task } = found
  const before = snapshotEntity(task)

  const changes: string[] = []
  if (v.data!.prompt !== undefined) { task.prompt = v.data!.prompt; changes.push('prompt') }
  if (v.data!.builder_prompt !== undefined) { task.builder_prompt = v.data!.builder_prompt; changes.push('builder_prompt') }
  if (v.data!.acceptance_criteria !== undefined) { task.acceptance_criteria = v.data!.acceptance_criteria; changes.push('acceptance_criteria') }
  if (v.data!.constraints !== undefined) { task.constraints = v.data!.constraints; changes.push('constraints') }
  if (v.data!.context_files !== undefined) { task.context_files = v.data!.context_files; changes.push('context_files') }
  if (v.data!.reference_docs !== undefined) { task.reference_docs = v.data!.reference_docs; changes.push('reference_docs') }

  if (changes.length === 0) return ok('No enrichment fields specified.')
  state.agent_log.push(makeLogEntry('orchestrator', 'task_enriched', 'subtask', task.id, `Enriched: ${changes.join(', ')}`, ['enrich', 'mcp']))
  touchAgent(state, 'orchestrator')
  logAndWrite(state, 'enrich_task', before, snapshotEntity(task))
  return ok(`Enriched task \`${task.id}\`: ${changes.join(', ')}`)
}

// ─── WRITE TOOLS — Milestone Management ───────────────────────

function handleAddMilestoneNote(args: any): ToolResult {
  const v = validate(AddMilestoneNoteSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const milestone = state.milestones.find(m => m.id === v.data!.milestone_id)
  if (!milestone) return err(`Milestone '${v.data!.milestone_id}' not found`)

  milestone.notes.push(v.data!.note)
  state.agent_log.push(makeLogEntry('orchestrator', 'milestone_note_added', 'milestone', milestone.id, `Added note: ${v.data!.note}`, ['note', 'mcp']))
  logAndWrite(state, 'add_milestone_note', '{}', '{}')
  return ok(`Added note to milestone \`${milestone.id}\`. Total notes: ${milestone.notes.length}`)
}

function handleSetMilestoneDates(args: any): ToolResult {
  const v = validate(SetMilestoneDatesSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const milestone = state.milestones.find(m => m.id === v.data!.milestone_id)
  if (!milestone) return err(`Milestone '${v.data!.milestone_id}' not found`)

  const changes: string[] = []
  if (v.data!.actual_start !== undefined) { milestone.actual_start = v.data!.actual_start; changes.push(`actual_start: ${v.data!.actual_start}`) }
  if (v.data!.actual_end !== undefined) { milestone.actual_end = v.data!.actual_end; changes.push(`actual_end: ${v.data!.actual_end}`) }

  if (milestone.actual_start && milestone.planned_start) {
    const planned = new Date(milestone.planned_start)
    const actual = new Date(milestone.actual_start)
    milestone.drift_days = Math.round((actual.getTime() - planned.getTime()) / (1000 * 60 * 60 * 24))
  }

  state.agent_log.push(makeLogEntry('orchestrator', 'milestone_dates_set', 'milestone', milestone.id, `Dates updated: ${changes.join(', ')}`, ['schedule', 'mcp']))
  logAndWrite(state, 'set_milestone_dates', '{}', '{}')
  return ok(`Updated milestone \`${milestone.id}\` dates: ${changes.join(', ')}. Schedule: ${state.project.schedule_status}`)
}

function handleUpdateDrift(args: any): ToolResult {
  const v = validate(UpdateDriftSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const milestone = state.milestones.find(m => m.id === v.data!.milestone_id)
  if (!milestone) return err(`Milestone '${v.data!.milestone_id}' not found`)

  const oldDrift = milestone.drift_days
  milestone.drift_days = v.data!.drift_days

  state.agent_log.push(makeLogEntry('orchestrator', 'drift_updated', 'milestone', milestone.id, `Drift: ${oldDrift} → ${v.data!.drift_days} days`, ['drift', 'mcp']))
  logAndWrite(state, 'update_drift', '{}', '{}')
  return ok(`Updated drift for \`${milestone.id}\`: ${oldDrift} → ${v.data!.drift_days} days`)
}

function handleCreateMilestone(args: any): ToolResult {
  const v = validate(CreateMilestoneSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  if (state.milestones.find(m => m.id === v.data!.id)) return err(`Milestone '${v.data!.id}' already exists`)

  const milestone: Milestone = {
    id: v.data!.id,
    title: v.data!.title,
    domain: v.data!.domain ?? 'general',
    week: 1,
    phase: v.data!.phase ?? v.data!.id,
    planned_start: v.data!.planned_start ?? null,
    planned_end: v.data!.planned_end ?? null,
    actual_start: null,
    actual_end: null,
    drift_days: 0,
    is_key_milestone: false,
    key_milestone_label: null,
    subtasks: [],
    dependencies: [],
    notes: [],
  }

  if (milestone.planned_start && state.project.start_date) {
    const projectStart = new Date(state.project.start_date)
    const msStart = new Date(milestone.planned_start)
    milestone.week = Math.max(1, Math.floor((msStart.getTime() - projectStart.getTime()) / (1000 * 60 * 60 * 24 * 7)) + 1)
  }

  state.milestones.push(milestone)
  logAndWrite(state, 'create_milestone', '{}', snapshotEntity(milestone))
  return ok(`Created milestone \`${milestone.id}\`: ${milestone.title} (domain: ${milestone.domain}, week: ${milestone.week})`)
}

function handleAddMilestoneTask(args: any): ToolResult {
  const v = validate(AddMilestoneTaskSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const milestone = state.milestones.find(m => m.id === v.data!.milestone_id)
  if (!milestone) return err(`Milestone '${v.data!.milestone_id}' not found`)

  const taskId = generateTaskId(milestone.id, milestone.subtasks)
  const subtask: Subtask = {
    id: taskId,
    label: v.data!.label,
    status: 'todo',
    done: false,
    assignee: null,
    blocked_by: null,
    blocked_reason: null,
    completed_at: null,
    completed_by: null,
    priority: v.data!.priority ?? 'P2',
    notes: null,
    prompt: null,
    context_files: [],
    reference_docs: [],
    acceptance_criteria: v.data!.acceptance_criteria ?? [],
    constraints: v.data!.constraints ?? [],
    agent_target: null,
    execution_mode: v.data!.execution_mode ?? 'agent',
    depends_on: v.data!.depends_on ?? [],
    last_run_id: null,
    builder_prompt: null,
  }

  milestone.subtasks.push(subtask)
  logAndWrite(state, 'add_milestone_task', '{}', snapshotEntity(subtask))
  return ok(`Created task \`${taskId}\` in milestone \`${milestone.id}\`: ${v.data!.label}`)
}

function handleRegisterAgent(args: any): ToolResult {
  const v = validate(RegisterAgentSchema, args)
  if (v.error) return err(v.error)
  const state = readTracker()
  const existing = state.agents.find(a => a.id === v.data!.agent_id)
  const isUpdate = !!existing

  if (existing) {
    existing.name = v.data!.name
    existing.type = v.data!.type
    existing.permissions = v.data!.permissions
    existing.color = v.data!.color
    existing.status = 'active'
    existing.last_action_at = new Date().toISOString()
    if (v.data!.parent_id !== undefined) existing.parent_id = v.data!.parent_id
  } else {
    const agent: Agent = {
      id: v.data!.agent_id,
      name: v.data!.name,
      type: v.data!.type,
      color: v.data!.color,
      status: 'active',
      permissions: v.data!.permissions,
      last_action_at: new Date().toISOString(),
      session_action_count: 0,
    }
    if (v.data!.parent_id !== undefined) agent.parent_id = v.data!.parent_id
    state.agents.push(agent)
  }

  state.agent_log.push(makeLogEntry(v.data!.agent_id, isUpdate ? 'agent_updated' : 'agent_registered', 'agent', v.data!.agent_id, `${isUpdate ? 'Updated' : 'Registered'} agent: ${v.data!.name}`, ['agent', 'mcp']))
  logAndWrite(state, 'register_agent', '{}', '{}')
  return ok(`${isUpdate ? 'Updated' : 'Registered'} agent \`${v.data!.agent_id}\`: ${v.data!.name}`)
}

// ─── HELPERS ──────────────────────────────────────────────────

function timeAgo(date: Date): string {
  const seconds = Math.floor((Date.now() - date.getTime()) / 1000)
  if (seconds < 60) return `${seconds}s ago`
  const minutes = Math.floor(seconds / 60)
  if (minutes < 60) return `${minutes}m ago`
  const hours = Math.floor(minutes / 60)
  if (hours < 24) return `${hours}h ago`
  const days = Math.floor(hours / 24)
  return `${days}d ago`
}
