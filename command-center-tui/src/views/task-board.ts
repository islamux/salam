import blessed from 'blessed'
import { COLORS, WIDGET_STYLES, statusColor } from '../theme.js'
import { state, scheduleWriteBack } from '../store.js'
import type { Subtask, Milestone, TabId } from '../types.js'

const COLUMNS: { id: Subtask['status']; label: string; color: string }[] = [
  { id: 'todo', label: 'TO DO', color: COLORS.statusTodo.hex },
  { id: 'in_progress', label: 'IN PROGRESS', color: COLORS.statusInProgress.hex },
  { id: 'review', label: 'REVIEW', color: COLORS.statusReview.hex },
  { id: 'done', label: 'DONE', color: COLORS.statusDone.hex },
  { id: 'blocked', label: 'BLOCKED', color: COLORS.statusBlocked.hex },
]

const STATUS_CYCLE: Subtask['status'][] = ['todo', 'in_progress', 'review', 'done']
type FilterType = 'all' | 'agent_tasks' | 'blocked'

let activeColIndex = 0
let activeFilter: FilterType = 'all'
let columnLists: blessed.Widgets.ListElement[] = []
let detailModal: blessed.Widgets.BoxElement | null = null

export function createTaskBoardView(parent: blessed.Widgets.BoxElement): blessed.Widgets.BlessedElement {
  const container = blessed.box({
    parent,
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    style: { bg: COLORS.dark.hex },
  })

  columnLists = []
  const tracker = state.tracker

  if (!tracker) {
    blessed.text({ parent: container, top: 'center', left: 'center', content: 'No tracker data', style: { fg: COLORS.muted.hex } })
    return container
  }

  const milestones = tracker.milestones
  if (milestones.length === 0) {
    blessed.text({ parent: container, top: 'center', left: 'center', content: 'No milestones yet — milestones will appear after hydration', style: { fg: COLORS.muted.hex } })
    return container
  }

  const milestone = milestones[state.selectedMilestoneIndex] ?? milestones[0]
  const tasks = applyFilter(milestone.subtasks)

  renderContextBar(container, milestone, milestones)
  renderFilterBar(container, milestone.subtasks.length, tasks.length)
  renderKanbanColumns(container, milestone, tasks)
  setupBoardKeys(container, milestone)

  if (columnLists.length > 0 && activeColIndex < columnLists.length) {
    columnLists[activeColIndex].focus()
  }

  return container
}

function applyFilter(tasks: Subtask[]): Subtask[] {
  if (activeFilter === 'blocked') return tasks.filter(t => t.status === 'blocked')
  if (activeFilter === 'agent_tasks') return tasks.filter(t => t.assignee !== null)
  return tasks
}

function renderContextBar(parent: blessed.Widgets.BlessedElement, milestone: Milestone, milestones: Milestone[]): void {
  const done = milestone.subtasks.filter(t => t.done).length
  const total = milestone.subtasks.length
  const idx = state.selectedMilestoneIndex
  const max = milestones.length - 1

  const navL = idx > 0 ? '{fg:#585CF0}[{/} ' : '  '
  const navR = idx < max ? ' {fg:#585CF0}]{/}' : '  '
  const info = `{bold}[${done}/${total}]{/}  ${milestone.domain} · W${milestone.week} · {bold}${milestone.title}{/}`

  blessed.box({
    parent,
    top: 0, left: 0, right: 0, height: 1,
    content: ` ${navL}${info}${navR} `,
    style: { bg: COLORS.surface.hex, fg: COLORS.white.hex },
    tags: true,
  })
}

