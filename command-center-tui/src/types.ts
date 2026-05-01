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

export type TabId = 'swim-lane' | 'task-board' | 'agent-hub' | 'calendar'

export interface TUIState {
  tracker: TrackerState | null
  loading: boolean
  error: string | null
  synced: boolean
  activeTab: TabId
  selectedMilestoneIndex: number
  theme: 'dark' | 'light'
}
