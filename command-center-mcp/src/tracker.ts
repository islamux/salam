import path from 'node:path'
import fs from 'node:fs'
import os from 'node:os'
import pino from 'pino'
import { backupTracker } from './backup.js'
import { appendUndoEntry } from './backup.js'

const CURRENT_SCHEMA_VERSION = 1

export interface TrackerState {
  schemaVersion: number
  project: ProjectMeta
  milestones: Milestone[]
  agents: Agent[]
  agent_log: AgentLogEntry[]
  schedule: { phases: Phase[] }
}

export interface ProjectMeta {
  name: string
  start_date: string
  target_date: string
  current_week: number
  schedule_status: 'on_track' | 'behind' | 'ahead'
  overall_progress: number
}

export interface Milestone {
  id: string
  title: string
  domain: string
  week: number
  phase: string
  planned_start: string | null
  planned_end: string | null
  actual_start: string | null
  actual_end: string | null
  drift_days: number
  is_key_milestone: boolean
  key_milestone_label: string | null
  subtasks: Subtask[]
  dependencies: string[]
  notes: string[]
}

export interface Subtask {
  id: string
  label: string
  status: 'todo' | 'in_progress' | 'review' | 'done' | 'blocked'
  done: boolean
  assignee: string | null
  blocked_by: string | null
  blocked_reason: string | null
  completed_at: string | null
  completed_by: string | null
  priority: string
  notes: string | null
  prompt: string | null
  context_files: string[]
  reference_docs: string[]
  acceptance_criteria: string[]
  constraints: string[]
  agent_target: string | null
  execution_mode: 'human' | 'agent' | 'pair'
  depends_on: string[]
  last_run_id: string | null
  builder_prompt: string | null
}

export interface Agent {
  id: string
  name: string
  type: 'orchestrator' | 'sub-agent' | 'human' | 'external'
  parent_id?: string
  color: string
  status: string
  permissions: string[]
  last_action_at: string | null
  session_action_count: number
}

export interface AgentLogEntry {
  id: string
  agent_id: string
  action: string
  target_type: string
  target_id: string
  description: string
  timestamp: string
  tags: string[]
}

export interface Phase {
  id: string
  title: string
  start_week: number
  end_week: number
}

export interface FindTaskResult {
  subtask: Subtask
  milestone: Milestone
}

export const PROJECT_ROOT = process.env.PROJECT_ROOT
  ?? (() => {
    try {
      const envPath = path.resolve('.env')
      const content = fs.readFileSync(envPath, 'utf-8')
      const match = content.match(/^PROJECT_ROOT=(.+)$/m)
      return match ? match[1].trim() : process.cwd()
    } catch {
      return process.cwd()
    }
  })()

export const TRACKER_PATH = path.resolve(path.join(PROJECT_ROOT, 'project-tracker.json'))

const logger = pino({
  level: process.env.LOG_LEVEL ?? 'info',
  transport: {
    targets: [
      {
        target: 'pino/file',
        options: {
          destination: path.join(os.homedir(), '.command-center', 'logs', 'command-center.log'),
          mkdir: true,
        },
      },
    ],
  },
})

export { logger }

export function migrateTracker(state: any): TrackerState {
  let version = state.schemaVersion ?? 0
  while (version < CURRENT_SCHEMA_VERSION) {
    switch (version) {
      case 0:
        state.schemaVersion = 1
        break
    }
    version++
  }
  return state as TrackerState
}

export function readTracker(): TrackerState {
  const raw = fs.readFileSync(TRACKER_PATH, 'utf-8')
  const parsed = JSON.parse(raw)
  return migrateTracker(parsed)
}

export function writeTracker(state: TrackerState, toolName?: string): void {
  const total = state.milestones.reduce((s, m) => s + m.subtasks.length, 0)
  const done = state.milestones.reduce((s, m) =>
    s + m.subtasks.filter(t => t.done).length, 0)
  state.project.overall_progress = total > 0
    ? parseFloat((done / total).toFixed(4))
    : 0
  state.project.current_week = selectCurrentWeek(state)
  state.project.schedule_status = selectScheduleStatus(state)
  state.schemaVersion = CURRENT_SCHEMA_VERSION

  backupTracker(TRACKER_PATH)
  fs.writeFileSync(TRACKER_PATH, JSON.stringify(state, null, 2))
  logger.debug({ tool: toolName, milestones: state.milestones.length, tasks: total }, 'tracker written')
}

export function findTask(state: TrackerState, taskId: string): FindTaskResult | null {
  for (const milestone of state.milestones) {
    const subtask = milestone.subtasks.find(t => t.id === taskId)
    if (subtask) return { subtask, milestone }
  }
  return null
}

