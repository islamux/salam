import blessed from 'blessed'
import { COLORS, WIDGET_STYLES } from '../theme.js'
import { state } from '../store.js'

export function createSwimLaneView(parent: blessed.Widgets.BoxElement): blessed.Widgets.BoxElement {
  const tracker = state.tracker

  const box = blessed.box({
    parent,
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    style: WIDGET_STYLES.box,
    border: { type: 'line' },
    label: ' Swim Lane ',
    tags: true,
  })

  if (!tracker || tracker.milestones.length === 0) {
    blessed.text({
      parent: box,
      top: 'center',
      left: 'center',
      content: 'Milestones will appear here after hydration',
      style: { fg: COLORS.muted.hex },
    })
    return box
  }

  const week = Math.max(1, Math.min(
    Math.ceil(
      (new Date(tracker.project.target_date).getTime() - new Date(tracker.project.start_date).getTime())
      / (1000 * 60 * 60 * 24 * 7)
    ),
    Math.floor(
      (Date.now() - new Date(tracker.project.start_date).getTime())
      / (1000 * 60 * 60 * 24 * 7)
    ) + 1
  ))

  const lines: string[] = []
  lines.push(`{bold}Current Week: ${week}{/}`)
  lines.push('')

  const domains = [...new Set(tracker.milestones.map(m => m.domain))]
  for (const domain of domains) {
    const milestones = tracker.milestones
      .filter(m => m.domain === domain)
      .sort((a, b) => a.week - b.week)

    const nodes = milestones.map(m => {
      const done = m.subtasks.filter(t => t.done).length
      const total = m.subtasks.length
      const drift = m.drift_days !== 0 ? ` (${m.drift_days > 0 ? '+' : ''}${m.drift_days}d)` : ''
      return `[${done}/${total}] ${m.title}${drift}`
    })

    lines.push(`{bold}${domain}{/}: ${nodes.join(' → ')}`)
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
