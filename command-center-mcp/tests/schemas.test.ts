import { describe, it, expect } from 'vitest'
import {
  CreateMilestoneSchema, AddMilestoneTaskSchema, StartTaskSchema,
  CompleteTaskSchema, ApproveTaskSchema, RejectTaskSchema,
  BlockTaskSchema, UnblockTaskSchema, UpdateTaskSchema,
  EnrichTaskSchema, LogActionSchema, RegisterAgentSchema,
  SetMilestoneDatesSchema, UpdateDriftSchema, AddMilestoneNoteSchema,
  ListTasksSchema, GetActivityFeedSchema, GetTaskContextSchema,
  GetMilestoneOverviewSchema, GetTaskHistorySchema,
} from '../src/schemas.js'
import type { z } from 'zod'

function ok(schema: z.ZodTypeAny, input: unknown) {
  expect(schema.safeParse(input).success).toBe(true)
}

function fail(schema: z.ZodTypeAny, input: unknown) {
  expect(schema.safeParse(input).success).toBe(false)
}

describe('CreateMilestoneSchema', () => {
  it('accepts valid input', () => ok(CreateMilestoneSchema, { id: 'my_milestone', title: 'Test' }))
  it('rejects non-snake_case id', () => fail(CreateMilestoneSchema, { id: 'My-Milestone', title: 'Test' }))
  it('rejects empty title', () => fail(CreateMilestoneSchema, { id: 'test', title: '' }))
  it('defaults domain to general', () => {
    expect(CreateMilestoneSchema.parse({ id: 'test', title: 'T' }).domain).toBe('general')
  })
  it('accepts optional dates', () => ok(CreateMilestoneSchema, { id: 't', title: 'T', planned_start: '2026-01-01', planned_end: '2026-06-30' }))
  it('rejects invalid date format', () => fail(CreateMilestoneSchema, { id: 't', title: 'T', planned_start: '01-01-2026' }))
})

describe('AddMilestoneTaskSchema', () => {
  it('accepts valid input', () => ok(AddMilestoneTaskSchema, { milestone_id: 'ms1', label: 'Task' }))
  it('defaults priority to P2', () => {
    expect(AddMilestoneTaskSchema.parse({ milestone_id: 'ms1', label: 'T' }).priority).toBe('P2')
  })
  it('defaults execution_mode to agent', () => {
    expect(AddMilestoneTaskSchema.parse({ milestone_id: 'ms1', label: 'T' }).execution_mode).toBe('agent')
  })
  it('rejects empty label', () => fail(AddMilestoneTaskSchema, { milestone_id: 'ms1', label: '' }))
  it('rejects invalid priority', () => fail(AddMilestoneTaskSchema, { milestone_id: 'ms1', label: 'T', priority: 'P5' }))
  it('rejects invalid execution_mode', () => fail(AddMilestoneTaskSchema, { milestone_id: 'ms1', label: 'T', execution_mode: 'auto' }))
  it('accepts all valid priorities', () => {
    for (const p of ['P1', 'P2', 'P3', 'P4']) {
      ok(AddMilestoneTaskSchema, { milestone_id: 'ms1', label: 'T', priority: p })
    }
  })
})

describe('StartTaskSchema', () => {
  it('accepts valid input', () => ok(StartTaskSchema, { task_id: 't1' }))
  it('defaults agent_id to orchestrator', () => {
    expect(StartTaskSchema.parse({ task_id: 't1' }).agent_id).toBe('orchestrator')
  })
  it('rejects empty task_id', () => fail(StartTaskSchema, { task_id: '' }))
})

describe('CompleteTaskSchema', () => {
  it('accepts valid input', () => ok(CompleteTaskSchema, { task_id: 't1', summary: 'Done' }))
  it('rejects empty summary', () => fail(CompleteTaskSchema, { task_id: 't1', summary: '' }))
  it('rejects too-long summary', () => fail(CompleteTaskSchema, { task_id: 't1', summary: 'x'.repeat(1001) }))
})

describe('ApproveTaskSchema', () => {
  it('accepts with no feedback', () => ok(ApproveTaskSchema, { task_id: 't1' }))
  it('accepts with feedback', () => ok(ApproveTaskSchema, { task_id: 't1', feedback: 'Looks good' }))
  it('rejects too-long feedback', () => fail(ApproveTaskSchema, { task_id: 't1', feedback: 'x'.repeat(501) }))
})

