// src/tools.ts
// src/tools.ts
import { 
  TrackerState, 
  readTracker, 
  writeTracker, 
  findTask,
  touchAgent,
  autoUnblockDependents 
} from './tracker.js';
import { 
  buildTaskContext, 
  buildTaskSummary, 
  buildProjectStatus,
  buildMilestoneOverview 
} from './context.js';

// Error response format
interface ToolResponse {
  content: { type: string; text: string }[];
  isError?: boolean;
}

export function createErrorResponse(message: string): ToolResponse {
  return {
    content: [{ type: 'text', text: message }],
    isError: true
  };
}

// READ TOOLS (8 tools)

export function get_task_context(task_id: string): ToolResponse {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    const { subtask, milestone } = result;
    const context = buildTaskContext(state, subtask, milestone);
    return {
      content: [{ type: 'text', text: context }]
    };
  } catch (error) {
    return createErrorResponse(`Error reading task context: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function get_task_summary(task_id: string): ToolResponse {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    const { subtask, milestone } = result;
    const summary = buildTaskSummary(state, subtask, milestone);
    return {
      content: [{ type: 'text', text: summary }]
    };
  } catch (error) {
    return createErrorResponse(`Error reading task summary: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function get_project_status(): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const status = buildProjectStatus(state);
    return {
      content: [{ type: 'text', text: status }]
    };
  } catch (error) {
    return createErrorResponse(`Error reading project status: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function get_milestone_overview(milestone_id: string): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const milestone = state.milestones.find(m => m.id === milestone_id);
    if (!milestone) {
      return createErrorResponse(`Milestone '${milestone_id}' not found`);
    }
    const overview = buildMilestoneOverview(milestone, state);
    return {
      content: [{ type: 'text', text: overview }]
    };
  } catch (error) {
    return createErrorResponse(`Error reading milestone overview: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function list_tasks(milestone_id?: string, status?: string, domain?: string): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    let subtasks = state.milestones.flatMap(m => m.subtasks);
    
    // Apply filters
    if (milestone_id) {
      subtasks = subtasks.filter(t => t.id.startsWith(`${milestone_id}_`));
    }
    if (status) {
      subtasks = subtasks.filter(t => t.status === status);
    }
    if (domain) {
      const domainMilestones = state.milestones.filter(m => m.domain === domain);
      const domainTaskIds = domainMilestones.flatMap(m => m.subtasks.map(t => t.id));
      subtasks = subtasks.filter(t => domainTaskIds.includes(t.id));
    }
    
    // Group by milestone
    const grouped: Record<string, Subtask[]> = {};
    for (const task of subtasks) {
      const milestoneId = task.id.split('_')[0];
      if (!grouped[milestoneId]) {
        grouped[milestoneId] = [];
      }
      grouped[milestoneId].push(task);
    }
    
    // Build Markdown output
    const lines: string[] = [];
    for (const [milestoneId, tasks] of Object.entries(grouped)) {
      const milestone = state.milestones.find(m => m.id === milestoneId);
      if (milestone) {
        lines.push(`## ${milestone.title} (${milestone.domain})`);
        lines.push('');
        lines.push('| ID | Status | Priority | Label |');
        lines.push('|----|--------|----------|-------|');
        for (const task of tasks) {
          lines.push(`| ${task.id} | ${task.status} | ${task.priority} | ${task.label} |`);
        }
        lines.push('');
      }
    }
    
    return {
      content: [{ type: 'text', text: lines.join('\n') }]
    };
  } catch (error) {
    return createErrorResponse(`Error listing tasks: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function get_task_history(task_id: string): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const logs = state.agent_log.filter(log => log.target_id === task_id);
    
    if (logs.length === 0) {
      return {
        content: [{ type: 'text', text: 'No history found for this task.' }]
      };
    }
    
    // Sort by timestamp descending
    logs.sort((a, b) => new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime());
    
    const lines: string[] = [];
    lines.push(`## Task History: ${task_id}`);
    lines.push('');
    
    for (const log of logs) {
      lines.push(`### ${new Date(log.timestamp).toLocaleString()}`);
      lines.push(`- **Agent**: ${log.agent_id}`);
      lines.push(`- **Action**: ${log.action}`);
      lines.push(`- **Description**: ${log.description}`);
      if (log.tags.length > 0) {
        lines.push(`- **Tags**: ${log.tags.join(', ')}`);
      }
      lines.push('');
    }
    
    return {
      content: [{ type: 'text', text: lines.join('\n') }]
    };
  } catch (error) {
    return createErrorResponse(`Error reading task history: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function list_agents(): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    
    if (state.agents.length === 0) {
      return {
        content: [{ type: 'text', text: 'No agents registered.' }]
      };
    }
    
    const lines: string[] = [];
    lines.push('# Registered Agents');
    lines.push('');
    
    for (const agent of state.agents) {
      lines.push(`## ${agent.name} (${agent.id})`);
      lines.push(`- **Type**: ${agent.type}`);
      lines.push(`- **Status**: ${Date.now() - new Date(agent.last_action_at || '').getTime() < 30 * 60 * 1000 ? 'ACTIVE' : 'IDLE'}`);
      lines.push(`- **Permissions**: ${agent.permissions.join(', ')}`);
      lines.push(`- **Actions (session)**: ${agent.session_action_count}`);
      lines.push(`- **Last Action**: ${agent.last_action_at || 'Never'}`);
      lines.push('');
    }
    
    return {
      content: [{ type: 'text', text: lines.join('\n') }]
    };
  } catch (error) {
    return createErrorResponse(`Error listing agents: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function get_activity_feed(agent_id?: string, limit: number = 30): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    let logs = [...state.agent_log];
    
    // Filter by agent if provided
    if (agent_id) {
      logs = logs.filter(log => log.agent_id === agent_id);
    }
    
    // Sort by timestamp descending
    logs.sort((a, b) => new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime());
    
    // Apply limit
    logs = logs.slice(0, limit);
    
    // Group by date
    const grouped: Record<string, typeof logs> = {};
    for (const log of logs) {
      const date = new Date(log.timestamp).toLocaleDateString();
      if (!grouped[date]) {
        grouped[date] = [];
      }
      grouped[date].push(log);
    }
    
    const lines: string[] = [];
    lines.push('# Activity Feed');
    lines.push('');
    
    for (const [date, dayLogs] of Object.entries(grouped)) {
      lines.push(`## ${date}`);
      for (const log of dayLogs) {
        const time = new Date(log.timestamp).toLocaleTimeString();
        lines.push(`- **${time}** ${log.agent_id} ${log.action} ${log.target_id}`);
        lines.push(`  ${log.description}`);
        if (log.tags.length > 0) {
          lines.push(`  Tags: ${log.tags.join(', ')}`);
        }
      }
      lines.push('');
    }
    
    return {
      content: [{ type: 'text', text: lines.join('\n') }]
    };
  } catch (error) {
    return createErrorResponse(`Error reading activity feed: ${error instanceof Error ? error.message : String(error)}`);
  }
}

// WRITE TOOLS — Task Lifecycle (9 tools)

export function start_task(task_id: string, agent_id: string = 'orchestrator'): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask, milestone } = result;
    
    // Update task
    subtask.status = 'in_progress';
    if (!subtask.assignee) {
      subtask.assignee = agent_id;
    }
    subtask.last_run_id = 'run_' + Date.now();
    
    // Auto-stamp milestone
    if (!milestone.actual_start) {
      milestone.actual_start = new Date().toISOString().split('T')[0];
      // Calculate drift
      if (milestone.planned_start) {
        const planned = new Date(milestone.planned_start);
        const actual = new Date(milestone.actual_start);
        const diffDays = (actual.getTime() - planned.getTime()) / (1000 * 60 * 60 * 24);
        milestone.drift_days = Math.round(diffDays);
      }
    }
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id,
      action: 'task_started',
      target_type: 'subtask',
      target_id: task_id,
      description: `Task started by ${agent_id}`,
      timestamp: new Date().toISOString(),
      tags: ['start', 'mcp']
    });
    
    touchAgent(state, agent_id);
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Started task ${task_id} in milestone ${milestone.id}. Milestone progress: ${milestone.subtasks.filter(t => t.done).length}/${milestone.subtasks.length}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error starting task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function complete_task(task_id: string, summary: string, agent_id: string = 'orchestrator'): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask, milestone } = result;
    
    // Update task - move to review, not done (requires operator approval)
    subtask.status = 'review';
    subtask.blocked_by = null;
    subtask.blocked_reason = null;
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id,
      action: 'task_submitted_for_review',
      target_type: 'subtask',
      target_id: task_id,
      description: summary,
      timestamp: new Date().toISOString(),
      tags: ['review', 'mcp']
    });
    
    touchAgent(state, agent_id);
    writeTracker(state);
    
    const doneCount = milestone.subtasks.filter(t => t.done).length;
    const totalCount = milestone.subtasks.length;
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${task_id} submitted for review. Summary: ${summary}. Milestone progress: ${doneCount}/${totalCount}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error completing task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function approve_task(task_id: string, feedback?: string): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask, milestone } = result;
    
    // Verify status
    if (subtask.status !== 'review') {
      return createErrorResponse(`Task '${task_id}' is in status '${subtask.status}', expected 'review'`);
    }
    
    // Update task - mark as done
    subtask.status = 'done';
    subtask.done = true;
    subtask.completed_at = new Date().toISOString();
    subtask.completed_by = 'operator';
    
    // Auto-stamp milestone if all tasks done
    if (milestone.subtasks.every(t => t.done)) {
      milestone.actual_end = new Date().toISOString().split('T')[0];
    }
    
    // Auto-unblock dependents
    const unblocked = autoUnblockDependents(state, task_id, milestone.id);
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id: 'operator',
      action: 'task_approved',
      target_type: 'subtask',
      target_id: task_id,
      description: feedback ? `Approved with feedback: ${feedback}` : 'Approved',
      timestamp: new Date().toISOString(),
      tags: ['approve', 'mcp']
    });
    
    touchAgent(state, 'operator');
    writeTracker(state);
    
    const doneCount = milestone.subtasks.filter(t => t.done).length;
    const totalCount = milestone.subtasks.length;
    const unblockMsg = unblocked.length > 0 ? `\nAuto-unblocked: ${unblocked.join('; ')}` : '';
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${task_id} approved. Milestone progress: ${doneCount}/${totalCount}.${unblockMsg}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error approving task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function reject_task(task_id: string, feedback: string): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask } = result;
    
    // Verify status
    if (subtask.status !== 'review') {
      return createErrorResponse(`Task '${task_id}' is in status '${subtask.status}', expected 'review'`);
    }
    
    // Update task - back to in_progress
    subtask.status = 'in_progress';
    
    // Count prior revisions
    const priorRevisions = state.agent_log.filter(log => 
      log.target_id === task_id && log.action === 'revision_requested'
    ).length;
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id: 'operator',
      action: 'revision_requested',
      target_type: 'subtask',
      target_id: task_id,
      description: `Revision ${priorRevisions + 1}: ${feedback}`,
      timestamp: new Date().toISOString(),
      tags: ['revision', 'mcp']
    });
    
    touchAgent(state, 'operator');
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${task_id} rejected. Revision ${priorRevisions + 1} requested. Feedback: ${feedback}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error rejecting task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function reset_task(task_id: string): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask } = result;
    const previousStatus = subtask.status;
    
    // Reset task
    subtask.status = 'todo';
    subtask.done = false;
    subtask.assignee = null;
    subtask.blocked_by = null;
    subtask.blocked_reason = null;
    subtask.completed_at = null;
    subtask.completed_by = null;
    subtask.last_run_id = null;
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id: 'operator',
      action: 'task_reset',
      target_type: 'subtask',
      target_id: task_id,
      description: `Task reset from ${previousStatus} to todo`,
      timestamp: new Date().toISOString(),
      tags: ['reset', 'mcp']
    });
    
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${task_id} reset from ${previousStatus} to todo`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error resetting task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function block_task(task_id: string, reason: string, agent_id: string = 'orchestrator'): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask } = result;
    
    // Update task
    subtask.status = 'blocked';
    subtask.blocked_reason = reason;
    subtask.blocked_by = agent_id;
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id,
      action: 'task_blocked',
      target_type: 'subtask',
      target_id: task_id,
      description: `Blocked: ${reason}`,
      timestamp: new Date().toISOString(),
      tags: ['block', 'mcp']
    });
    
    touchAgent(state, agent_id);
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${task_id} blocked. Reason: ${reason}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error blocking task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function unblock_task(task_id: string, resolution?: string, agent_id: string = 'orchestrator'): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask } = result;
    
    // Verify status
    if (subtask.status !== 'blocked') {
      return createErrorResponse(`Task '${task_id}' is not blocked (current status: ${subtask.status})`);
    }
    
    // Determine new status
    const newStatus = subtask.last_run_id ? 'in_progress' : 'todo';
    
    // Update task
    subtask.status = newStatus;
    subtask.blocked_by = null;
    subtask.blocked_reason = null;
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id,
      action: 'task_unblocked',
      target_type: 'subtask',
      target_id: task_id,
      description: resolution ? `Unblocked: ${resolution}` : 'Unblocked',
      timestamp: new Date().toISOString(),
      tags: ['unblock', 'mcp']
    });
    
    touchAgent(state, agent_id);
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${task_id} unblocked. Previous blocker: ${subtask.blocked_reason}. New status: ${newStatus}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error unblocking task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function update_task(
  task_id: string,
  priority?: string,
  assignee?: string,
  execution_mode?: string,
  notes?: string,
  agent_id: string = 'orchestrator'
): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask } = result;
    const changes: string[] = [];
    
    // Update fields that are provided
    if (priority !== undefined) {
      subtask.priority = priority;
      changes.push(`priority: ${priority}`);
    }
    if (assignee !== undefined) {
      subtask.assignee = assignee || null;
      changes.push(`assignee: ${assignee || 'Unassigned'}`);
    }
    if (execution_mode !== undefined) {
      subtask.execution_mode = execution_mode as 'human' | 'agent' | 'pair';
      changes.push(`execution_mode: ${execution_mode}`);
    }
    if (notes !== undefined) {
      subtask.notes = notes || null;
      changes.push(`notes: ${notes || 'Cleared'}`);
    }
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id,
      action: 'task_updated',
      target_type: 'subtask',
      target_id: task_id,
      description: `Updated: ${changes.join(', ')}`,
      timestamp: new Date().toISOString(),
      tags: ['update', 'mcp']
    });
    
    touchAgent(state, agent_id);
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${task_id} updated. Changes: ${changes.join(', ')}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error updating task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function log_action(
  target_id: string,
  action: string,
  description: string,
  tags: string[] = [],
  agent_id: string = 'orchestrator'
): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    
    // Create log entry
    const logEntry = {
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id,
      action,
      target_type: target_id.startsWith('milestone_') ? 'milestone' : 'subtask',
      target_id,
      description,
      timestamp: new Date().toISOString(),
      tags: [...tags, 'mcp']
    };
    
    state.agent_log.push(logEntry);
    
    touchAgent(state, agent_id);
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Logged action '${action}' for ${target_id}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error logging action: ${error instanceof Error ? error.message : String(error)}`);
  }
}

