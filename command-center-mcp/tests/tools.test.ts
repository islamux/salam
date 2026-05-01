import { describe, it, expect, vi, beforeEach } from 'vitest'
import type { TrackerState, Milestone, Subtask } from '../src/tracker.js'

const {
  mockWriteTracker, mockReadTracker, mockFindTask, mockTouchAgent,
  mockAutoUnblock, mockSelectProgress, mockGenerateTaskId,
  mockGenerateLogId, mockTodayDate,
} = vi.hoisted(() => ({
  mockWriteTracker: vi.fn(),
  mockReadTracker: vi.fn(),
  mockFindTask: vi.fn(),
  mockTouchAgent: vi.fn(),
  mockAutoUnblock: vi.fn(() => []),
  mockSelectProgress: vi.fn(() => ({ done: 0, total: 1, pct: 0 })),
  mockGenerateTaskId: vi.fn(() => 'test_ms_001'),
  mockGenerateLogId: vi.fn(() => 'log_test'),
  mockTodayDate: vi.fn(() => '2026-01-15'),
}))

vi.mock('../src/tracker.js', () => ({
  readTracker: mockReadTracker,
  writeTracker: mockWriteTracker,
  findTask: mockFindTask,
  touchAgent: mockTouchAgent,
  autoUnblockDependents: mockAutoUnblock,
  selectMilestoneProgress: mockSelectProgress,
  generateTaskId: mockGenerateTaskId,
  generateLogId: mockGenerateLogId,
  todayDateString: mockTodayDate,
  logger: { info: vi.fn(), debug: vi.fn(), error: vi.fn(), warn: vi.fn() },
}))

vi.mock('../src/backup.js', () => ({
  appendUndoEntry: vi.fn(),
}))

vi.mock('../src/context.js', () => ({
  buildTaskContext: vi.fn(() => 'task context'),
  buildTaskSummary: vi.fn(() => 'task summary'),
  buildProjectStatus: vi.fn(() => 'project status'),
  buildMilestoneOverview: vi.fn(() => 'milestone overview'),
}))

import { handleTool } from '../src/tools.js'

function makeState(overrides: Partial<TrackerState> = {}): TrackerState {
  return {
    schemaVersion: 1,
    project: { name: 'Test', start_date: '2026-01-01', target_date: '2026-06-30', current_week: 1, schedule_status: 'on_track', overall_progress: 0 },
    milestones: [],
    agents: [],
    agent_log: [],
    schedule: { phases: [] },
    ...overrides,
  }
}

function makeMilestone(overrides: Partial<Milestone> = {}): Milestone {
  return {
    id: 'test_ms', title: 'Test Milestone', domain: 'core', week: 1, phase: 'p1',
    planned_start: '2026-01-06', planned_end: '2026-01-31',
    actual_start: null, actual_end: null, drift_days: 0,
    is_key_milestone: false, key_milestone_label: null,
    subtasks: [], dependencies: [], notes: [],
    ...overrides,
  }
}

function makeTask(overrides: Partial<Subtask> = {}): Subtask {
  return {
    id: 'test_ms_001', label: 'Test Task', status: 'todo', done: false,
    assignee: null, blocked_by: null, blocked_reason: null,
    completed_at: null, completed_by: null, priority: 'P2', notes: null,
    prompt: null, context_files: [], reference_docs: [],
    acceptance_criteria: [], constraints: [],
    agent_target: null, execution_mode: 'agent',
    depends_on: [], last_run_id: null, builder_prompt: null,
    ...overrides,
  }
}

beforeEach(() => {
  vi.clearAllMocks()
})

describe('create_milestone', () => {
  it('creates a milestone and persists', async () => {
    const state = makeState()
    mockReadTracker.mockReturnValue(state)
    const result = await handleTool('create_milestone', { id: 'new_ms', title: 'New Milestone' })
    expect(result.isError).toBeUndefined()
    expect(result.content[0].text).toContain('new_ms')
    expect(state.milestones.length).toBe(1)
    expect(state.milestones[0].id).toBe('new_ms')
    expect(state.milestones[0].domain).toBe('general')
    expect(mockWriteTracker).toHaveBeenCalledWith(state, 'create_milestone')
  })

  it('rejects duplicate id', async () => {
    const state = makeState({ milestones: [makeMilestone({ id: 'dup' })] })
    mockReadTracker.mockReturnValue(state)
    const result = await handleTool('create_milestone', { id: 'dup', title: 'Dup' })
    expect(result.isError).toBe(true)
    expect(result.content[0].text).toContain('already exists')
  })

  it('rejects invalid id', async () => {
    const result = await handleTool('create_milestone', { id: 'Bad-ID', title: 'T' })
    expect(result.isError).toBe(true)
  })
})

