import blessed from 'blessed'
import { COLORS, WIDGET_STYLES } from '../theme.js'
import { state } from '../store.js'

export function createAgentHubView(parent: blessed.Widgets.BoxElement): blessed.Widgets.BoxElement {
  const tracker = state.tracker

  const box = blessed.box({
    parent,
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    style: WIDGET_STYLES.box,
    border: { type: 'line' },
    label: ' Agent Hub ',
    tags: true,
  })

  if (!tracker || tracker.agents.length === 0) {
    blessed.text({
      parent: box,
      top: 'center',
      left: 'center',
      content: 'No agents registered. Agents register via MCP register_agent tool.',
      style: { fg: COLORS.muted.hex },
    })
    return box
  }

  const now = Date.now()
  const lines: string[] = []
  lines.push('{bold}Connected Agents{/}')
  lines.push('')

  for (const agent of tracker.agents) {
    const isActive = agent.last_action_at && (now - new Date(agent.last_action_at).getTime()) < 30 * 60 * 1000
    const dot = isActive ? '{fg:#22c55e}●{/}' : '{fg:#9B9BAA}○{/}'
    const statusText = isActive ? 'ACTIVE' : 'IDLE'
    const perms = agent.permissions.map(p => `[${p.toUpperCase()}]`).join(' ')
    lines.push(`  ${dot} ${agent.name}  {bold}${statusText}{/}  ${perms}  ${agent.session_action_count} actions`)
  }

  const recentLog = [...tracker.agent_log].sort((a, b) =>
    new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime()
  ).slice(0, 10)

  if (recentLog.length > 0) {
    lines.push('')
    lines.push('{bold}Recent Activity{/}')
    lines.push('')
    for (const entry of recentLog) {
      const time = new Date(entry.timestamp).toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' })
      lines.push(`  {fg:#585CF0}${entry.agent_id}{/} · ${entry.action}: ${entry.description}  ${time}`)
    }
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
