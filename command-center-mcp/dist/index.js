// src/index.ts
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio';
import { get_task_context, get_task_summary, get_project_status, list_tasks, get_task_history, list_agents, get_activity_feed, start_task, complete_task, approve_task, reject_task, reset_task, block_task, unblock_task, update_task, log_action, add_milestone_note, set_milestone_dates, update_drift, create_milestone, add_milestone_task, register_agent } from './tools.js';
// MCP Server setup
const transport = new StdioServerTransport();
// Register tool handlers
const tools = {
    // Read tools
    get_task_context,
    get_task_summary,
    get_project_status,
    get_milestone_overempt,
    list_tasks,
    get_task_history,
    list_agents,
    get_activity_feed,
    // Write tools - Task Lifecycle
    start_task,
    complete_task,
    approve_task,
    reject_task,
    reset_task,
    block_task,
    unblock_task,
    update_task,
    log_action,
    // Write tools - Task Enrichment
    add_milestone_note,
    set_milestone_dates,
    update_drift,
    create_milestone,
    add_milestone_task,
    register_agent
};
console.error('Command Center MCP server running on stdio');
transport.start(tools);
//# sourceMappingURL=index.js.map