// WRITE TOOLS — Task Enrichment (1 tool)

export function enrich_task(
  task_id: string,
  prompt?: string,
  builder_prompt?: string,
  acceptance_criteria?: string[],
  constraints?: string[],
  context_files?: string[],
  reference_docs?: string[],
  agent_id: string = 'orchestrator'
): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const result = findTask(state, task_id);
    if (!result) {
      return createErrorResponse(`Task '${task_id}' not found in any milestone`);
    }
    
    const { subtask } = result;
    const changes: string[] = [];
    
    // Update fields that are provided (arrays REPLACE existing values)
    if (prompt !== undefined) {
      subtask.prompt = prompt || null;
      changes.push('prompt');
    }
    if (builder_prompt !== undefined) {
      subtask.builder_prompt = builder_prompt || null;
      changes.push('builder_prompt');
    }
    if (acceptance_criteria !== undefined) {
      subtask.acceptance_criteria = acceptance_criteria || [];
      changes.push('acceptance_criteria');
    }
    if (constraints !== undefined) {
      subtask.constraints = constraints || [];
      changes.push('constraints');
    }
    if (context_files !== undefined) {
      subtask.context_files = context_files || [];
      changes.push('context_files');
    }
    if (reference_docs !== undefined) {
      subtask.reference_docs = reference_docs || [];
      changes.push('reference_docs');
    }
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id,
      action: 'task_enriched',
      target_type: 'subtask',
      target_id: task_id,
      description: `Enriched: ${changes.join(', ')}`,
      timestamp: new Date().toISOString(),
      tags: ['enrich', 'mcp']
    });
    
    touchAgent(state, agent_id);
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${task_id} enriched. Updated fields: ${changes.join(', ')}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error enriching task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