export function touchAgent(state: TrackerState, agentId: string = 'orchestrator'): void {
  const agent = state.agents.find(a => a.id === agentId)
  if (agent) {
    agent.last_action_at = new Date().toISOString()
    agent.session_action_count += 1
    agent.status = 'active'
  }
}

export function autoUnblockDependents(
  state: TrackerState,
  completedTaskId: string,
  completedMilestoneId: string,
): string[] {
  const unblocked: string[] = []

  for (const milestone of state.milestones) {
    for (const subtask of milestone.subtasks) {
      if (!subtask.depends_on.includes(completedTaskId)) continue
      if (subtask.status !== 'blocked') continue

      const allDepsDone = subtask.depends_on.every(depId => {
        const found = findTask(state, depId)
        return found && found.subtask.status === 'done'
      })

      if (allDepsDone) {
        subtask.status = 'todo'
        subtask.blocked_by = null
        subtask.blocked_reason = null
        unblocked.push(`Unblocked task ${subtask.id} in milestone ${milestone.id}`)
        state.agent_log.push({
          id: `log_${Date.now()}_${Math.random().toString(36).slice(2, 8)}`,
          agent_id: 'system',
          action: 'task_auto_unblocked',
          target_type: 'subtask',
          target_id: subtask.id,
          description: `Auto-unblocked after task ${completedTaskId} completed`,
          timestamp: new Date().toISOString(),
          tags: ['auto-unblock', 'system'],
        })
      }
    }
  }

  const completedMilestone = state.milestones.find(m => m.id === completedMilestoneId)
  if (completedMilestone) {
    const allDone = completedMilestone.subtasks.every(t => t.done)
    if (allDone) {
      for (const milestone of state.milestones) {
        if (!milestone.dependencies.includes(completedMilestoneId)) continue
        const allDepsDone = milestone.dependencies.every(depId => {
          const dep = state.milestones.find(m => m.id === depId)
          return dep && dep.subtasks.every(t => t.done)
        })
        if (allDepsDone) {
          for (const subtask of milestone.subtasks) {
            if (subtask.status === 'blocked') {
              subtask.status = 'todo'
              subtask.blocked_by = null
              subtask.blocked_reason = null
              unblocked.push(`Unblocked task ${subtask.id} in downstream milestone ${milestone.id}`)
            }
          }
        }
      }
    }
  }

  return unblocked
}

export function selectCurrentWeek(tracker: TrackerState): number {
  const start = new Date(tracker.project.start_date)
  const now = new Date()
  const diffDays = (now.getTime() - start.getTime()) / (1000 * 60 * 60 * 24)
  const totalWeeks = Math.ceil(
    (new Date(tracker.project.target_date).getTime() - start.getTime())
    / (1000 * 60 * 60 * 24 * 7)
  )
  return Math.max(1, Math.min(totalWeeks, Math.floor(diffDays / 7) + 1))
}

export function selectCurrentWeekFractional(tracker: TrackerState): number {
  const start = new Date(tracker.project.start_date)
  const now = new Date()
  const diffDays = (now.getTime() - start.getTime()) / (1000 * 60 * 60 * 24)
  const totalWeeks = Math.ceil(
    (new Date(tracker.project.target_date).getTime() - start.getTime())
    / (1000 * 60 * 60 * 24 * 7)
  )
  return Math.max(1, Math.min(totalWeeks + 0.99, diffDays / 7 + 1))
}

export function selectCurrentPhase(tracker: TrackerState): string {
  const week = selectCurrentWeek(tracker)
  const phase = tracker.schedule.phases.find(
    p => week >= p.start_week && week <= p.end_week
  )
  return phase?.title ?? ''
}

export function selectScheduleStatus(tracker: TrackerState): 'on_track' | 'behind' | 'ahead' {
  if (tracker.milestones.length === 0) return 'on_track'
  const drifts = tracker.milestones.map(m => m.drift_days)
  if (Math.max(...drifts) > 3) return 'behind'
  if (Math.min(...drifts) < -3) return 'ahead'
  return 'on_track'
}

export function selectMilestoneProgress(milestone: Milestone): { done: number; total: number; pct: number } {
  const total = milestone.subtasks.length
  const done = milestone.subtasks.filter(t => t.done).length
  return { done, total, pct: total > 0 ? Math.round((done / total) * 100) : 0 }
}

export function generateTaskId(milestoneId: string, existingSubtasks: Subtask[]): string {
  const nnn = String(existingSubtasks.length + 1).padStart(3, '0')
  return `${milestoneId}_${nnn}`
}

export function generateLogId(): string {
  return `log_${Date.now()}_${Math.random().toString(36).slice(2, 8)}`
}

export function todayDateString(): string {
  return new Date().toISOString().split('T')[0]
}
