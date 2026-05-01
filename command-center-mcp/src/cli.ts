#!/usr/bin/env node

import { handleTool } from './tools.js'

const args = process.argv.slice(2)
if (args.length === 0) {
  console.error('Usage: command-center <tool-name> [args...]')
  process.exit(1)
}

const toolName = args[0].replace(/-/g, '_')
let toolArgs: Record<string, any> = {}

const ARRAY_KEYS = new Set(['permissions', 'tags', 'acceptance_criteria', 'constraints', 'depends_on', 'context_files', 'reference_docs'])

const positionalMap: Record<string, string[]> = {
  register_agent: ['agent_id', 'name', 'type'],
  create_milestone: ['id', 'title'],
  add_milestone_note: ['milestone_id', 'note'],
  update_drift: ['milestone_id', 'drift_days'],
}

const positional = positionalMap[toolName] ?? []
let posIdx = 0

for (let i = 1; i < args.length; i++) {
  if (args[i].startsWith('--')) {
    const key = args[i].slice(2)
    const value = args[i + 1]
    if (value && !value.startsWith('--')) {
      toolArgs[key] = ARRAY_KEYS.has(key) ? value.split(',') : value
      i++
    } else {
      toolArgs[key] = 'true'
    }
  } else if (posIdx < positional.length) {
    const key = positional[posIdx++]
    toolArgs[key] = ARRAY_KEYS.has(key) ? args[i].split(',') : args[i]
  } else if (i === 1 && !args[1].startsWith('--')) {
    toolArgs.task_id = args[i]
    toolArgs.milestone_id = args[i]
  }
}

if (toolName === 'update_drift' && toolArgs.drift_days) {
  toolArgs.drift_days = parseInt(toolArgs.drift_days, 10)
}

handleTool(toolName, toolArgs).then((result) => {
  const text = result.content[0].text
  if (result.isError) {
    console.error(text)
    process.exit(1)
  }
  console.log(text)
}).catch((error) => {
  console.error(`Error: ${error.message}`)
  process.exit(1)
})