// WRITE TOOLS — Milestone Management (5 tools)

export function add_milestone_note(milestone_id: string, note: string): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const milestone = state.milestones.find(m => m.id === milestone_id);
    if (!milestone) {
      return createErrorResponse(`Milestone '${milestone_id}' not found`);
    }
    
    milestone.notes.push(note);
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id: 'operator',
      action: 'milestone_note_added',
      target_type: 'milestone',
      target_id: milestone_id,
      description: `Added note: ${note}`,
      timestamp: new Date().toISOString(),
      tags: ['note', 'mcp']
    });
    
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Note added to milestone ${milestone_id}. Total notes: ${milestone.notes.length}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error adding milestone note: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function set_milestone_dates(
  milestone_id: string,
  actual_start?: string,
  actual_end?: string
): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const milestone = state.milestones.find(m => m.id === milestone_id);
    if (!milestone) {
      return createErrorResponse(`Milestone '${milestone_id}' not found`);
    }
    
    const changes: string[] = [];
    
    if (actual_start !== undefined) {
      milestone.actual_start = actual_start;
      changes.push(`actual_start: ${actual_start}`);
    }
    if (actual_end !== undefined) {
      milestone.actual_end = actual_end;
      changes.push(`actual_end: ${actual_end}`);
    }
    
    // Recalculate drift
    if (milestone.planned_start && milestone.actual_start) {
      const planned = new Date(milestone.planned_start);
      const actual = new Date(milestone.actual_start);
      const diffDays = (actual.getTime() - planned.getTime()) / (1000 * 60 * 60 * 24);
      milestone.drift_days = Math.round(diffDays);
    }
    
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
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id: 'operator',
      action: 'milestone_dates_set',
      target_type: 'milestone',
      target_id: milestone_id,
      description: `Set dates: ${changes.join(', ')}`,
      timestamp: new Date().toISOString(),
      tags: ['dates', 'mcp']
    });
    
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Milestone ${milestone_id} dates updated. Changes: ${changes.join(', ')}. Schedule status: ${state.project.schedule_status}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error setting milestone dates: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function update_drift(milestone_id: string, drift_days: number): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const milestone = state.milestones.find(m => m.id === milestone_id);
    if (!milestone) {
      return createErrorResponse(`Milestone '${milestone_id}' not found`);
    }
    
    const oldDrift = milestone.drift_days;
    milestone.drift_days = drift_days;
    
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
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id: 'operator',
      action: 'drift_updated',
      target_type: 'milestone',
      target_id: milestone_id,
      description: `Drift updated: ${oldDrift} → ${drift_days}`,
      timestamp: new Date().toISOString(),
      tags: ['drift', 'mcp']
    });
    
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Milestone ${milestone_id} drift updated: ${oldDrift} → ${drift_days}. Schedule status: ${state.project.schedule_status}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error updating drift: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function create_milestone(
  id: string,
  title: string,
  domain: string = 'general',
  phase: string = id,
  planned_start?: string,
  planned_end?: string
): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    
    // Check for duplicate
    if (state.milestones.some(m => m.id === id)) {
      return createErrorResponse(`Milestone with ID '${id}' already exists`);
    }
    
    // Create new milestone
    const milestone: any = {
      id,
      title,
      domain,
      phase,
      planned_start: planned_start || null,
      planned_end: planned_end || null,
      actual_start: null,
      actual_end: null,
      drift_days: 0,
      is_key_milestone: false,
      key_milestone_label: null,
      subtasks: [],
      dependencies: [],
      notes: []
    };
    
    state.milestones.push(milestone);
    
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Milestone ${id} created: ${title}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error creating milestone: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function add_milestone_task(
  milestone_id: string,
  label: string,
  priority: string = 'P2',
  acceptance_criteria: string[] = [],
  constraints: string[] = [],
  depends_on: string[] = [],
  execution_mode: string = 'agent'
): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const milestone = state.milestones.find(m => m.id === milestone_id);
    if (!milestone) {
      return createErrorResponse(`Milestone '${milestone_id}' not found`);
    }
    
    // Generate task ID
    const taskId = `${milestone_id}_${(milestone.subtasks.length + 1).toString().padStart(3, '0')}`;
    
    // Create subtask
    const subtask: any = {
      id: taskId,
      label,
      status: 'todo',
      done: false,
      assignee: null,
      blocked_by: null,
      blocked_reason: null,
      completed_at: null,
      completed_by: null,
      priority,
      notes: null,
      prompt: null,
      context_files: [],
      reference_docs: [],
      acceptance_criteria,
      constraints,
      agent_target: null,
      execution_mode,
      depends_on,
      last_run_id: null,
      builder_prompt: null
    };
    
    milestone.subtasks.push(subtask);
    
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Task ${taskId} added to milestone ${milestone_id}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error adding milestone task: ${error instanceof Error ? error.message : String(error)}`);
  }
}

// WRITE TOOLS — Agent Management (1 tool)

export function register_agent(
  agent_id: string,
  name: string,
  type: 'orchestrator' | 'sub-agent' | 'human' | 'external',
  permissions: string[],
  color: string = '#9B9BAA',
  parent_id?: string
): { content: { type: string; text: string }[] } {
  try {
    const state = readTracker();
    const existingIndex = state.agents.findIndex(a => a.id === agent_id);
    
    const agent: Agent = {
      id: agent_id,
      name,
      type,
      parent_id,
      color,
      status: 'active',
      permissions,
      last_action_at: new Date().toISOString(),
      session_action_count: existingIndex >= 0 ? state.agents[existingIndex].session_action_count + 1 : 1
    };
    
    if (existingIndex >= 0) {
      state.agents[existingIndex] = agent;
    } else {
      state.agents.push(agent);
    }
    
    // Log action
    state.agent_log.push({
      id: `log_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
      agent_id: 'operator',
      action: existingIndex >= 0 ? 'agent_updated' : 'agent_registered',
      target_type: 'agent',
      target_id: agent_id,
      description: existingIndex >= 0 ? `Agent updated: ${name}` : `Agent registered: ${name}`,
      timestamp: new Date().toISOString(),
      tags: ['agent', 'mcp']
    });
    
    writeTracker(state);
    
    return {
      content: [{ 
        type: 'text', 
        text: `Agent ${agent_id} ${existingIndex >= 0 ? 'updated' : 'registered'}`
      }]
    };
  } catch (error) {
    return createErrorResponse(`Error registering agent: ${error instanceof Error ? error.message : String(error)}`);
  }
}