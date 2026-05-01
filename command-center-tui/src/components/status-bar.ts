import blessed from 'blessed'
import { WIDGET_STYLES, COLORS } from '../theme.js'
import { state, selectCurrentWeek, selectCurrentPhase, selectTaskCounts } from '../store.js'

export function createStatusBar(screen: blessed.Widgets.Screen): blessed.Widgets.BoxElement {
  const bar = blessed.box({
    parent: screen,
    bottom: 0,
    left: 0,
    right: 0,
    height: 1,
    content: '',
    style: {
      bg: WIDGET_STYLES.statusBar.bg,
      fg: WIDGET_STYLES.statusBar.fg,
    },
    tags: true,
    align: 'left',
  })

  updateStatusBar(bar)
  return bar
}

export function updateStatusBar(bar: blessed.Widgets.BoxElement): void {
  const week = selectCurrentWeek()
  const phase = selectCurrentPhase()
  const counts = selectTaskCounts()
  const pct = counts.total > 0 ? Math.round((counts.done / counts.total) * 100) : 0

  const scheduleStatus = state.tracker?.project.schedule_status ?? 'on_track'
  const scheduleColor = scheduleStatus === 'behind' ? COLORS.behind.hex : COLORS.onTrack.hex
  const syncTag = state.synced ? '{fg:#22c55e}● Sync{/}' : '{fg:#ef4444}● Desync{/}'
  const scheduleTag = `{fg:${scheduleColor}}${scheduleStatus.toUpperCase()}{/}`

  const left = ` WEEK ${week}${phase ? ` · ${phase}` : ''}`
  const center = `${counts.done}/${counts.total} (${pct}%)`
  const right = `${scheduleTag}  ${syncTag} `

  bar.setContent(`${left}  │  ${center}  │  ${right}`)
  bar.screen.render()
}
