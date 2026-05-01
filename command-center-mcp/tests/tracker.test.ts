import { describe, it, expect, vi, beforeEach } from 'vitest'
import type { TrackerState, Milestone, Subtask } from '../src/tracker.js'

vi.mock('pino', () => ({
  default: () => ({ info: vi.fn(), debug: vi.fn(), error: vi.fn(), warn: vi.fn() }),
}))

vi.mock('../src/backup.js', () => ({
  backupTracker: vi.fn(),
  appendUndoEntry: vi.fn(),
}))

import {
  migrateTracker, findTask, autoUnblockDependents,
  selectScheduleStatus, selectMilestoneProgress, generateTaskId,
  selectCurrentWeek, todayDateString,
} from '../src/tracker.js'

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
    id: 'ms1', title: 'Milestone 1', domain: 'core', week: 1, phase: 'p1',
    planned_start: '2026-01-06', planned_end: '2026-01-31',
    actual_start: null, actual_end: null, drift_days: 0,
    is_key_milestone: false, key_milestone_label: null,
    subtasks: [], dependencies: [], notes: [],
    ...overrides,
  }
}

function makeTask(overrides: Partial<Subtask> = {}): Subtask {
  return {
    id: 'ms1_001', label: 'Task 1', status: 'todo', done: false,
    assignee: null, blocked_by: null, blocked_reason: null,
    completed_at: null, completed_by: null, priority: 'P2', notes: null,
    prompt: null, context_files: [], reference_docs: [],
    acceptance_criteria: [], constraints: [],
    agent_target: null, execution_mode: 'agent',
    depends_on: [], last_run_id: null, builder_prompt: null,
    ...overrides,
  }
}

describe('migrateTracker', () => {
  it('adds schemaVersion to unversioned tracker', () => {
    const state = migrateTracker({ project: {} })
    expect(state.schemaVersion).toBe(1)
  })

  it('preserves existing schemaVersion', () => {
    const state = migrateTracker({ schemaVersion: 1, project: {} })
    expect(state.schemaVersion).toBe(1)
  })

  it('migrates from version 0 to 1', () => {
    const raw = { project: { name: 'Test' }, milestones: [], agents: [], agent_log: [], schedule: { phases: [] } }
    const state = migrateTracker(raw)
    expect(state.schemaVersion).toBe(1)
    expect(state.project.name).toBe('Test')
  })
})

describe('findTask', () => {
  it('finds an existing task', () => {
    const task = makeTask()
    const milestone = makeMilestone({ subtasks: [task] })
    const state = makeState({ milestones: [milestone] })
    const result = findTask(state, 'ms1_001')
    expect(result).not.toBeNull()
    expect(result!.subtask.id).toBe('ms1_001')
    expect(result!.milestone.id).toBe('ms1')
  })

  it('returns null for non-existent task', () => {
    const state = makeState({ milestones: [makeMilestone()] })
    expect(findTask(state, 'nonexistent')).toBeNull()
  })

  it('returns null when no milestones', () => {
    const state = makeState()
    expect(findTask(state, 'any')).toBeNull()
  })

  it('finds task across multiple milestones', () => {
    const task1 = makeTask({ id: 'ms1_001' })
    const task2 = makeTask({ id: 'ms2_001' })
    const state = makeState({
      milestones: [
        makeMilestone({ id: 'ms1', subtasks: [task1] }),
        makeMilestone({ id: 'ms2', subtasks: [task2] }),
      ],
    })
    expect(findTask(state, 'ms2_001')!.milestone.id).toBe('ms2')
  })
})