describe('add_milestone_task', () => {
  it('adds a task to milestone', async () => {
    const milestone = makeMilestone()
    const state = makeState({ milestones: [milestone] })
    mockReadTracker.mockReturnValue(state)
    const result = await handleTool('add_milestone_task', { milestone_id: 'test_ms', label: 'New Task' })
    expect(result.isError).toBeUndefined()
    expect(result.content[0].text).toContain('test_ms_001')
    expect(milestone.subtasks.length).toBe(1)
    expect(mockWriteTracker).toHaveBeenCalled()
  })

  it('rejects missing milestone', async () => {
    mockReadTracker.mockReturnValue(makeState())
    const result = await handleTool('add_milestone_task', { milestone_id: 'missing', label: 'T' })
    expect(result.isError).toBe(true)
  })
})

describe('start_task', () => {
  it('sets status to in_progress', async () => {
    const task = makeTask()
    const milestone = makeMilestone({ subtasks: [task] })
    const state = makeState({ milestones: [milestone] })
    mockReadTracker.mockReturnValue(state)
    mockFindTask.mockReturnValue({ subtask: task, milestone })
    mockSelectProgress.mockReturnValue({ done: 0, total: 1, pct: 0 })

    const result = await handleTool('start_task', { task_id: 'test_ms_001' })
    expect(result.isError).toBeUndefined()
    expect(task.status).toBe('in_progress')
    expect(task.last_run_id).toMatch(/^run_\d+$/)
    expect(milestone.actual_start).toBe('2026-01-15')
    expect(mockTouchAgent).toHaveBeenCalled()
  })

  it('sets assignee if unassigned', async () => {
    const task = makeTask({ assignee: null })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    await handleTool('start_task', { task_id: 'test_ms_001', agent_id: 'gemini-cli' })
    expect(task.assignee).toBe('gemini-cli')
  })

  it('does not overwrite existing assignee', async () => {
    const task = makeTask({ assignee: 'opencode' })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    await handleTool('start_task', { task_id: 'test_ms_001', agent_id: 'gemini-cli' })
    expect(task.assignee).toBe('opencode')
  })

  it('rejects missing task', async () => {
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue(null)
    const result = await handleTool('start_task', { task_id: 'missing' })
    expect(result.isError).toBe(true)
  })
})

describe('complete_task', () => {
  it('moves task to review', async () => {
    const task = makeTask({ status: 'in_progress', blocked_reason: 'old blocker' })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('complete_task', { task_id: 'test_ms_001', summary: 'Done building' })
    expect(result.isError).toBeUndefined()
    expect(task.status).toBe('review')
    expect(task.blocked_by).toBeNull()
    expect(task.blocked_reason).toBeNull()
    expect(mockWriteTracker).toHaveBeenCalled()
  })
})

describe('approve_task', () => {
  it('moves task to done and triggers unblock', async () => {
    const task = makeTask({ status: 'review' })
    const milestone = makeMilestone({ subtasks: [task] })
    mockReadTracker.mockReturnValue(makeState({ milestones: [milestone] }))
    mockFindTask.mockReturnValue({ subtask: task, milestone })
    mockSelectProgress.mockReturnValue({ done: 1, total: 1, pct: 100 })
    mockAutoUnblock.mockReturnValue(['Unblocked test_ms_002'])

    const result = await handleTool('approve_task', { task_id: 'test_ms_001' })
    expect(result.isError).toBeUndefined()
    expect(task.status).toBe('done')
    expect(task.done).toBe(true)
    expect(task.completed_at).toBeTruthy()
    expect(task.completed_by).toBe('operator')
    expect(result.content[0].text).toContain('Unblocked test_ms_002')
    expect(mockAutoUnblock).toHaveBeenCalled()
  })

  it('rejects if not in review', async () => {
    const task = makeTask({ status: 'todo' })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('approve_task', { task_id: 'test_ms_001' })
    expect(result.isError).toBe(true)
    expect(result.content[0].text).toContain('expected \'review\'')
  })

  it('sets milestone actual_end when all tasks done', async () => {
    const task = makeTask({ status: 'review' })
    const milestone = makeMilestone({ subtasks: [task] })
    mockReadTracker.mockReturnValue(makeState({ milestones: [milestone] }))
    mockFindTask.mockReturnValue({ subtask: task, milestone })
    mockSelectProgress.mockReturnValue({ done: 1, total: 1, pct: 100 })
    await handleTool('approve_task', { task_id: 'test_ms_001' })
    expect(milestone.actual_end).toBe('2026-01-15')
  })
})

