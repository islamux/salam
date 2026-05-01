import blessed from 'blessed'
import { initTracker, onRender, startWatcher, state, switchTab, selectMilestone } from './store.js'
import { initDashboard, renderDashboard, setupKeys } from './dashboard.js'
import { createSwimLaneView } from './views/swim-lane.js'
import { createTaskBoardView } from './views/task-board.js'
import { createAgentHubView } from './views/agent-hub.js'
import { createCalendarView } from './views/calendar.js'
import type { TabId } from './types.js'

const viewFactories: Record<TabId, (parent: blessed.Widgets.BoxElement) => blessed.Widgets.BlessedElement> = {
  'swim-lane': createSwimLaneView,
  'task-board': createTaskBoardView,
  'agent-hub': createAgentHubView,
  'calendar': createCalendarView,
}

async function main(): Promise<void> {
  const screen = blessed.screen({
    smartCSR: true,
    title: 'Command Center',
    fullUnicode: true,
  })

  initTracker()

  onRender(() => renderDashboard())

  initDashboard(screen, viewFactories)
  setupKeys(screen)

  screen.key(['['], () => {
    selectMilestone(state.selectedMilestoneIndex - 1)
    renderDashboard()
  })
  screen.key([']'], () => {
    selectMilestone(state.selectedMilestoneIndex + 1)
    renderDashboard()
  })

  try {
    const chokidar = await import('chokidar')
    startWatcher(chokidar)
  } catch {
    // chokidar not available, file watching disabled
  }

  screen.render()
}

main().catch(console.error)