function renderFilterBar(parent: blessed.Widgets.BlessedElement, totalCount: number, filteredCount: number): void {
  const filters: { key: string; type: FilterType; label: string }[] = [
    { key: 'f1', type: 'all', label: `All ${totalCount}` },
    { key: 'f2', type: 'agent_tasks', label: `Agent ${filteredCount}` },
    { key: 'f3', type: 'blocked', label: `Blocked` },
  ]

  const parts = filters.map(f => {
    const isActive = activeFilter === f.type
    const tag = isActive ? `{bold}{fg:#585CF0}[${f.key}:${f.label}]{/}` : `{fg:#9B9BAA}[${f.key}:${f.label}]{/}`
    return tag
  })

  blessed.box({
    parent,
    top: 1, left: 0, right: 0, height: 1,
    content: ` ${parts.join('  ')}`,
    style: { bg: COLORS.dark.hex },
    tags: true,
  })
}

function renderKanbanColumns(parent: blessed.Widgets.BlessedElement, milestone: Milestone, tasks: Subtask[]): void {
  const width = parent.width as number
  const colWidth = Math.floor(width / 5)

  COLUMNS.forEach((col, i) => {
    const colTasks = tasks.filter(t => t.status === col.id)

    const columnBox = blessed.box({
      parent,
      top: 2, left: i * colWidth, width: colWidth, bottom: 0,
      style: { bg: COLORS.surface.hex, border: { fg: COLORS.border.hex } },
      border: { type: 'line' },
      label: ` ${col.label} (${colTasks.length}) `,
      tags: true,
    })

    if (colTasks.length === 0) {
      blessed.text({
        parent: columnBox, top: 'center', left: 'center', width: 'shrink',
        content: '—', style: { fg: COLORS.border.hex },
      })
      return
    }

    const items = colTasks.map(t => {
      const prio = `{fg:${col.color}}${t.priority}{/}`
      const assignee = t.assignee ? ` {fg:#585CF0}@${t.assignee}{/}` : ''
      const blocked = t.status === 'blocked' && t.blocked_reason
        ? `\n  {fg:#ef4444}⊘ ${t.blocked_reason}{/}` : ''
      return `${prio} ${t.label}${assignee}${blocked}`
    })

    const list = blessed.list({
      parent: columnBox,
      top: 0, left: 0, right: 0, bottom: 0,
      items, keys: true, vi: true, mouse: true, scrollable: true,
      tags: true,
      style: {
        bg: COLORS.surface.hex, fg: COLORS.white.hex,
        selected: { bg: COLORS.accent.hex, fg: COLORS.white.hex } as any,
      }
    })

    ;(list as any)._tasks = colTasks
    ;(list as any)._colIndex = i

    list.on('select', (_item: any, idx: number) => {
      const task = colTasks[idx]
      if (task && detailModal) return
      if (task) openDetailModal(parent, task, milestone)
    })

    columnLists.push(list)
  })
}

function setupBoardKeys(container: blessed.Widgets.BlessedElement, milestone: Milestone): void {
  container.key(['tab'], () => {
    activeColIndex = (activeColIndex + 1) % columnLists.length
    columnLists[activeColIndex]?.focus()
  })
  container.key(['S-tab'], () => {
    activeColIndex = (activeColIndex - 1 + columnLists.length) % columnLists.length
    columnLists[activeColIndex]?.focus()
  })
  container.key(['s'], () => {
    const list = columnLists[activeColIndex]
    if (!list) return
    const selected = (list as any).selected ?? 0
    const tasks: Subtask[] = (list as any)._tasks ?? []
    const task = tasks[selected]
    if (!task || task.status === 'blocked') return

    const currentIdx = STATUS_CYCLE.indexOf(task.status as any)
    const nextStatus = STATUS_CYCLE[(currentIdx + 1) % STATUS_CYCLE.length]

    task.status = nextStatus
    task.done = nextStatus === 'done'
    if (nextStatus === 'done') {
      task.completed_at = new Date().toISOString()
      task.completed_by = 'operator'
    } else {
      task.completed_at = null
      task.completed_by = null
      task.done = false
    }

    if (state.tracker) scheduleWriteBack(state.tracker)
    destroyAndRefresh(container)
  })
  container.key(['b'], () => {
    const list = columnLists[activeColIndex]
    if (!list) return
    const selected = (list as any).selected ?? 0
    const tasks: Subtask[] = (list as any)._tasks ?? []
    const task = tasks[selected]
    if (!task) return

    task.status = 'blocked'
    task.blocked_reason = 'Blocked via TUI'
    task.blocked_by = 'operator'
    if (state.tracker) scheduleWriteBack(state.tracker)
    destroyAndRefresh(container)
  })
  container.key(['f1'], () => { activeFilter = 'all'; destroyAndRefresh(container) })
  container.key(['f2'], () => { activeFilter = 'agent_tasks'; destroyAndRefresh(container) })
  container.key(['f3'], () => { activeFilter = 'blocked'; destroyAndRefresh(container) })
}

