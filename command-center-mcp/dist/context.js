// Build comprehensive task context (~8K tokens)
export function buildTaskContext(state, subtask, milestone) {
    const sections = [];
    // 1. Task metadata
    sections.push(`## Task Metadata`);
    sections.push(`- **ID**: ${subtask.id}`);
    sections.push(`- **Status**: ${subtask.status}`);
    sections.push(`- **Priority**: ${subtask.priority}`);
    sections.push(`- **Execution Mode**: ${subtask.execution_mode}`);
    sections.push(`- **Assignee**: ${subtask.assignee || 'Unassigned'}`);
    sections.push(`- **Blocked**: ${subtask.blocked_by ? `Yes (by ${subtask.blocked_by}: ${subtask.blocked_reason})` : 'No'}`);
    sections.push(`- **Notes**: ${subtask.notes || 'None'}`);
    sections.push('');
    // 2. Acceptance criteria
    if (subtask.acceptance_criteria.length > 0) {
        sections.push('## Acceptance Criteria');
        for (const criterion of subtask.acceptance_criteria) {
            sections.push(`- [ ] ${criterion}`);
        }
        sections.push('');
    }
    // 3. Constraints
    if (subtask.constraints.length > 0) {
        sections.push('## Constraints');
        for (const constraint of subtask.constraints) {
            sections.push(`- ${constraint}`);
        }
        sections.push('');
    }
    // 4. Context files
    if (subtask.context_files.length > 0) {
        sections.push('## Context Files');
        for (const file of subtask.context_files) {
            sections.push(`- ${file}`);
        }
        sections.push('');
    }
    // 5. Reference docs
    if (subtask.reference_docs.length > 0) {
        sections.push('## Reference Documents');
        for (const doc of subtask.reference_docs) {
            sections.push(`- ${doc}`);
        }
        sections.push('');
    }
    // 6. Revision history
    const revisionLogs = state.agent_log.filter(log => log.target_id === subtask.id && log.action === 'revision_requested');
    if (revisionLogs.length > 0) {
        sections.push('## Revision History');
        for (let i = 0; i < revisionLogs.length; i++) {
            const log = revisionLogs[i];
            sections.push(`### Revision ${i + 1}`);
            sections.push(`- **Feedback**: ${log.description}`);
            sections.push(`- **Timestamp**: ${log.timestamp}`);
        }
        sections.push('');
    }
    // 7. Builder prompt
    if (subtask.builder_prompt) {
        try {
            const promptPath = subtask.builder_prompt;
            sections.push('## Builder Prompt');
            sections.push('```markdown');
            sections.push(promptPath);
            sections.push('```');
            sections.push('');
        }
        catch {
            // Ignore errors
        }
    }
    // 8. Milestone info
    sections.push('## Milestone Information');
    sections.push(`- **Domain**: ${milestone.domain}`);
    sections.push(`- **Phase**: ${milestone.phase}`);
    sections.push(`- **Week**: ${milestone.week}`);
    sections.push(`- **Planned Dates**: ${milestone.planned_start || 'TBD'} – ${milestone.planned_end || 'TBD'}`);
    sections.push(`- **Drift**: ${milestone.drift_days > 0 ? `${milestone.drift_days} days behind` : milestone.drift_days < 0 ? `${Math.abs(milestone.drift_days)} days ahead` : 'On track'}`);
    sections.push('');
    // 9. Exit criteria
    if (milestone.notes.length > 0) {
        sections.push('## Exit Criteria');
        for (const note of milestone.notes) {
            sections.push(`- ${note}`);
        }
        sections.push('');
    }
    // 10. Sibling tasks
    sections.push('## Sibling Tasks');
    const doneCount = milestone.subtasks.filter(t => t.done).length;
    sections.push(`Progress: ${doneCount}/${milestone.subtasks.length} tasks complete`);
    sections.push('');
    sections.push('| Task ID | Status | Priority | Assignee |');
    sections.push('|---------|--------|----------|----------|');
    for (const task of milestone.subtasks) {
        if (task.id === subtask.id)
            continue;
        sections.push(`| ${task.id} | ${task.status} | ${task.priority} | ${task.assignee || 'None'} |`);
    }
    sections.push('');
    // 11. Upstream dependencies
    if (milestone.dependencies.length > 0) {
        sections.push('## Upstream Dependencies');
        for (const depId of milestone.dependencies) {
            const depMilestone = state.milestones.find(m => m.id === depId);
            if (depMilestone) {
                const depDone = depMilestone.subtasks.filter(t => t.done).length;
                const depTotal = depMilestone.subtasks.length;
                const pct = depTotal > 0 ? Math.round((depDone / depTotal) * 100) : 0;
                sections.push(`- **${depMilestone.title}** (${depDone}/${depTotal}, ${pct}%)`);
            }
        }
        sections.push('');
    }
    // 12. Downstream milestones
    const downstream = state.milestones.filter(m => m.dependencies.includes(milestone.id));
    if (downstream.length > 0) {
        sections.push('## Downstream Milestones');
        for (const dsMilestone of downstream) {
            sections.push(`- ${dsMilestone.title} (${dsMilestone.id})`);
        }
        sections.push('');
    }
    return sections.join('\n');
}
// Build slim task summary (~500 tokens)
export function buildTaskSummary(state, subtask, milestone) {
    const sections = [];
    sections.push(`## ${subtask.label}`);
    sections.push(`**ID**: ${subtask.id} | **Status**: ${subtask.status} | **Domain**: ${milestone.domain}`);
    sections.push('');
    if (subtask.acceptance_criteria.length > 0) {
        sections.push('### Acceptance Criteria');
        for (const criterion of subtask.acceptance_criteria) {
            sections.push(`- ${criterion}`);
        }
        sections.push('');
    }
    if (subtask.constraints.length > 0) {
        sections.push('### Constraints');
        for (const constraint of subtask.constraints) {
            sections.push(`- ${constraint}`);
        }
        sections.push('');
    }
    if (subtask.context_files.length > 0) {
        sections.push('### Context Files');
        for (const file of subtask.context_files) {
            sections.push(`- ${file}`);
        }
        sections.push('');
    }
    const revisionLogs = state.agent_log.filter(log => log.target_id === subtask.id && log.action === 'revision_requested');
    if (revisionLogs.length > 0) {
        sections.push('### Revision History');
        for (let i = 0; i < revisionLogs.length; i++) {
            sections.push(`- Revision ${i + 1}: ${revisionLogs[i].description}`);
        }
        sections.push('');
    }
    return sections.join('\n');
}
// Build project status
export function buildProjectStatus(state) {
    const sections = [];
    sections.push(`# ${state.project.name}`);
    sections.push('');
    sections.push(`- **Start Date**: ${state.project.start_date}`);
    sections.push(`- **Target Date**: ${state.project.target_date}`);
    sections.push(`- **Current Week**: ${state.project.current_week}`);
    sections.push(`- **Schedule Status**: ${state.project.schedule_status}`);
    sections.push('');
    const totalTasks = state.milestones.reduce((sum, m) => sum + m.subtasks.length, 0);
    const doneTasks = state.milestones.reduce((sum, m) => sum + m.subtasks.filter(t => t.done).length, 0);
    const inProgressTasks = state.milestones.reduce((sum, m) => sum + m.subtasks.filter(t => t.status === 'in_progress').length, 0);
    const blockedTasks = state.milestones.reduce((sum, m) => sum + m.subtasks.filter(t => t.status === 'blocked').length, 0);
    sections.push(`## Progress`);
    sections.push(`- **Done**: ${doneTasks}/${totalTasks}`);
    sections.push(`- **In Progress**: ${inProgressTasks}`);
    sections.push(`- **Blocked**: ${blockedTasks}`);
    sections.push(`- **Milestones**: ${state.milestones.length}`);
    sections.push('');
    // Find current phase
    const currentPhase = state.schedule.phases.find(p => state.project.current_week >= p.start_week && state.project.current_week <= p.end_week);
    sections.push(`## Current Phase`);
    sections.push(currentPhase ? currentPhase.title : 'Not in any phase');
    return sections.join('\n');
}
// Build milestone overview
export function buildMilestoneOverview(milestone, state) {
    const sections = [];
    sections.push(`# ${milestone.title}`);
    sections.push(`**ID**: ${milestone.id} | **Domain**: ${milestone.domain} | **Phase**: ${milestone.phase}`);
    sections.push(`**Week**: ${milestone.week} | **Planned**: ${milestone.planned_start || 'TBD'} – ${milestone.planned_end || 'TBD'}`);
    sections.push('');
    const doneCount = milestone.subtasks.filter(t => t.done).length;
    const totalCount = milestone.subtasks.length;
    const pct = totalCount > 0 ? Math.round((doneCount / totalCount) * 100) : 0;
    sections.push(`## Progress: ${doneCount}/${totalCount} (${pct}%)`);
    sections.push(`**Drift**: ${milestone.drift_days > 0 ? `${milestone.drift_days} days behind` : milestone.drift_days < 0 ? `${Math.abs(milestone.drift_days)} days ahead` : 'On track'}`);
    sections.push('');
    if (milestone.is_key_milestone && milestone.key_milestone_label) {
        sections.push(`## Key Milestone: ${milestone.key_milestone_label}`);
        sections.push('');
    }
    if (milestone.notes.length > 0) {
        sections.push('## Exit Criteria');
        for (const note of milestone.notes) {
            sections.push(`- ${note}`);
        }
        sections.push('');
    }
    sections.push('## Tasks');
    sections.push('| ID | Status | Priority | Label |');
    sections.push('|----|--------|----------|-------|');
    for (const task of milestone.subtasks) {
        sections.push(`| ${task.id} | ${task.status} | ${task.priority} | ${task.label} |`);
    }
    sections.push('');
    if (milestone.dependencies.length > 0) {
        sections.push('## Dependencies');
        for (const depId of milestone.dependencies) {
            const depMilestone = state.milestones.find(m => m.id === depId);
            if (depMilestone) {
                const depDone = depMilestone.subtasks.filter(t => t.done).length;
                const depTotal = depMilestone.subtasks.length;
                const pct = depTotal > 0 ? Math.round((depDone / depTotal) * 100) : 0;
                sections.push(`- **${depMilestone.title}**: ${depDone}/${depTotal} (${pct}%)`);
            }
        }
        sections.push('');
    }
    const downstream = state.milestones.filter(m => m.dependencies.includes(milestone.id));
    if (downstream.length > 0) {
        sections.push('## Downstream Milestones');
        for (const dsMilestone of downstream) {
            sections.push(`- ${dsMilestone.title} (${dsMilestone.id})`);
        }
        sections.push('');
    }
    return sections.join('\n');
}
//# sourceMappingURL=context.js.map