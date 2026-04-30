// src/tracker.ts
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

// TypeScript Interfaces from Phase 1

export interface ProjectMeta {
  name: string;                    // Project display name
  start_date: string;              // YYYY-MM-DD, first day of work
  target_date: string;             // YYYY-MM-DD, target completion
  current_week: number;            // Live-calculated: 1-based week number
  schedule_status: 'on_track' | 'behind' | 'ahead';
  overall_progress: number;        // 0.0 to 1.0 (done / total tasks)
}

export interface Subtask {
  id: string;                      // Format: {milestone_id}_{NNN} (zero-padded)
  label: string;                   // Task description
  status: 'todo' | 'in_progress' | 'review' | 'done' | 'blocked';
  done: boolean;                   // Completion flag (mirrors status === 'done')
  assignee: string | null;         // Agent ID or human name
  blocked_by: string | null;       // Who/what blocked this task
  blocked_reason: string | null;   // Why it's blocked
  completed_at: string | null;     // ISO 8601 timestamp
  completed_by: string | null;     // Who completed it
  priority: string;                // "P1" | "P2" | "P3" | "P4"
  notes: string | null;            // Free-form notes

  // Agent enrichment fields
  prompt: string | null;           // Task description/prompt
  context_files: string[];         // File paths the agent should read first
  reference_docs: string[];        // URLs or doc paths for research
  acceptance_criteria: string[];   // Checklist of what "done" means
  constraints: string[];           // Rules the implementation must follow

  // Execution configuration
  agent_target: string | null;     // Suggested agent role (e.g., 'explorer', 'builder')
  execution_mode: 'human' | 'agent' | 'pair';
  depends_on: string[];            // IDs of subtasks that must complete first
  last_run_id: string | null;      // Unique run identifier for the last execution
  builder_prompt: string | null;   // Path to per-task prompt file
}

export interface Milestone {
  id: string;                      // snake_case unique identifier
  title: string;                   // Human-readable name
  domain: string;                  // Category
  week: number;                    // Start week (1-based)
  phase: string;                   // Phase this milestone belongs to
  planned_start: string | null;    // YYYY-MM-DD
  planned_end: string | null;      // YYYY-MM-DD
  actual_start: string | null;     // YYYY-MM-DD (auto-set when first task starts)
  actual_end: string | null;       // YYYY-MM-DD (auto-set when all tasks done)
  drift_days: number;              // Positive = behind, negative = ahead, 0 = on track
  is_key_milestone: boolean;       // True for major release/deadline milestones
  key_milestone_label: string | null;  // e.g., "V1.0 Launch", "Beta Release"
  subtasks: Subtask[];             // Ordered list of tasks within this milestone
  dependencies: string[];          // IDs of milestones that must complete first
  notes: string[];                 // Exit criteria and notes
}

export interface Agent {
  id: string;                      // Unique identifier (e.g., 'claude_code', 'codex')
  name: string;                    // Display name
  type: 'orchestrator' | 'sub-agent' | 'human' | 'external';
  parent_id?: string;              // For sub-agents: ID of parent orchestrator
  color: string;                   // Hex color for UI display (e.g., '#22c55e')
  status: string;                  // 'active' | 'idle'
  permissions: string[];           // e.g., ['read', 'write']
  last_action_at: string | null;   // ISO 8601 timestamp of last MCP tool call
  session_action_count: number;    // Running count of actions in current session
}

export interface AgentLogEntry {
  id: string;                      // Unique log entry ID (e.g., 'log_{timestamp}_{random}')
  agent_id: string;                // Which agent performed the action
  action: string;                  // Action type
  target_type: string;             // 'subtask' | 'milestone' | 'agent'
  target_id: string;               // ID of the affected entity
  description: string;             // Human-readable description of what happened
  timestamp: string;                // ISO 8601 timestamp
  tags: string[];                  // Categorization (e.g., ['start', 'mcp'], ['write', 'commit'])
}

export interface Phase {
  id: string;                      // Unique phase identifier
  title: string;                   // Display name (e.g., "Foundation", "Core Features")
  start_week: number;              // First week of this phase (1-based)
  end_week: number;                // Last week of this phase (inclusive)
}

export interface TrackerState {
  project: ProjectMeta;
  milestones: Milestone[];
  agents: Agent[];
  agent_log: AgentLogEntry[];
  schedule: { phases: Phase[] };
}

// Path Resolution
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

function getProjectRoot(): string {
  // Try PROJECT_ROOT env var first
  if (process.env.PROJECT_ROOT) {
    return process.env.PROJECT_ROOT;
  }
  
  // Fallback: read from .env file
  try {
    const envPath = path.join(__dirname, '..', '..', '.env');
    if (fs.existsSync(envPath)) {
      const envContent = fs.readFileSync(envPath, 'utf-8');
      const match = envContent.match(/PROJECT_ROOT=(.+)/);
      if (match) {
        return match[1].trim();
      }
    }
  } catch {
    // Ignore errors
  }
  
  // Final fallback: current working directory
  return process.cwd();
}

