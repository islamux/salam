import blessed from 'blessed'
import { COLORS, WIDGET_STYLES, statusColor, domainColor } from '../theme.js'
import { state, selectMilestone, scheduleWriteBack } from '../store.js'
import type { Subtask, Milestone } from '../types.js'

const COLUMNS: { id: Subtask['status']; label: string; color: string }[] = [
  { id: 'todo', label: 'TO DO', color: COLORS.statusTodo.hex },
  { id: 'in_progress', label: 'IN PROGRESS', color: COLORS.statusInProgress.hex },
  { id: 'review', label: 'REVIEW', color: COLORS.statusReview.hex },
  { id: 'done', label: 'DONE', color: COLORS.statusDone.hex },
  { id: 'blocked', label: 'BLOCKED', color: COLORS.statusBlocked.hex },
]

export function createTaskBoardView(parent: blessed.Widgets.BoxElement): blessed.Widgets.BoxElement {
  const container = blessed.box({
    parent,
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    style: { bg: COLORS.dark.hex },
  })

  const tracker = state.tracker

  if (!tracker) {
    blessed.text({
      parent: container,
      top: 'center',
      left: 'center',
      content: 'No tracker data',
      style: { fg: COLORS.muted.hex },
    })
    return container
  }

  const milestones = tracker.milestones
  if (milestones.length === 0) {
    blessed.text({
      parent: container,
      top: 'center',
      left: 'center',
      content: 'No milestones yet — milestones will appear after hydration',
      style: { fg: COLORS.muted.hex },
    })
    return container
  }

  const milestone = milestones[state.selectedMilestoneIndex] ?? milestones[0]

  // Context bar
  renderContextBar(container, milestone, milestones)

  // Kanban columns
  renderKanbanColumns(container, milestone)

  return container
}

function renderContextBar(
  parent: blessed.Widgets.BoxElement,
  milestone: Milestone,
  milestones: Milestone[],
): void {
  const done = milestone.subtasks.filter(t => t.done).length
  const total = milestone.subtasks.length
  const idx = state.selectedMilestoneIndex
  const max = milestones.length - 1

  const left = `[${done}/${total}]  {bold}${milestone.domain}{/} · W${milestone.week} · ${milestone.title}`
  const nav = idx > 0 ? ' ← [ ]' : ''
  const navR = idx < max ? ' [ ] →' : ''

  blessed.box({
    parent,
    top: 0,
    left: 0,
    right: 0,
    height: 1,
    content: `${left}${nav}  ${milestone.domain}  ${navR}`,
    style: { bg: COLORS.surface.hex, fg: COLORS.white.hex },
    tags: true,
  })
}

function renderKanbanColumns(parent: blessed.Widgets.BoxElement, milestone: Milestone): void {
  const colWidth = Math.floor((parent.width as number) / 5)
  const domains = [...new Set(parent.width ? [milestone.domain] : [])]

  COLUMNS.forEach((col, i) => {
    const tasks = milestone.subtasks.filter(t => t.status === col.id)
    const left = i * colWidth

    const columnBox = blessed.box({
      parent,
      top: 1,
      left,
      width: colWidth,
      bottom: 0,
      style: {
        bg: COLORS.surface.hex,
        border: { fg: COLORS.border.hex },
      },
      border: { type: 'line' },
      label: ` ${col.label} (${tasks.length}) `,
      tags: true,
    })

    if (tasks.length === 0) return

    const items = tasks.map(t => {
      const assignee = t.assignee ? ` @{fg:#585CF0}${t.assignee}{/}` : ''
      const blocked = t.status === 'blocked' && t.blocked_reason
        ? `\n    {fg:#ef4444}${t.blocked_reason}{/}`
        : ''
      return `{bold}${t.priority}{/} ${t.label}${assignee}${blocked}`
    })

    const list = blessed.list({
      parent: columnBox,
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      items,
      style: {
        bg: COLORS.surface.hex,
        fg: COLORS.white.hex,
        selected: {
          bg: COLORS.accent.hex,
          fg: COLORS.white.hex,
        },
      },
      keys: true,
      mouse: true,
      vi: true,
      tags: true,
      scrollable: true,
    })

    list.on('select', () => {
      // Task selected - could open detail modal
    })
  })
}
