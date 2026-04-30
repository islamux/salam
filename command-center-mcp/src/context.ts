import fs from 'node:fs'
import type { TrackerState, Milestone, Subtask, AgentLogEntry } from './tracker.js'
import { selectCurrentWeek, selectCurrentPhase, selectScheduleStatus, selectMilestoneProgress } from './tracker.js'

export function buildTaskContext(state: TrackerState, subtask: Subtask, milestone: Milestone): string {
  const progress = selectMilestoneProgress(milestone)
  const sections: string[] = []

  sections.push(`## Task: ${subtask.id}`)
  sections.push('')
  sections.push(`**Status:** ${subtask.status}`)
  sections.push(`**Priority:** ${subtask.priority}`)
  sections.push(`**Execution Mode:** ${subtask.execution_mode}`)
  sections.push(`**Assignee:** ${subtask.assignee ?? 'Unassigned'}`)
  if (subtask.notes) sections.push(`**Notes:** ${subtask.notes}`)
  if (subtask.blocked_reason) sections.push(`**Blocked Reason:** ${subtask.blocked_reason}`)
  sections.push('')

  if (subtask.acceptance_criteria.length > 0) {
    sections.push('### Acceptance Criteria')
    for (const c of subtask.acceptance_criteria) {
      sections.push(`- [ ] ${c}`)
    }
    sections.push('')
  }

  if (subtask.constraints.length > 0) {
    sections.push('### Constraints')
    for (const c of subtask.constraints) {
      sections.push(`- ${c}`)
    }
    sections.push('')
  }

  if (subtask.context_files.length > 0) {
    sections.push('### Context Files')
    for (const f of subtask.context_files) {
      sections.push(`- \`${f}\``)
    }
    sections.push('')
  }

  if (subtask.reference_docs.length > 0) {
    sections.push('### Reference Docs')
    for (const d of subtask.reference_docs) {
      sections.push(`- ${d}`)
    }
    sections.push('')
  }

  const revisions = state.agent_log.filter(
    e => e.target_id === subtask.id && e.action === 'revision_requested'
  )
  if (revisions.length > 0) {
    sections.push('### Revision History')
    for (const rev of revisions) {
      sections.push(`- **Revision ${revisions.indexOf(rev) + 1}:** ${rev.description} (_${rev.timestamp}_)`)
    }
    sections.push('')
  }

  if (subtask.builder_prompt) {
    try {
      const promptContent = fs.readFileSync(subtask.builder_prompt, 'utf-8')
      sections.push('### Builder Prompt')
      sections.push(promptContent)
      sections.push('')
    } catch {
      sections.push(`### Builder Prompt (file not found: ${subtask.builder_prompt})`)
      sections.push('')
    }
  }

  sections.push('### Milestone Info')
  sections.push(`- **Domain:** ${milestone.domain}`)
  sections.push(`- **Phase:** ${milestone.phase}`)
  sections.push(`- **Week:** ${milestone.week}`)
  sections.push(`- **Planned:** ${milestone.planned_start ?? 'TBD'} → ${milestone.planned_end ?? 'TBD'}`)
  if (milestone.drift_days !== 0) {
    sections.push(`- **Drift:** ${milestone.drift_days > 0 ? '+' : ''}${milestone.drift_days} days`)
  }
  sections.push('')

  if (milestone.notes.length > 0) {
    sections.push('### Exit Criteria')
    for (const n of milestone.notes) {
      sections.push(`- ${n}`)
    }
    sections.push('')
  }

  const siblings = milestone.subtasks.filter(s => s.id !== subtask.id)
  if (siblings.length > 0) {
    sections.push('### Sibling Tasks')
    for (const s of siblings) {
      sections.push(`- \`${s.id}\` — ${statusIcon(s.status)} ${s.label}`)
    }
    sections.push('')
  }

  if (milestone.dependencies.length > 0) {
    sections.push('### Upstream Dependencies')
    for (const depId of milestone.dependencies) {
      const dep = state.milestones.find(m => m.id === depId)
      if (dep) {
        const depProgress = selectMilestoneProgress(dep)
        sections.push(`- \`${depId}\` — ${depProgress.done}/${depProgress.total} (${depProgress.pct}%)`)
      }
    }
    sections.push('')
  }

  const downstream = state.milestones.filter(m => m.dependencies.includes(milestone.id))
  if (downstream.length > 0) {
    sections.push('### Downstream Milestones')
    for (const d of downstream) {
      sections.push(`- \`${d.id}\` — ${d.title}`)
    }
    sections.push('')
  }

  return sections.join('\n')
}

