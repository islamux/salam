// src/tracker.ts
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';
// Path Resolution
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
function getProjectRoot() {
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
    }
    catch {
        // Ignore errors
    }
    // Final fallback: current working directory
    return process.cwd();
}
const PROJECT_ROOT = getProjectRoot();
export const TRACKER_PATH = path.join(PROJECT_ROOT, 'project-tracker.json');
// Tracker Utilities
export function readTracker() {
    const content = fs.readFileSync(TRACKER_PATH, 'utf-8');
    return JSON.parse(content);
}
export function writeTracker(state) {
    // Recompute derived fields
    const totalTasks = state.milestones.reduce((sum, m) => sum + m.subtasks.length, 0);
    const doneTasks = state.milestones.reduce((sum, m) => sum + m.subtasks.filter(t => t.done).length, 0);
    state.project.overall_progress = totalTasks > 0 ? doneTasks / totalTasks : 0;
    // Recalculate current week
    const startDate = new Date(state.project.start_date);
    const now = new Date();
    const diffDays = (now.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24);
    const totalWeeks = Math.ceil((new Date(state.project.target_date).getTime() - startDate.getTime())
        / (1000 * 60 * 60 * 24 * 7));
    state.project.current_week = Math.max(1, Math.min(totalWeeks, Math.floor(diffDays / 7) + 1));
    // Recalculate schedule status
    if (state.milestones.length > 0) {
        const drifts = state.milestones.map(m => m.drift_days);
        const maxDrift = Math.max(...drifts);
        const minDrift = Math.min(...drifts);
        if (maxDrift > 3) {
            state.project.schedule_status = 'behind';
        }
        else if (minDrift < -3) {
            state.project.schedule_status = 'ahead';
        }
        else {
            state.project.schedule_status = 'on_track';
        }
    }
    // Write with 2-space indent
    fs.writeFileSync(TRACKER_PATH, JSON.stringify(state, null, 2), 'utf-8');
}
export function findTask(state, taskId) {
    for (const milestone of state.milestones) {
        for (const subtask of milestone.subtasks) {
            if (subtask.id === taskId) {
                return { subtask, milestone };
            }
        }
    }
    return null;
}
export function touchAgent(state, agentId = 'orchestrator') {
    const agent = state.agents.find(a => a.id === agentId);
    if (agent) {
        agent.last_action_at = new Date().toISOString();
        agent.session_action_count++;
        agent.status = 'active';
    }
}
export function autoUnblockDependents(state, completedTaskId, completedMilestoneId) {
    const results = [];
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
//# sourceMappingURL=tracker.js.map