describe('reject_task', () => {
  it('moves task back to in_progress', async () => {
    const task = makeTask({ status: 'review' })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('reject_task', { task_id: 'test_ms_001', feedback: 'Fix the tests' })
    expect(result.isError).toBeUndefined()
    expect(task.status).toBe('in_progress')
    expect(result.content[0].text).toContain('revision #1')
    expect(result.content[0].text).toContain('Fix the tests')
  })

  it('rejects if not in review', async () => {
    const task = makeTask({ status: 'in_progress' })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('reject_task', { task_id: 'test_ms_001', feedback: 'Bad' })
    expect(result.isError).toBe(true)
  })
})

describe('block_task / unblock_task', () => {
  it('blocks a task', async () => {
    const task = makeTask()
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('block_task', { task_id: 'test_ms_001', reason: 'API down' })
    expect(result.isError).toBeUndefined()
    expect(task.status).toBe('blocked')
    expect(task.blocked_reason).toBe('API down')
    expect(task.blocked_by).toBe('orchestrator')
  })

  it('unblocks a blocked task', async () => {
    const task = makeTask({ status: 'blocked', blocked_by: 'orchestrator', blocked_reason: 'API down', last_run_id: 'run_1' })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('unblock_task', { task_id: 'test_ms_001', resolution: 'API restored' })
    expect(result.isError).toBeUndefined()
    expect(task.status).toBe('in_progress')
    expect(task.blocked_by).toBeNull()
    expect(task.blocked_reason).toBeNull()
  })

  it('unblock returns todo if no last_run_id', async () => {
    const task = makeTask({ status: 'blocked', blocked_by: 'x', blocked_reason: 'y', last_run_id: null })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    await handleTool('unblock_task', { task_id: 'test_ms_001' })
    expect(task.status).toBe('todo')
  })

  it('unblock rejects if not blocked', async () => {
    const task = makeTask({ status: 'todo' })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('unblock_task', { task_id: 'test_ms_001' })
    expect(result.isError).toBe(true)
  })
})

describe('reset_task', () => {
  it('resets task to todo', async () => {
    const task = makeTask({ status: 'in_progress', assignee: 'agent1', last_run_id: 'run_1' })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('reset_task', { task_id: 'test_ms_001' })
    expect(result.isError).toBeUndefined()
    expect(task.status).toBe('todo')
    expect(task.done).toBe(false)
    expect(task.assignee).toBeNull()
    expect(task.last_run_id).toBeNull()
    expect(result.content[0].text).toContain('in_progress')
  })
})

describe('update_task', () => {
  it('updates specified fields', async () => {
    const task = makeTask()
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('update_task', { task_id: 'test_ms_001', priority: 'P1', notes: 'urgent' })
    expect(result.isError).toBeUndefined()
    expect(task.priority).toBe('P1')
    expect(task.notes).toBe('urgent')
  })

  it('returns no changes message if nothing specified', async () => {
    const task = makeTask()
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('update_task', { task_id: 'test_ms_001' })
    expect(result.content[0].text).toContain('No changes')
  })
})

describe('enrich_task', () => {
  it('enriches task fields', async () => {
    const task = makeTask()
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    const result = await handleTool('enrich_task', {
      task_id: 'test_ms_001',
      prompt: 'Build the feature',
      acceptance_criteria: ['Works', 'Tests pass'],
      context_files: ['src/main.ts'],
    })
    expect(result.isError).toBeUndefined()
    expect(task.prompt).toBe('Build the feature')
    expect(task.acceptance_criteria).toEqual(['Works', 'Tests pass'])
    expect(task.context_files).toEqual(['src/main.ts'])
  })

  it('replaces arrays not merges', async () => {
    const task = makeTask({ acceptance_criteria: ['old'], context_files: ['old.ts'] })
    mockReadTracker.mockReturnValue(makeState())
    mockFindTask.mockReturnValue({ subtask: task, milestone: makeMilestone() })
    await handleTool('enrich_task', { task_id: 'test_ms_001', acceptance_criteria: ['new'] })
    expect(task.acceptance_criteria).toEqual(['new'])
    expect(task.context_files).toEqual(['old.ts'])
  })
})