describe('RejectTaskSchema', () => {
  it('accepts valid input', () => ok(RejectTaskSchema, { task_id: 't1', feedback: 'Fix it' }))
  it('rejects empty feedback', () => fail(RejectTaskSchema, { task_id: 't1', feedback: '' }))
  it('rejects missing feedback', () => fail(RejectTaskSchema, { task_id: 't1' }))
})

describe('BlockTaskSchema', () => {
  it('accepts valid input', () => ok(BlockTaskSchema, { task_id: 't1', reason: 'Waiting on API' }))
  it('rejects empty reason', () => fail(BlockTaskSchema, { task_id: 't1', reason: '' }))
  it('rejects too-long reason', () => fail(BlockTaskSchema, { task_id: 't1', reason: 'x'.repeat(501) }))
})

describe('UnblockTaskSchema', () => {
  it('accepts with no resolution', () => ok(UnblockTaskSchema, { task_id: 't1' }))
  it('accepts with resolution', () => ok(UnblockTaskSchema, { task_id: 't1', resolution: 'API fixed' }))
  it('rejects empty task_id', () => fail(UnblockTaskSchema, { task_id: '' }))
})

describe('UpdateTaskSchema', () => {
  it('accepts partial updates', () => ok(UpdateTaskSchema, { task_id: 't1', priority: 'P1' }))
  it('accepts all optional fields', () => ok(UpdateTaskSchema, { task_id: 't1', priority: 'P1', assignee: 'agent1', execution_mode: 'human', notes: 'updated' }))
  it('rejects invalid priority', () => fail(UpdateTaskSchema, { task_id: 't1', priority: 'P5' }))
  it('rejects invalid execution_mode', () => fail(UpdateTaskSchema, { task_id: 't1', execution_mode: 'auto' }))
})

describe('EnrichTaskSchema', () => {
  it('accepts with no enrichment fields', () => ok(EnrichTaskSchema, { task_id: 't1' }))
  it('accepts all enrichment fields', () => ok(EnrichTaskSchema, {
    task_id: 't1', prompt: 'Build X', builder_prompt: 'docs/prompt.md',
    acceptance_criteria: ['Works'], constraints: ['No deps'],
    context_files: ['src/main.ts'], reference_docs: ['https://example.com'],
  }))
  it('rejects empty task_id', () => fail(EnrichTaskSchema, { task_id: '' }))
})

describe('LogActionSchema', () => {
  it('accepts valid input', () => ok(LogActionSchema, { task_id: 't1', action: 'test', description: 'ran test' }))
  it('defaults agent_id to orchestrator', () => {
    expect(LogActionSchema.parse({ task_id: 't1', action: 'a', description: 'd' }).agent_id).toBe('orchestrator')
  })
  it('rejects too-long action', () => fail(LogActionSchema, { task_id: 't1', action: 'x'.repeat(101), description: 'd' }))
  it('rejects too-long description', () => fail(LogActionSchema, { task_id: 't1', action: 'a', description: 'x'.repeat(1001) }))
  it('accepts tags', () => ok(LogActionSchema, { task_id: 't1', action: 'a', description: 'd', tags: ['test', 'ci'] }))
})

describe('RegisterAgentSchema', () => {
  it('accepts valid input', () => ok(RegisterAgentSchema, { agent_id: 'a1', name: 'Agent One', type: 'orchestrator', permissions: ['read', 'write'] }))
  it('defaults color', () => {
    expect(RegisterAgentSchema.parse({ agent_id: 'a1', name: 'A', type: 'sub-agent', permissions: ['read'] }).color).toBe('#9B9BAA')
  })
  it('rejects invalid type', () => fail(RegisterAgentSchema, { agent_id: 'a1', name: 'A', type: 'invalid', permissions: ['read'] }))
  it('rejects empty permissions', () => fail(RegisterAgentSchema, { agent_id: 'a1', name: 'A', type: 'human', permissions: [] }))
  it('rejects invalid permission', () => fail(RegisterAgentSchema, { agent_id: 'a1', name: 'A', type: 'human', permissions: ['execute'] }))
  it('rejects invalid color', () => fail(RegisterAgentSchema, { agent_id: 'a1', name: 'A', type: 'human', permissions: ['read'], color: 'red' }))
  it('accepts valid color', () => ok(RegisterAgentSchema, { agent_id: 'a1', name: 'A', type: 'human', permissions: ['read'], color: '#22c55e' }))
  it('accepts parent_id for sub-agents', () => ok(RegisterAgentSchema, { agent_id: 'sub1', name: 'Sub', type: 'sub-agent', permissions: ['read'], parent_id: 'a1' }))
})

