import fs from 'node:fs'
import { TRACKER_PATH } from './config.js'
import type { TrackerState, TUIState, TabId } from './types.js'

export const state: TUIState = {
  tracker: null,
  loading: true,
  error: null,
  synced: true,
  activeTab: 'task-board',
  selectedMilestoneIndex: 0,
  theme: 'dark',
}

export type RenderFn = () => void
let renderFn: RenderFn = () => {}
let writeTimer: ReturnType<typeof setTimeout> | null = null
let suppressExternalRefresh = false

export function onRender(fn: RenderFn): void {
  renderFn = fn
}

function render(): void {
  renderFn()
}

export function readTrackerFromDisk(): TrackerState | null {
  try {
    const raw = fs.readFileSync(TRACKER_PATH, 'utf-8')
    return JSON.parse(raw)
  } catch {
    return null
  }
}

export function initTracker(): void {
  state.tracker = readTrackerFromDisk()
  state.loading = false
  if (!state.tracker) {
    state.error = 'No tracker file found at ' + TRACKER_PATH
    state.synced = false
  }
}

export function scheduleWriteBack(tracker: TrackerState): void {
  if (writeTimer) clearTimeout(writeTimer)
  writeTimer = setTimeout(() => {
    try {
      suppressExternalRefresh = true
      fs.writeFileSync(TRACKER_PATH, JSON.stringify(tracker, null, 2))
      state.synced = true
      setTimeout(() => { suppressExternalRefresh = false }, 700)
    } catch (e: any) {
      state.error = `Write failed: ${e.message}`
      state.synced = false
    }
  }, 500)
}

export function startWatcher(watcherModule: typeof import('chokidar')): void {
  watcherModule.watch(TRACKER_PATH).on('change', () => {
    if (suppressExternalRefresh) return
    try {
      const data = JSON.parse(fs.readFileSync(TRACKER_PATH, 'utf-8'))
      state.tracker = data
      state.synced = true
      state.error = null
      render()
    } catch {
      // ignore corrupt JSON (file mid-write)
    }
  })
}

export function switchTab(tab: TabId): void {
  state.activeTab = tab
  render()
}

export function selectMilestone(index: number): void {
  if (!state.tracker) return
  const max = state.tracker.milestones.length - 1
  state.selectedMilestoneIndex = Math.max(0, Math.min(max, index))
  render()
}

export function refreshTracker(): void {
  state.loading = true
  render()
  initTracker()
  render()
}

export function toggleTheme(): void {
  state.theme = state.theme === 'dark' ? 'light' : 'dark'
  render()
}

export function selectCurrentWeek(): number {
  if (!state.tracker) return 1
  const start = new Date(state.tracker.project.start_date)
  const now = new Date()
  const diffDays = (now.getTime() - start.getTime()) / (1000 * 60 * 60 * 24)
  const totalWeeks = Math.ceil(
    (new Date(state.tracker.project.target_date).getTime() - start.getTime())
    / (1000 * 60 * 60 * 24 * 7)
  )
  return Math.max(1, Math.min(totalWeeks, Math.floor(diffDays / 7) + 1))
}

export function selectCurrentPhase(): string {
  if (!state.tracker) return ''
  const week = selectCurrentWeek()
  const phase = state.tracker.schedule.phases.find(
    p => week >= p.start_week && week <= p.end_week
  )
  return phase?.title ?? ''
}

export function selectTaskCounts(): { total: number; done: number; inProgress: number; blocked: number } {
  if (!state.tracker) return { total: 0, done: 0, inProgress: 0, blocked: 0 }
  let total = 0, done = 0, inProgress = 0, blocked = 0
  for (const m of state.tracker.milestones) {
    for (const t of m.subtasks) {
      total++
      if (t.status === 'done') done++
      else if (t.status === 'in_progress') inProgress++
      else if (t.status === 'blocked') blocked++
    }
  }
  return { total, done, inProgress, blocked }
}
