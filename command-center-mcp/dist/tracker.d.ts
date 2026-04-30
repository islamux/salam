export interface ProjectMeta {
    name: string;
    start_date: string;
    target_date: string;
    current_week: number;
    schedule_status: 'on_track' | 'behind' | 'ahead';
    overall_progress: number;
}
export interface Subtask {
    id: string;
    label: string;
    status: 'todo' | 'in_progress' | 'review' | 'done' | 'blocked';
    done: boolean;
    assignee: string | null;
    blocked_by: string | null;
    blocked_reason: string | null;
    completed_at: string | null;
    completed_by: string | null;
    priority: string;
    notes: string | null;
    prompt: string | null;
    context_files: string[];
    reference_docs: string[];
    acceptance_criteria: string[];
    constraints: string[];
    agent_target: string | null;
    execution_mode: 'human' | 'agent' | 'pair';
    depends_on: string[];
    last_run_id: string | null;
    builder_prompt: string | null;
}
export interface Milestone {
    id: string;
    title: string;
    domain: string;
    week: number;
    phase: string;
    planned_start: string | null;
    planned_end: string | null;
    actual_start: string | null;
    actual_end: string | null;
    drift_days: number;
    is_key_milestone: boolean;
    key_milestone_label: string | null;
    subtasks: Subtask[];
    dependencies: string[];
    notes: string[];
}
export interface Agent {
    id: string;
    name: string;
    type: 'orchestrator' | 'sub-agent' | 'human' | 'external';
    parent_id?: string;
    color: string;
    status: string;
    permissions: string[];
    last_action_at: string | null;
    session_action_count: number;
}
export interface AgentLogEntry {
    id: string;
    agent_id: string;
    action: string;
    target_type: string;
    target_id: string;
    description: string;
    timestamp: string;
    tags: string[];
}
export interface Phase {
    id: string;
    title: string;
    start_week: number;
    end_week: number;
}
export interface TrackerState {
    project: ProjectMeta;
    milestones: Milestone[];
    agents: Agent[];
    agent_log: AgentLogEntry[];
    schedule: {
        phases: Phase[];
    };
}
export declare const TRACKER_PATH: string;
export declare function readTracker(): TrackerState;
export declare function writeTracker(state: TrackerState): void;
export declare function findTask(state: TrackerState, taskId: string): {
    subtask: Subtask;
    milestone: Milestone;
} | null;
export declare function touchAgent(state: TrackerState, agentId?: string): void;
export declare function autoUnblockDependents(state: TrackerState, completedTaskId: string, completedMilestoneId: string): string[];
