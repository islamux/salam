import blessed from 'blessed'
import { COLORS } from '../theme.js'
import { state, selectCurrentWeek, selectCurrentPhase, selectTaskCounts } from '../store.js'
import type { Agent, AgentLogEntry } from '../types.js'

export function createAgentHubView(parent: blessed.Widgets.BoxElement): blessed.Widgets.BlessedElement {
  const container = blessed.box({
    parent,
    top: 0, left: 0, right: 0, bottom: 0,
    style: { bg: COLORS.dark.hex },
  })

  const tracker = state.tracker
  if (!tracker) {
    blessed.text({ parent: container, top: 'center', left: 'center', content: 'No tracker data', style: { fg: COLORS.muted.hex } })
    return container
  }

  const width = parent.width as number
  const leftWidth = Math.min(35, Math.floor(width * 0.3))
  const rightWidth = width - leftWidth

  // Left column
  const leftCol = blessed.box({
    parent: container,
    top: 0, left: 0, width: leftWidth, bottom: 0,
    style: { bg: COLORS.surface.hex, border: { fg: COLORS.border.hex } },
    border: { type: 'line' },
  })

  renderConnectedAgents(leftCol, tracker.agents)
  renderSharedState(leftCol, tracker.agents.length, tracker.milestones.length, tracker.agent_log.length)

  // Right column
  const rightCol = blessed.box({
    parent: container,
    top: 0, left: leftWidth, width: rightWidth, bottom: 0,
    style: { bg: COLORS.surface.hex, border: { fg: COLORS.border.hex } },
    border: { type: 'line' },
  })

  renderActivityFeed(rightCol, tracker.agent_log, tracker.agents)
  renderAgentPerformance(rightCol, tracker.agents, tracker.agent_log)

  return container
}

function renderConnectedAgents(parent: blessed.Widgets.BlessedElement, agents: Agent[]): void {
  const lines: string[] = []
  lines.push('{bold}  CONNECTED AGENTS{/}')
  lines.push('')

  if (agents.length === 0) {
    lines.push('{fg:#9B9BAA}  No agents registered.{/}')
    lines.push('{fg:#9B9BAA}  Agents register via MCP.{/}')
  } else {
    const now = Date.now()
    const grouped = {
      orchestrators: agents.filter(a => a.type === 'orchestrator'),
      others: agents.filter(a => a.type !== 'orchestrator'),
    }

    for (const agent of [...grouped.orchestrators, ...grouped.others]) {
      const isActive = agent.last_action_at && (now - new Date(agent.last_action_at).getTime()) < 30 * 60 * 1000
      const dot = isActive ? '{fg:#22c55e}●{/}' : '{fg:#9B9BAA}○{/}'
      const statusText = isActive ? '{fg:#22c55e}ACTIVE{/}' : '{fg:#9B9BAA}IDLE{/}'
      const ago = agent.last_action_at ? timeAgo(new Date(agent.last_action_at)) : 'never'
      const perms = agent.permissions.map(p => `{bold}[${p.toUpperCase()}]{/}`).join(' ')
      lines.push(`  ${dot} {bold}${agent.name}{/}  ${statusText} ${ago}`)
      lines.push(`     ${perms}  ${agent.session_action_count} actions`)
      lines.push('')
    }
  }

  blessed.text({
    parent,
    top: 0, left: 0, right: 0,
    height: Math.max(8, agents.length * 3 + 4),
    content: lines.join('\n'),
    tags: true,
    style: { fg: COLORS.white.hex, bg: COLORS.surface.hex },
  })
}

function renderSharedState(parent: blessed.Widgets.BlessedElement, agentCount: number, milestoneCount: number, logCount: number): void {
  const top = parent.children.length > 0 ? (parent.children[0] as any).height + 1 : 10

  const synced = state.synced
  const syncTag = synced ? '{fg:#22c55e}● Active{/}' : '{fg:#ef4444}● Inactive{/}'

  const counts = selectTaskCounts()
  const week = selectCurrentWeek()
  const phase = selectCurrentPhase()

  const lines: string[] = []
  lines.push('{bold}  SHARED STATE{/}')
  lines.push(`  File: project-tracker.json`)
  lines.push(`  Watcher: ${syncTag}`)
  lines.push(`  Milestones: ${milestoneCount}  Tasks: ${counts.total}`)
  lines.push('')
  lines.push('{bold}  CONTEXT INJECTION{/}')
  lines.push(`  WEEK ${week}${phase ? `, Phase: ${phase}` : ''}`)
  lines.push(`  Progress: ${Math.round((counts.done / Math.max(1, counts.total)) * 100)}% (${counts.done}/${counts.total})`)
  lines.push(`  Blocked: ${counts.blocked}`)
  lines.push(`  Schedule: ${state.tracker?.project.schedule_status.toUpperCase() ?? 'N/A'}`)

  blessed.text({
    parent,
    top, left: 0, right: 0,
    height: 12,
    content: lines.join('\n'),
    tags: true,
    style: { fg: COLORS.white.hex, bg: COLORS.surface.hex },
  })
}

