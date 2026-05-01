import blessed from 'blessed'
import { COLORS, WIDGET_STYLES } from '../theme.js'
import { state } from '../store.js'

export function createCalendarView(parent: blessed.Widgets.BoxElement): blessed.Widgets.BoxElement {
  const tracker = state.tracker

  const box = blessed.box({
    parent,
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    style: WIDGET_STYLES.box,
    border: { type: 'line' },
    label: ' Calendar ',
    tags: true,
  })

  if (!tracker) {
    blessed.text({
      parent: box,
      top: 'center',
      left: 'center',
      content: 'No tracker data',
      style: { fg: COLORS.muted.hex },
    })
    return box
  }

  const completedTasks = tracker.milestones
    .flatMap(m => m.subtasks)
    .filter(t => t.status === 'done' && t.completed_at)

  if (completedTasks.length === 0) {
    blessed.text({
      parent: box,
      top: 'center',
      left: 'center',
      content: 'Completed tasks will appear here as work is finished',
      style: { fg: COLORS.muted.hex },
    })
    return box
  }

  const lines: string[] = []
  lines.push(`{bold}Completed Tasks: ${completedTasks.length}{/}`)
  lines.push('')

  const byDate = new Map<string, typeof completedTasks>()
  for (const t of completedTasks) {
    const date = t.completed_at!.split('T')[0]
    if (!byDate.has(date)) byDate.set(date, [])
    byDate.get(date)!.push(t)
  }

  for (const [date, tasks] of [...byDate.entries()].sort().reverse()) {
    lines.push(`{bold}${date}{/}`)
    for (const t of tasks) {
      lines.push(`  {fg:#22c55e}✓{/} ${t.label}`)
    }
    lines.push('')
  }

  blessed.text({
    parent: box,
    top: 0,
    left: 1,
    right: 1,
    content: lines.join('\n'),
    style: { fg: COLORS.white.hex },
    tags: true,
  })

  return box
}
