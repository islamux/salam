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