function renderActivityFeed(parent: blessed.Widgets.BlessedElement, log: AgentLogEntry[], agents: Agent[]): void {
  const lines: string[] = []
  lines.push('{bold}  ACTIVITY FEED{/}')
  lines.push('')

  if (log.length === 0) {
    lines.push('{fg:#9B9BAA}  No activity recorded yet{/}')
  } else {
    const sorted = [...log].sort((a, b) => new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime())
    const entries = sorted.slice(0, 30)

    let lastDate = ''
    for (const entry of entries) {
      const date = new Date(entry.timestamp)
      const dateStr = date.toISOString().split('T')[0]
      if (dateStr !== lastDate) {
        const isToday = dateStr === new Date().toISOString().split('T')[0]
        lines.push(`  {bold}${isToday ? 'TODAY' : dateStr}{/}`)
        lastDate = dateStr
      }

      const time = date.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' })
      const agent = agents.find(a => a.id === entry.agent_id)
      const agentName = agent?.name ?? entry.agent_id
      const tags = entry.tags.length > 0 ? ` {fg:#8286FF}[${entry.tags.join(',')}]{/}` : ''
      lines.push(`  {fg:#585CF0}${agentName}{/} · ${entry.action}: ${entry.description}${tags}  {fg:#9B9BAA}${time}{/}`)
    }

    if (sorted.length > 30) {
      lines.push('')
      lines.push('{fg:#9B9BAA}  ... and ' + (sorted.length - 30) + ' more entries{/}')
    }
  }

  blessed.text({
    parent,
    top: 0, left: 0, right: 0,
    height: Math.min(30, lines.length + 3),
    content: lines.join('\n'),
    tags: true,
    scrollable: true,
    style: { fg: COLORS.white.hex, bg: COLORS.surface.hex },
  })
}

function renderAgentPerformance(parent: blessed.Widgets.BlessedElement, agents: Agent[], log: AgentLogEntry[]): void {
  const top = parent.children.length > 0 ? (parent.children[0] as any).height + 1 : 20

  if (agents.length === 0) return

  const now = new Date()
  const weekStart = new Date(now.getTime() - now.getDay() * 24 * 60 * 60 * 1000)
  const weekLogs = log.filter(e => new Date(e.timestamp) >= weekStart)

  const actionCounts = new Map<string, number>()
  for (const entry of weekLogs) {
    actionCounts.set(entry.agent_id, (actionCounts.get(entry.agent_id) ?? 0) + 1)
  }

  const maxActions = Math.max(1, ...Array.from(actionCounts.values()))

  const lines: string[] = []
  lines.push('{bold}  AGENT PERFORMANCE (THIS WEEK){/}')
  lines.push('')

  for (const agent of agents) {
    const count = actionCounts.get(agent.id) ?? 0
    const barLen = Math.round((count / maxActions) * 15)
    const bar = '█'.repeat(barLen) + '░'.repeat(15 - barLen)
    lines.push(`  {fg:${agent.color}}${bar}{/} ${count} actions  ${agent.name}`)
  }

  blessed.text({
    parent,
    top, left: 0, right: 0,
    height: agents.length + 4,
    content: lines.join('\n'),
    tags: true,
    style: { fg: COLORS.white.hex, bg: COLORS.surface.hex },
  })
}

function timeAgo(date: Date): string {
  const seconds = Math.floor((Date.now() - date.getTime()) / 1000)
  if (seconds < 60) return `${seconds}s ago`
  const minutes = Math.floor(seconds / 60)
  if (minutes < 60) return `${minutes}m ago`
  const hours = Math.floor(minutes / 60)
  if (hours < 24) return `${hours}h ago`
  const days = Math.floor(hours / 24)
  return `${days}d ago`
}