export function buildTaskSummary(state: TrackerState, subtask: Subtask, milestone: Milestone): string {
  const sections: string[] = []

  sections.push(`## Task: ${subtask.id}`)
  sections.push(`- **Label:** ${subtask.label}`)
  sections.push(`- **Status:** ${subtask.status}`)
  sections.push(`- **Domain:** ${milestone.domain}`)
  sections.push('')

  if (subtask.acceptance_criteria.length > 0) {
    sections.push('### Acceptance Criteria')
    for (const c of subtask.acceptance_criteria) {
      sections.push(`- [ ] ${c}`)
    }
    sections.push('')
  }

  if (subtask.constraints.length > 0) {
    sections.push('### Constraints')
    for (const c of subtask.constraints) {
      sections.push(`- ${c}`)
    }
    sections.push('')
  }

  if (subtask.context_files.length > 0) {
    sections.push('### Context Files')
    for (const f of subtask.context_files) {
      sections.push(`- \`${f}\``)
    }
    sections.push('')
  }

  const revisions = state.agent_log.filter(
    e => e.target_id === subtask.id && e.action === 'revision_requested'
  )
  if (revisions.length > 0) {
    sections.push('### Revision History')
    for (const rev of revisions) {
      sections.push(`- **Revision ${revisions.indexOf(rev) + 1}:** ${rev.description}`)
    }
  }

  return sections.join('\n')
}

export function buildProjectStatus(state: TrackerState): string {
  const week = selectCurrentWeek(state)
  const phase = selectCurrentPhase(state)
  const total = state.milestones.reduce((s, m) => s + m.subtasks.length, 0)
  const done = state.milestones.reduce((s, m) => s + m.subtasks.filter(t => t.done).length, 0)
  const inProgress = state.milestones.reduce((s, m) => s + m.subtasks.filter(t => t.status === 'in_progress').length, 0)
  const blocked = state.milestones.reduce((s, m) => s + m.subtasks.filter(t => t.status === 'blocked').length, 0)

  const sections: string[] = []
  sections.push(`# Project Status: ${state.project.name}`)
  sections.push('')
  sections.push(`- **Start Date:** ${state.project.start_date}`)
  sections.push(`- **Target Date:** ${state.project.target_date}`)
  sections.push(`- **Current Week:** ${week}`)
  sections.push(`- **Current Phase:** ${phase || 'None'}`)
  sections.push(`- **Schedule Status:** ${state.project.schedule_status.toUpperCase()}`)
  sections.push(`- **Progress:** ${done}/${total} tasks (${Math.round(state.project.overall_progress * 100)}%)`)
  sections.push(`- **In Progress:** ${inProgress}`)
  sections.push(`- **Blocked:** ${blocked}`)
  sections.push(`- **Milestones:** ${state.milestones.length}`)

  return sections.join('\n')
}

export function buildMilestoneOverview(milestone: Milestone, state: TrackerState): string {
  const progress = selectMilestoneProgress(milestone)
  const sections: string[] = []

  sections.push(`# Milestone: ${milestone.title}`)
  sections.push('')
  sections.push(`- **ID:** \`${milestone.id}\``)
  sections.push(`- **Domain:** ${milestone.domain}`)
  sections.push(`- **Phase:** ${milestone.phase}`)
  sections.push(`- **Week:** ${milestone.week}`)
  sections.push(`- **Planned:** ${milestone.planned_start ?? 'TBD'} → ${milestone.planned_end ?? 'TBD'}`)
  if (milestone.actual_start) sections.push(`- **Actual Start:** ${milestone.actual_start}`)
  if (milestone.actual_end) sections.push(`- **Actual End:** ${milestone.actual_end}`)
  if (milestone.drift_days !== 0) {
    sections.push(`- **Drift:** ${milestone.drift_days > 0 ? '+' : ''}${milestone.drift_days} days`)
  }
  if (milestone.key_milestone_label) {
    sections.push(`- **Key Milestone:** ${milestone.key_milestone_label}`)
  }
  sections.push(`- **Progress:** ${progress.done}/${progress.total} (${progress.pct}%)`)
  sections.push('')

  if (milestone.notes.length > 0) {
    sections.push('### Exit Criteria')
    for (const n of milestone.notes) {
      sections.push(`- ${n}`)
    }
    sections.push('')
  }

  sections.push('### Tasks')
  for (const t of milestone.subtasks) {
    sections.push(`- ${statusIcon(t.status)} \`${t.id}\` — ${t.label} [${t.priority}]${t.assignee ? ` @${t.assignee}` : ''}`)
  }

  if (milestone.dependencies.length > 0) {
    sections.push('')
    sections.push('### Dependencies')
    for (const depId of milestone.dependencies) {
      const dep = state.milestones.find(m => m.id === depId)
      if (dep) {
        const depProgress = selectMilestoneProgress(dep)
        const status = depProgress.done === depProgress.total ? 'done' : `${depProgress.pct}%`
        sections.push(`- \`${depId}\` — ${dep.title} (${status})`)
      }
    }
  }

  return sections.join('\n')
}

function statusIcon(status: string): string {
  switch (status) {
    case 'done': return 'done'
    case 'in_progress': return 'in progress'
    case 'blocked': return 'blocked'
    case 'review': return 'review'
    default: return 'todo'
  }
}
