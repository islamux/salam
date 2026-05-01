import blessed from 'blessed'
import { COLORS, WIDGET_STYLES } from '../theme.js'
import type { TabId } from '../types.js'

const TABS: { id: TabId; label: string; key: string }[] = [
  { id: 'swim-lane', label: 'Swim Lane', key: '1' },
  { id: 'task-board', label: 'Task Board', key: '2' },
  { id: 'agent-hub', label: 'Agent Hub', key: '3' },
  { id: 'calendar', label: 'Calendar', key: '4' },
]

export function createTabBar(screen: blessed.Widgets.Screen, activeTab: TabId): blessed.Widgets.BoxElement {
  const parts = TABS.map(t => {
    const isActive = t.id === activeTab
    const tag = isActive ? 'fg:white bg:#585CF0 bold' : 'fg:#9B9BAA'
    return `{${tag}} [${t.key}] ${t.label} {/}`
  })

  const bar = blessed.box({
    parent: screen,
    top: 0,
    left: 0,
    right: 0,
    height: 1,
    content: parts.join('  '),
    style: {
      bg: WIDGET_STYLES.tabBar.bg,
    },
    tags: true,
  })

  return bar
}
