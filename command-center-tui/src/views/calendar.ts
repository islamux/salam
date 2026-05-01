import blessed from 'blessed'
import { COLORS } from '../theme.js'
import { state } from '../store.js'
import type { Subtask } from '../types.js'

const DAYS = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
let viewWeekOffset = 0

export function createCalendarView(parent: blessed.Widgets.BoxElement): blessed.Widgets.BlessedElement {
  const container = blessed.box({
    parent,
    top: 0, left: 0, right: 0, bottom: 0,
    style: { bg: COLORS.dark.hex, border: { fg: COLORS.border.hex } },
    border: { type: 'line' },
    label: ' Calendar ',
    tags: true,
  })

  const tracker = state.tracker
  if (!tracker) {
    blessed.text({ parent: container, top: 'center', left: 'center', content: 'No tracker data', style: { fg: COLORS.muted.hex } })
    return container
  }

  const completedTasks = tracker.milestones
    .flatMap(m => m.subtasks)
    .filter(t => t.status === 'done' && t.completed_at)

  const startDate = new Date(tracker.project.start_date)
  const today = new Date()
  today.setHours(0, 0, 0, 0)

  const targetWeekMonday = getMonday(new Date(today.getTime() + viewWeekOffset * 7 * 24 * 60 * 60 * 1000))
  const weekDays = Array.from({ length: 7 }, (_, i) => {
    const d = new Date(targetWeekMonday.getTime() + i * 24 * 60 * 60 * 1000)
    return d
  })

  // Header
  const weekStartStr = formatShortDate(weekDays[0])
  const weekEndStr = formatShortDate(weekDays[6])
  const weekCompleted = completedTasks.filter(t => {
    const d = new Date(t.completed_at!.split('T')[0])
    return d >= weekDays[0] && d <= weekDays[6]
  })

  const headerText = `  ${viewWeekOffset !== 0 ? '{fg:#585CF0}[h:Prev]{/}  ' : ''}Week ${weekStartStr} – ${weekEndStr} · ${weekCompleted.length} completed  ${viewWeekOffset !== 0 ? '{fg:#585CF0}[l:Next]{/}  ' : ''}  {fg:#585CF0}[t:Today]{/}`

  blessed.box({
    parent: container,
    top: 0, left: 0, right: 0, height: 1,
    content: headerText,
    style: { bg: COLORS.surface.hex, fg: COLORS.white.hex },
    tags: true,
  })

  // Day columns
  const width = container.width as number
  const colWidth = Math.floor((width - 2) / 7)

  weekDays.forEach((day, i) => {
    const dateStr = day.toISOString().split('T')[0]
    const isToday = day.getTime() === today.getTime()
    const dayTasks = completedTasks.filter(t => t.completed_at!.split('T')[0] === dateStr)
    const dayNum = day.getDate()

    const colBg = isToday ? COLORS.accent.hex : COLORS.surface.hex
    const borderColor = isToday ? COLORS.accent.hex : COLORS.border.hex

    const colBox = blessed.box({
      parent: container,
      top: 1, left: 1 + i * colWidth, width: colWidth, bottom: 0,
      style: { bg: colBg, border: { fg: borderColor } },
      border: { type: 'line' },
      label: ` ${DAYS[i]} ${dayNum} `,
      tags: true,
    })

    if (dayTasks.length === 0) {
      blessed.text({
        parent: colBox, top: 'center', left: 'center', width: 'shrink',
        content: isToday ? '{fg:#FFFFFF}—{/}' : '{fg:#1a1a2e}—{/}',
        tags: true,
        style: { fg: COLORS.muted.hex },
      })
      return
    }

    const items = dayTasks.map(t => {
      const milestone = tracker.milestones.find(m => m.subtasks.includes(t))
      const domain = milestone?.domain ?? ''
      return `{fg:#22c55e}✓{/} ${truncate(t.label, colWidth - 5)}\n{fg:#9B9BAA}  ${domain}{/}`
    })

    blessed.text({
      parent: colBox,
      top: 0, left: 1, right: 1,
      content: items.join('\n'),
      tags: true,
      scrollable: true,
      style: { fg: COLORS.white.hex, bg: colBg },
    })
  })

  // Navigation keys
  container.key(['h', 'left'], () => { viewWeekOffset--; refresh(container) })
  container.key(['l', 'right'], () => { viewWeekOffset++; refresh(container) })
  container.key(['t'], () => { viewWeekOffset = 0; refresh(container) })

  container.focus()
  return container
}

function refresh(container: blessed.Widgets.BlessedElement): void {
  container.detach()
  createCalendarView(container.screen.children.find(c => c.options?.top === 1 && c.options?.bottom === 1) as any || container)
  container.screen.render()
}

function getMonday(date: Date): Date {
  const d = new Date(date)
  const day = d.getDay()
  const diff = d.getDate() - day + (day === 0 ? -6 : 1)
  d.setDate(diff)
  d.setHours(0, 0, 0, 0)
  return d
}

function formatShortDate(date: Date): string {
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  return `${months[date.getMonth()]} ${date.getDate()}`
}

function truncate(s: string, maxLen: number): string {
  return s.length > maxLen ? s.slice(0, maxLen - 1) + '…' : s
}
