import blessed from 'blessed'
import { COLORS } from '../theme.js'
import { state, selectCurrentWeek } from '../store.js'
import type { Milestone } from '../types.js'

const WEEK_W = 12

export function createSwimLaneView(parent: blessed.Widgets.BoxElement): blessed.Widgets.BlessedElement {
  const container = blessed.box({
    parent,
    top: 0, left: 0, right: 0, bottom: 0,
    style: { bg: COLORS.dark.hex },
    scrollable: true,
    alwaysScroll: true,
    keys: true,
    vi: true,
  })

  const tracker = state.tracker
  if (!tracker) {
    blessed.text({ parent: container, top: 'center', left: 'center', content: 'No tracker data', style: { fg: COLORS.muted.hex } })
    return container
  }

  const startDate = new Date(tracker.project.start_date)
  const targetDate = new Date(tracker.project.target_date)
  const totalDays = (targetDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24)
  const totalWeeks = Math.max(1, Math.ceil(totalDays / 7))
  const currentWeek = selectCurrentWeek()

  const domains = [...new Set(tracker.milestones.map(m => m.domain))]
  const lines: string[] = []

  // Week headers
  let weekHeader = ' '.repeat(10)
  let dateHeader = ' '.repeat(10)
  for (let w = 1; w <= totalWeeks; w++) {
    const weekStart = new Date(startDate.getTime() + (w - 1) * 7 * 24 * 60 * 60 * 1000)
    const dateStr = `${String(weekStart.getMonth() + 1).padStart(2, '0')}-${String(weekStart.getDate()).padStart(2, '0')}`
    weekHeader += `W${String(w).padStart(2, ' ')}    `
    dateHeader += `${dateStr}  `
  }
  lines.push(`{fg:#9B9BAA}${weekHeader}{/}`)
  lines.push(`{fg:#9B9BAA}${dateHeader}{/}`)
  lines.push('')

  // Phase bands
  for (const phase of tracker.schedule.phases) {
    const startPos = 10 + (phase.start_week - 1) * WEEK_W
    const span = (phase.end_week - phase.start_week + 1) * WEEK_W
    lines.push(`{bg:#1a1a2e fg:#9B9BAA}${' '.repeat(startPos)}${'─'.repeat(span)} ${phase.title}{/}`)
  }

  // NOW marker
  const nowPos = 10 + (currentWeek - 1) * WEEK_W + WEEK_W / 2
  const nowLine = ' '.repeat(Math.floor(nowPos)) + '{fg:#585CF0}│{/}'
  lines.push(nowLine + `  {fg:#585CF0}NOW{/}`)
  lines.push('')

  // Swim lanes
  if (domains.length === 0) {
    lines.push('{fg:#9B9BAA}  Milestones will appear here after hydration{/}')
  }

  for (const domain of domains) {
    const domainMilestones = tracker.milestones
      .filter(m => m.domain === domain)
      .sort((a, b) => a.week - b.week)

    const lane = ' '.repeat(10)
    let laneContent = ''

    for (const ms of domainMilestones) {
      const done = ms.subtasks.filter(t => t.done).length
      const total = ms.subtasks.length
      const pos = (ms.week - 1) * WEEK_W
      const node = `[${done}/${total}]`
      const drift = ms.drift_days !== 0
        ? ` {fg:${ms.drift_days > 0 ? '#ef4444' : '#22c55e'}}${ms.drift_days > 0 ? '+' : ''}${ms.drift_days}d{/}`
        : ''
      laneContent += ' '.repeat(Math.max(0, pos - laneContent.length)) + `{bold}${node}{/}${drift}`
    }

    lines.push(`{fg:#f59e0b}  ${domain.padEnd(8)}{/}${laneContent}`)
    lines.push('')
  }

  // Key milestones
  const keyMilestones = tracker.milestones.filter(m => m.is_key_milestone)
  for (const km of keyMilestones) {
    const pos = (km.week - 1) * WEEK_W + 10
    lines.push(' '.repeat(pos) + `{fg:#585CF0}◆{/} ${km.key_milestone_label ?? km.title}`)
  }

  blessed.text({
    parent: container,
    top: 0, left: 0, right: 0,
    content: lines.join('\n'),
    tags: true,
    style: { fg: COLORS.white.hex, bg: COLORS.dark.hex },
  })

  container.key(['n'], () => {
    container.scrollTo(Math.floor(nowPos) - 5)
    container.screen.render()
  })

  container.focus()
  return container
}
