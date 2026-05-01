import blessed from 'blessed'
import { createTabBar } from './components/tab-bar.js'
import { createStatusBar, updateStatusBar } from './components/status-bar.js'
import { state, switchTab, toggleTheme, refreshTracker } from './store.js'
import type { TabId } from './types.js'

let screen: blessed.Widgets.Screen
let tabBar: blessed.Widgets.BoxElement
let statusBar: blessed.Widgets.BoxElement
let viewArea: blessed.Widgets.BoxElement
let currentView: blessed.Widgets.BlessedElement | null = null
let viewFactories: Record<TabId, (parent: blessed.Widgets.BoxElement) => blessed.Widgets.BlessedElement>

export function initDashboard(
  blessedScreen: blessed.Widgets.Screen,
  factories: Record<TabId, (parent: blessed.Widgets.BoxElement) => blessed.Widgets.BlessedElement>,
): void {
  screen = blessedScreen
  viewFactories = factories

  tabBar = createTabBar(screen, state.activeTab)

  viewArea = blessed.box({
    parent: screen,
    top: 1,
    left: 0,
    right: 0,
    bottom: 1,
  })

  statusBar = createStatusBar(screen)

  renderActiveView()
}

export function renderDashboard(): void {
  tabBar = createTabBar(screen, state.activeTab)
  updateStatusBar(statusBar)
  renderActiveView()
  screen.render()
}

function renderActiveView(): void {
  if (currentView) {
    currentView.detach()
    currentView = null
  }

  if (viewArea && viewFactories && viewFactories[state.activeTab]) {
    currentView = viewFactories[state.activeTab](viewArea)
    screen.render()
  }
}

export function setupKeys(blessedScreen: blessed.Widgets.Screen): void {
  blessedScreen.key(['q', 'C-c'], () => process.exit(0))
  blessedScreen.key(['1'], () => switchTab('swim-lane'))
  blessedScreen.key(['2'], () => switchTab('task-board'))
  blessedScreen.key(['3'], () => switchTab('agent-hub'))
  blessedScreen.key(['4'], () => switchTab('calendar'))
  blessedScreen.key(['t'], () => { toggleTheme(); renderDashboard() })
  blessedScreen.key(['r'], () => { refreshTracker(); renderDashboard() })
}
