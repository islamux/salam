export const COLORS = {
  accent:     { hex: '#585CF0', ansi: 63  },
  accentLt:   { hex: '#8286FF', ansi: 105 },
  onTrack:    { hex: '#22c55e', ansi: 35  },
  behind:     { hex: '#ef4444', ansi: 196 },
  review:     { hex: '#f59e0b', ansi: 214 },
  muted:      { hex: '#9B9BAA', ansi: 247 },
  surface:    { hex: '#111118', ansi: 233 },
  dark:       { hex: '#0A0A10', ansi: 16  },
  border:     { hex: '#1a1a2e', ansi: 234 },
  white:      { hex: '#FFFFFF', ansi: 255 },
  black:      { hex: '#000000', ansi: 0   },

  statusTodo:       { hex: '#9B9BAA', ansi: 247 },
  statusInProgress: { hex: '#585CF0', ansi: 63  },
  statusReview:     { hex: '#f59e0b', ansi: 214 },
  statusDone:       { hex: '#22c55e', ansi: 35  },
  statusBlocked:    { hex: '#ef4444', ansi: 196 },

  domainPalette: [
    { hex: '#f59e0b', ansi: 214 },
    { hex: '#22c55e', ansi: 35  },
    { hex: '#8286FF', ansi: 105 },
    { hex: '#ef4444', ansi: 196 },
    { hex: '#14B8A6', ansi: 37  },
    { hex: '#EC4899', ansi: 199 },
    { hex: '#F97316', ansi: 208 },
    { hex: '#6366F1', ansi: 63  },
    { hex: '#06B6D4', ansi: 38  },
    { hex: '#9B9BAA', ansi: 247 },
  ],
} as const

export function domainColor(domain: string, domains: string[]): number {
  const idx = domains.indexOf(domain)
  return COLORS.domainPalette[idx % COLORS.domainPalette.length].ansi
}

export function getDomains(): string[] {
  return [
    'amber', 'green', 'indigo', 'red', 'teal',
    'pink', 'orange', 'violet', 'cyan', 'muted',
  ]
}

export function statusColor(status: string): number {
  switch (status) {
    case 'done': return COLORS.statusDone.ansi
    case 'in_progress': return COLORS.statusInProgress.ansi
    case 'review': return COLORS.statusReview.ansi
    case 'blocked': return COLORS.statusBlocked.ansi
    default: return COLORS.statusTodo.ansi
  }
}

export const WIDGET_STYLES = {
  screen: {
    bg: COLORS.dark.hex,
    fg: COLORS.white.hex,
  },
  box: {
    bg: COLORS.surface.hex,
    fg: COLORS.white.hex,
    border: { fg: COLORS.border.hex },
  },
  list: {
    bg: COLORS.surface.hex,
    fg: COLORS.white.hex,
    selectedBg: COLORS.accent.hex,
    selectedFg: COLORS.white.hex,
    border: { fg: COLORS.border.hex },
    focus: {
      selectedBg: COLORS.accentLt.hex,
    },
  },
  table: {
    bg: COLORS.surface.hex,
    fg: COLORS.white.hex,
    selectedBg: COLORS.accent.hex,
    selectedFg: COLORS.white.hex,
    border: { fg: COLORS.border.hex },
    headerBg: COLORS.border.hex,
    headerFg: COLORS.white.hex,
  },
  tabBar: {
    bg: COLORS.dark.hex,
    fg: COLORS.muted.hex,
    activeBg: COLORS.accent.hex,
    activeFg: COLORS.white.hex,
  },
  statusBar: {
    bg: COLORS.surface.hex,
    fg: COLORS.muted.hex,
  },
} as const