const PROJECT_ROOT = getProjectRoot();
export const TRACKER_PATH = path.join(PROJECT_ROOT, 'project-tracker.json');

// Tracker Utilities

export function readTracker(): TrackerState {
  const content = fs.readFileSync(TRACKER_PATH, 'utf-8');
  return JSON.parse(content) as TrackerState;
}

export function writeTracker(state: TrackerState): void {
  // Recompute derived fields
  const totalTasks = state.milestones.reduce((sum, m) => sum + m.subtasks.length, 0);
  const doneTasks = state.milestones.reduce((sum, m) => 
    sum + m.subtasks.filter(t => t.done).length, 0);
  state.project.overall_progress = totalTasks > 0 ? doneTasks / totalTasks : 0;
  
  // Recalculate current week
  const startDate = new Date(state.project.start_date);
  const now = new Date();
  const diffDays = (now.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24);
  const totalWeeks = Math.ceil(
    (new Date(state.project.target_date).getTime() - startDate.getTime())
    / (1000 * 60 * 60 * 24 * 7)
  );
  state.project.current_week = Math.max(1, Math.min(totalWeeks, Math.floor(diffDays / 7) + 1));
  
  // Recalculate schedule status
  if (state.milestones.length > 0) {
    const drifts = state.milestones.map(m => m.drift_days);
    const maxDrift = Math.max(...drifts);
    const minDrift = Math.min(...drifts);
    if (maxDrift > 3) {
      state.project.schedule_status = 'behind';
    } else if (minDrift < -3) {
      state.project.schedule_status = 'ahead';
    } else {
      state.project.schedule_status = 'on_track';
    }
  }
  
  // Write with 2-space indent
  fs.writeFileSync(TRACKER_PATH, JSON.stringify(state, null, 2), 'utf-8');
}

export function findTask(state: TrackerState, taskId: string): { subtask: Subtask; milestone: Milestone } | null {
  for (const milestone of state.milestones) {
    for (const subtask of milestone.subtasks) {
      if (subtask.id === taskId) {
        return { subtask, milestone };
      }
    }
  }
  return null;
}

export function touchAgent(state: TrackerState, agentId: string = 'orchestrator'): void {
  const agent = state.agents.find(a => a.id === agentId);
  if (agent) {
    agent.last_action_at = new Date().toISOString();
    agent.session_action_count++;
    agent.status = 'active';
  }
}

export function autoUnblockDependents(state: TrackerState, completedTaskId: string, completedMilestoneId: string): string[] {
  const results: string[] = [];
  
  // Find all subtasks that depend on the completed task
  for (const milestone of state.milestones) {
    for (const subtask of milestone.subtasks) {
      if (subtask.depends_on.includes(completedTaskId)) {
        // Check if ALL dependencies are now done
        const allDepsDone = subtask.depends_on.every(depId => {
          const depTask = findTask(state, depId);
          return depTask && depTask.subtask.status === 'done';
        });
        
        if (allDepsDone && subtask.status === 'blocked') {
          subtask.status = 'todo';
          subtask.blocked_by = null;
          subtask.blocked_reason = null;
          results.push(`Unblocked task ${subtask.id} (all dependencies complete)`);
          
          // Log the unblock action
          state.agent_log.push({
            id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
            agent_id: 'system',
            action: 'task_unblocked',
            target_type: 'subtask',
            target_id: subtask.id,
            description: `Auto-unblocked: all dependencies complete`,
            timestamp: new Date().toISOString(),
            tags: ['auto', 'unblock']
          });
        }
      }
    }
  }
  
  // Check if the completed milestone's completion unblocks downstream milestones
  const completedMilestone = state.milestones.find(m => m.id === completedMilestoneId);
  if (completedMilestone && completedMilestone.subtasks.every(t => t.done)) {
    for (const downstreamMilestone of state.milestones) {
      if (downstreamMilestone.dependencies.includes(completedMilestoneId)) {
        const allDepsComplete = downstreamMilestone.dependencies.every(depId => {
          const depMilestone = state.milestones.find(m => m.id === depId);
          return depMilestone && depMilestone.subtasks.every(t => t.done);
        });
        
        if (allDepsComplete) {
          for (const subtask of downstreamMilestone.subtasks) {
            if (subtask.status === 'blocked') {
              subtask.status = 'todo';
              subtask.blocked_by = null;
              subtask.blocked_reason = null;
              results.push(`Unblocked task ${subtask.id} in milestone ${downstreamMilestone.id}`);
              
              state.agent_log.push({
                id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
                agent_id: 'system',
                action: 'task_unblocked',
                target_type: 'subtask',
                target_id: subtask.id,
                description: `Auto-unblocked: milestone dependency ${completedMilestoneId} completed`,
                timestamp: new Date().toISOString(),
                tags: ['auto', 'unblock']
              });
            }
          }
        }
      }
    }
  }
  
  return results;
}