describe('register_agent', () => {
  it('registers a new agent', async () => {
    const state = makeState()
    mockReadTracker.mockReturnValue(state)
    const result = await handleTool('register_agent', {
      agent_id: 'opencode', name: 'OpenCode', type: 'orchestrator', permissions: ['read', 'write'],
    })
    expect(result.isError).toBeUndefined()
    expect(state.agents.length).toBe(1)
    expect(state.agents[0].name).toBe('OpenCode')
    expect(state.agents[0].status).toBe('active')
  })

  it('updates existing agent', async () => {
    const state = makeState({ agents: [{ id: 'gemini', name: 'Old Name', type: 'sub-agent' as const, color: '#9B9BAA', status: 'idle', permissions: ['read'], last_action_at: null, session_action_count: 5 }] })
    mockReadTracker.mockReturnValue(state)
    const result = await handleTool('register_agent', {
      agent_id: 'gemini', name: 'Gemini CLI', type: 'orchestrator', permissions: ['read', 'write'],
    })
    expect(result.isError).toBeUndefined()
    expect(state.agents.length).toBe(1)
    expect(state.agents[0].name).toBe('Gemini CLI')
    expect(state.agents[0].status).toBe('active')
    expect(state.agents[0].session_action_count).toBe(5)
  })
})

describe('list_tasks', () => {
  it('returns empty when no tasks', async () => {
    mockReadTracker.mockReturnValue(makeState())
    const result = await handleTool('list_tasks', {})
    expect(result.isError).toBeUndefined()
    expect(result.content[0].text).toContain('No tasks')
  })

  it('filters by status', async () => {
    const t1 = makeTask({ id: 't1', status: 'todo' })
    const t2 = makeTask({ id: 't2', status: 'done', done: true })
    mockReadTracker.mockReturnValue(makeState({ milestones: [makeMilestone({ subtasks: [t1, t2] })] }))
    const result = await handleTool('list_tasks', { status: 'done' })
    expect(result.content[0].text).toContain('t2')
    expect(result.content[0].text).not.toContain('t1')
  })
})

describe('get_project_status', () => {
  it('returns project status', async () => {
    mockReadTracker.mockReturnValue(makeState())
    const result = await handleTool('get_project_status', {})
    expect(result.isError).toBeUndefined()
    expect(result.content[0].text).toBe('project status')
  })
})

describe('log_action', () => {
  it('appends to agent_log', async () => {
    const state = makeState()
    mockReadTracker.mockReturnValue(state)
    const result = await handleTool('log_action', { task_id: 'test_ms_001', action: 'file_created', description: 'Created index.ts' })
    expect(result.isError).toBeUndefined()
    expect(state.agent_log.length).toBe(1)
    expect(state.agent_log[0].action).toBe('file_created')
    expect(state.agent_log[0].tags).toContain('mcp')
  })
})

describe('invalid inputs', () => {
  it('rejects unknown tool', async () => {
    const result = await handleTool('nonexistent', {})
    expect(result.isError).toBe(true)
    expect(result.content[0].text).toContain('Unknown tool')
  })

  it('rejects invalid create_milestone input', async () => {
    const result = await handleTool('create_milestone', { id: '', title: '' })
    expect(result.isError).toBe(true)
    expect(result.content[0].text).toContain('Invalid input')
  })

  it('rejects invalid start_task input', async () => {
    const result = await handleTool('start_task', {})
    expect(result.isError).toBe(true)
  })
})

describe('add_milestone_note', () => {
  it('adds note to milestone', async () => {
    const milestone = makeMilestone()
    mockReadTracker.mockReturnValue(makeState({ milestones: [milestone] }))
    const result = await handleTool('add_milestone_note', { milestone_id: 'test_ms', note: 'Must pass tests' })
    expect(result.isError).toBeUndefined()
    expect(milestone.notes).toContain('Must pass tests')
  })

  it('rejects missing milestone', async () => {
    mockReadTracker.mockReturnValue(makeState())
    const result = await handleTool('add_milestone_note', { milestone_id: 'missing', note: 'x' })
    expect(result.isError).toBe(true)
  })
})

describe('set_milestone_dates', () => {
  it('sets actual_start and calculates drift', async () => {
    const milestone = makeMilestone({ planned_start: '2026-01-06' })
    mockReadTracker.mockReturnValue(makeState({ milestones: [milestone] }))
    const result = await handleTool('set_milestone_dates', { milestone_id: 'test_ms', actual_start: '2026-01-10' })
    expect(result.isError).toBeUndefined()
    expect(milestone.actual_start).toBe('2026-01-10')
    expect(milestone.drift_days).toBe(4)
  })
})

describe('update_drift', () => {
  it('updates drift days', async () => {
    const milestone = makeMilestone({ drift_days: 0 })
    mockReadTracker.mockReturnValue(makeState({ milestones: [milestone] }))
    const result = await handleTool('update_drift', { milestone_id: 'test_ms', drift_days: -5 })
    expect(result.isError).toBeUndefined()
    expect(milestone.drift_days).toBe(-5)
  })
})
