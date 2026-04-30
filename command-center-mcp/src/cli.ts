#!/usr/bin/env node

import { handleTool } from './tools.js'

const args = process.argv.slice(2)
if (args.length === 0) {
  console.error('Usage: command-center <tool-name> [args...]')
  process.exit(1)
}

const toolName = args[0].replace(/-/g, '_')
let toolArgs: Record<string, string> = {}

for (let i = 1; i < args.length; i++) {
  if (args[i].startsWith('--')) {
    const key = args[i].slice(2)
    const value = args[i + 1]
    if (value && !value.startsWith('--')) {
      toolArgs[key] = value
      i++
    } else {
      toolArgs[key] = 'true'
    }
  } else if (i === 1 && !args[1].startsWith('--')) {
    toolArgs.task_id = args[1]
    toolArgs.milestone_id = args[1]
  }
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