describe('autoUnblockDependents', () => {
  it('unblocks dependent tasks when all dependencies are done', () => {
    const depTask = makeTask({ id: 'ms1_001', status: 'done', done: true })
    const blockedTask = makeTask({ id: 'ms2_001', status: 'blocked', depends_on: ['ms1_001'], blocked_by: 'ms1_001', blocked_reason: 'waiting' })
    const state = makeState({
      milestones: [
        makeMilestone({ id: 'ms1', subtasks: [depTask] }),
        makeMilestone({ id: 'ms2', subtasks: [blockedTask] }),
      ],
    })
    const result = autoUnblockDependents(state, 'ms1_001', 'ms1')
    expect(result.length).toBe(1)
    expect(blockedTask.status).toBe('todo')
    expect(blockedTask.blocked_by).toBeNull()
    expect(blockedTask.blocked_reason).toBeNull()
  })

  it('does not unblock if not all dependencies are done', () => {
    const depTask = makeTask({ id: 'ms1_001', status: 'done', done: true })
    const otherDep = makeTask({ id: 'ms1_002', status: 'in_progress', done: false })
    const blockedTask = makeTask({ id: 'ms2_001', status: 'blocked', depends_on: ['ms1_001', 'ms1_002'], blocked_by: 'ms1', blocked_reason: 'waiting' })
    const state = makeState({
      milestones: [
        makeMilestone({ id: 'ms1', subtasks: [depTask, otherDep] }),
        makeMilestone({ id: 'ms2', subtasks: [blockedTask] }),
      ],
    })
    const result = autoUnblockDependents(state, 'ms1_001', 'ms1')
    expect(result.length).toBe(0)
    expect(blockedTask.status).toBe('blocked')
  })

  it('does not unblock non-blocked tasks', () => {
    const depTask = makeTask({ id: 'ms1_001', status: 'done', done: true })
    const todoTask = makeTask({ id: 'ms2_001', status: 'todo', depends_on: ['ms1_001'] })
    const state = makeState({
      milestones: [
        makeMilestone({ id: 'ms1', subtasks: [depTask] }),
        makeMilestone({ id: 'ms2', subtasks: [todoTask] }),
      ],
    })
    const result = autoUnblockDependents(state, 'ms1_001', 'ms1')
    expect(result.length).toBe(0)
    expect(todoTask.status).toBe('todo')
  })

  it('unblocks downstream milestone tasks when parent milestone completes', () => {
    const doneTask = makeTask({ id: 'ms1_001', status: 'done', done: true })
    const blockedTask = makeTask({ id: 'ms2_001', status: 'blocked', blocked_by: 'ms1', blocked_reason: 'waiting for ms1' })
    const state = makeState({
      milestones: [
        makeMilestone({ id: 'ms1', subtasks: [doneTask] }),
        makeMilestone({ id: 'ms2', subtasks: [blockedTask], dependencies: ['ms1'] }),
      ],
    })
    const result = autoUnblockDependents(state, 'ms1_001', 'ms1')
    expect(result.length).toBe(1)
    expect(result[0]).toContain('downstream milestone ms2')
    expect(blockedTask.status).toBe('todo')
  })

  it('returns empty array when no dependents', () => {
    const task = makeTask({ id: 'ms1_001', status: 'done', done: true })
    const state = makeState({ milestones: [makeMilestone({ subtasks: [task] })] })
    expect(autoUnblockDependents(state, 'ms1_001', 'ms1')).toEqual([])
  })

  it('logs auto-unblock actions to agent_log', () => {
    const depTask = makeTask({ id: 'ms1_001', status: 'done', done: true })
    const blockedTask = makeTask({ id: 'ms2_001', status: 'blocked', depends_on: ['ms1_001'], blocked_by: 'ms1', blocked_reason: 'waiting' })
    const state = makeState({
      milestones: [
        makeMilestone({ id: 'ms1', subtasks: [depTask] }),
        makeMilestone({ id: 'ms2', subtasks: [blockedTask] }),
      ],
    })
    const logLenBefore = state.agent_log.length
    autoUnblockDependents(state, 'ms1_001', 'ms1')
    expect(state.agent_log.length).toBe(logLenBefore + 1)
    expect(state.agent_log[state.agent_log.length - 1].action).toBe('task_auto_unblocked')
    expect(state.agent_log[state.agent_log.length - 1].agent_id).toBe('system')
  })
})

describe('selectScheduleStatus', () => {
  it('returns on_track with no milestones', () => {
    expect(selectScheduleStatus(makeState())).toBe('on_track')
  })

  it('returns on_track when all drift is within threshold', () => {
    const state = makeState({
      milestones: [
        makeMilestone({ id: 'ms1', drift_days: 2 }),
        makeMilestone({ id: 'ms2', drift_days: -2 }),
      ],
    })
    expect(selectScheduleStatus(state)).toBe('on_track')
  })

  it('returns behind when max drift exceeds 3', () => {
    const state = makeState({
      milestones: [makeMilestone({ id: 'ms1', drift_days: 5 })],
    })
    expect(selectScheduleStatus(state)).toBe('behind')
  })

  it('returns ahead when min drift below -3', () => {
    const state = makeState({
      milestones: [makeMilestone({ id: 'ms1', drift_days: -5 })],
    })
    expect(selectScheduleStatus(state)).toBe('ahead')
  })
})

describe('selectMilestoneProgress', () => {
  it('returns 0/0 for empty milestone', () => {
    const result = selectMilestoneProgress(makeMilestone())
    expect(result).toEqual({ done: 0, total: 0, pct: 0 })
  })

  it('counts done tasks correctly', () => {
    const milestone = makeMilestone({
      subtasks: [
        makeTask({ id: 't1', done: true, status: 'done' }),
        makeTask({ id: 't2', done: false, status: 'todo' }),
        makeTask({ id: 't3', done: true, status: 'done' }),
      ],
    })
    const result = selectMilestoneProgress(milestone)
    expect(result).toEqual({ done: 2, total: 3, pct: 67 })
  })

  it('returns 100% when all done', () => {
    const milestone = makeMilestone({
      subtasks: [
        makeTask({ id: 't1', done: true, status: 'done' }),
        makeTask({ id: 't2', done: true, status: 'done' }),
      ],
    })
    expect(selectMilestoneProgress(milestone)).toEqual({ done: 2, total: 2, pct: 100 })
  })
})

describe('generateTaskId', () => {
  it('generates first task ID', () => {
    expect(generateTaskId('ms1', [])).toBe('ms1_001')
  })

  it('increments based on existing tasks', () => {
    const existing = [makeTask({ id: 'ms1_001' }), makeTask({ id: 'ms1_002' })]
    expect(generateTaskId('ms1', existing)).toBe('ms1_003')
  })

  it('zero-pads to 3 digits', () => {
    const existing = Array.from({ length: 9 }, (_, i) => makeTask({ id: `ms1_${String(i + 1).padStart(3, '0')}` }))
    expect(generateTaskId('ms1', existing)).toBe('ms1_010')
  })
})

describe('selectCurrentWeek', () => {
  it('calculates week from start date', () => {
    const state = makeState()
    state.project.start_date = '2026-01-01'
    const week = selectCurrentWeek(state)
    expect(week).toBeGreaterThanOrEqual(1)
  })

  it('returns 1 if before start date', () => {
    const state = makeState()
    state.project.start_date = '2099-01-01'
    state.project.target_date = '2099-06-30'
    expect(selectCurrentWeek(state)).toBe(1)
  })
})

describe('todayDateString', () => {
  it('returns YYYY-MM-DD format', () => {
    const d = todayDateString()
    expect(d).toMatch(/^\d{4}-\d{2}-\d{2}$/)
  })
})