describe('SetMilestoneDatesSchema', () => {
  it('accepts actual_start', () => ok(SetMilestoneDatesSchema, { milestone_id: 'ms1', actual_start: '2026-01-15' }))
  it('accepts actual_end', () => ok(SetMilestoneDatesSchema, { milestone_id: 'ms1', actual_end: '2026-02-15' }))
  it('accepts both', () => ok(SetMilestoneDatesSchema, { milestone_id: 'ms1', actual_start: '2026-01-15', actual_end: '2026-02-15' }))
  it('rejects invalid date', () => fail(SetMilestoneDatesSchema, { milestone_id: 'ms1', actual_start: 'Jan 15' }))
})

describe('UpdateDriftSchema', () => {
  it('accepts valid input', () => ok(UpdateDriftSchema, { milestone_id: 'ms1', drift_days: 5 }))
  it('accepts negative drift', () => ok(UpdateDriftSchema, { milestone_id: 'ms1', drift_days: -3 }))
  it('rejects non-integer', () => fail(UpdateDriftSchema, { milestone_id: 'ms1', drift_days: 1.5 }))
  it('rejects missing drift_days', () => fail(UpdateDriftSchema, { milestone_id: 'ms1' }))
})

describe('AddMilestoneNoteSchema', () => {
  it('accepts valid input', () => ok(AddMilestoneNoteSchema, { milestone_id: 'ms1', note: 'Exit criterion' }))
  it('rejects empty note', () => fail(AddMilestoneNoteSchema, { milestone_id: 'ms1', note: '' }))
  it('rejects too-long note', () => fail(AddMilestoneNoteSchema, { milestone_id: 'ms1', note: 'x'.repeat(501) }))
})

describe('ListTasksSchema', () => {
  it('accepts empty filters', () => ok(ListTasksSchema, {}))
  it('accepts all filters', () => ok(ListTasksSchema, { milestone_id: 'ms1', status: 'in_progress', domain: 'core' }))
  it('rejects invalid status', () => fail(ListTasksSchema, { status: 'unknown' }))
  it('accepts all valid statuses', () => {
    for (const s of ['todo', 'in_progress', 'review', 'done', 'blocked']) {
      ok(ListTasksSchema, { status: s })
    }
  })
})

describe('GetActivityFeedSchema', () => {
  it('accepts empty input', () => ok(GetActivityFeedSchema, {}))
  it('defaults limit to 30', () => {
    expect(GetActivityFeedSchema.parse({}).limit).toBe(30)
  })
  it('accepts custom limit', () => ok(GetActivityFeedSchema, { limit: 50 }))
  it('rejects limit over 200', () => fail(GetActivityFeedSchema, { limit: 201 }))
  it('rejects limit under 1', () => fail(GetActivityFeedSchema, { limit: 0 }))
  it('accepts agent_id filter', () => ok(GetActivityFeedSchema, { agent_id: 'a1' }))
})

describe('GetTaskContextSchema', () => {
  it('accepts valid input', () => ok(GetTaskContextSchema, { task_id: 't1' }))
  it('rejects empty task_id', () => fail(GetTaskContextSchema, { task_id: '' }))
  it('rejects missing task_id', () => fail(GetTaskContextSchema, {}))
})

describe('GetMilestoneOverviewSchema', () => {
  it('accepts valid input', () => ok(GetMilestoneOverviewSchema, { milestone_id: 'ms1' }))
  it('rejects empty milestone_id', () => fail(GetMilestoneOverviewSchema, { milestone_id: '' }))
})

describe('GetTaskHistorySchema', () => {
  it('accepts valid input', () => ok(GetTaskHistorySchema, { task_id: 't1' }))
  it('rejects empty task_id', () => fail(GetTaskHistorySchema, { task_id: '' }))
})