function openDetailModal(parent: blessed.Widgets.BlessedElement, task: Subtask, milestone: Milestone): void {
  if (detailModal) return

  const screen = parent.screen
  const w = Math.min(70, (screen.width as number) - 4)
  const h = Math.min(22, (screen.height as number) - 4)

  detailModal = blessed.box({
    parent: screen,
    top: 'center', left: 'center', width: w, height: h,
    style: { bg: COLORS.surface.hex, fg: COLORS.white.hex, border: { fg: COLORS.accent.hex } },
    border: { type: 'line' },
    label: ` ${task.id} `,
    tags: true,
    keys: true,
  })

  const lines: string[] = []
  lines.push(`{bold}${task.label}{/}`)
  lines.push('')
  lines.push(`  Status: {fg:${statusColor(task.status)}}${task.status}{/}   Priority: ${task.priority}   Mode: ${task.execution_mode}`)
  if (task.assignee) lines.push(`  Assignee: {fg:#585CF0}${task.assignee}{/}`)
  if (task.blocked_reason) lines.push(`  Blocked: {fg:#ef4444}${task.blocked_reason}{/}`)
  lines.push('')

  if (task.acceptance_criteria.length > 0) {
    lines.push('{bold}Acceptance Criteria:{/}')
    for (const c of task.acceptance_criteria) lines.push(`  - [ ] ${c}`)
    lines.push('')
  }

  if (task.notes) {
    lines.push('{bold}Notes:{/}')
    lines.push(`  ${task.notes}`)
    lines.push('')
  }

  lines.push(`  Milestone: ${milestone.title} (${milestone.domain})`)

  blessed.text({
    parent: detailModal,
    top: 0, left: 1, right: 1, bottom: 2,
    content: lines.join('\n'),
    tags: true,
    scrollable: true,
    style: { fg: COLORS.white.hex, bg: COLORS.surface.hex },
  })

  blessed.box({
    parent: detailModal,
    bottom: 0, left: 0, right: 0, height: 1,
    content: ' {fg:#9B9BAA}[s:Status] [p:Priority] [ESC:Close]{/}',
    style: { bg: COLORS.border.hex },
    tags: true,
  })

  detailModal.key(['escape', 'q'], () => {
    closeDetailModal()
    const list = columnLists[activeColIndex]
    if (list) list.focus()
  })

  detailModal.key(['s'], () => {
    const currentIdx = STATUS_CYCLE.indexOf(task.status as any)
    const nextStatus = STATUS_CYCLE[(currentIdx + 1) % STATUS_CYCLE.length]
    task.status = nextStatus
    task.done = nextStatus === 'done'
    if (nextStatus === 'done') {
      task.completed_at = new Date().toISOString()
      task.completed_by = 'operator'
    } else {
      task.done = false
      task.completed_at = null
    }
    if (state.tracker) scheduleWriteBack(state.tracker)
    closeDetailModal()
    destroyAndRefresh(parent)
  })

  detailModal.focus()
}

function closeDetailModal(): void {
  if (detailModal) {
    detailModal.detach()
    detailModal = null
  }
}

function destroyAndRefresh(parent: blessed.Widgets.BlessedElement): void {
  closeDetailModal()
  parent.detach()
  createTaskBoardView(parent.screen.children.find(c => c.options?.top === 1 && c.options?.bottom === 1) as any || parent)
  parent.screen.render()
}
