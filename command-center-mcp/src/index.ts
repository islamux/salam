#!/usr/bin/env node

import { Server } from '@modelcontextprotocol/sdk/server/index.js'
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js'
import { ListToolsRequestSchema, CallToolRequestSchema } from '@modelcontextprotocol/sdk/types.js'
import { toolDefinitions, handleTool } from './tools.js'
import { logger } from './tracker.js'

const server = new Server(
  { name: 'command-center', version: '1.0.0' },
  { capabilities: { tools: {} } },
)

server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: toolDefinitions,
}))

server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params
  logger.info({ tool: name }, 'tool called')
  return await handleTool(name, args ?? {})
})

async function main() {
  const transport = new StdioServerTransport()
  await server.connect(transport)
  logger.info('Command Center MCP server running on stdio')
}

main().catch((error) => {
  logger.error({ error: error.message }, 'fatal error')
  process.exit(1)
})
