// src/cli.ts
import { get_task_context, get_task_summary, get_project_status, get_milestone_overview, list_tasks, get_task_history, list_agents, get_activity_feed, start_task, complete_task, approve_task, reject_task, reset_task, block_task, unblock_task, update_task, log_action, enrich_task, add_milestone_note, set_milestone_dates, update_drift, create_milestone, add_milestone_task, register_agent } from './tools.js';
function printHelp() {
    console.log(`
Command Center CLI

Usage: command-center <command> [args]

Read Commands:
  get-task-context <task_id>
  get-task-summary <task_id>
  get-project-status
  get-milestone-overview <milestone_id>
  list-tasks [--milestone id] [--status todo|in_progress|review|done|blocked] [--domain name]
  get-task-history <task_id>
  list-agents
  get-activity-feed [--agent id] [--limit number]

Write Commands:
  start-task <task_id> [--agent agent_id]
  complete-task <task_id> <summary> [--agent agent_id]
  approve-task <task_id> [--feedback feedback_text]
  reject-task <task_id> <feedback>
  reset-task <task_id>
  block-task <task_id> <reason> [--agent agent_id]
  unblock-task <task_id> [--resolution text] [--agent agent_id]
  update-task <task_id> [--priority P1|P2|P3|P4] [--assignee name] [--execution-mode human|agent|pair] [--notes text] [--agent agent_id]
  log-action <target_id> <action> <description> [--tags tag1,tag2] [--agent agent_id]
  enrich-task <task_id> [--prompt text] [--builder-prompt path] [--acceptance-criteria item1,item2] [--constraints item1,item2] [--context-files file1,file2] [--reference-docs url1,url2] [--agent agent_id]
  add-milestone-note <milestone_id> <note>
  set-milestone-dates <milestone_id> [--actual-start YYYY-MM-DD] [--actual-end YYYY-MM-DD]
  update-drift <milestone_id> <drift_days>
  create-milestone <id> <title> [--domain domain] [--phase phase] [--planned-start YYYY-MM-DD] [--planned-end YYYY-MM-DD]
  add-milestone-task <milestone_id> <label> [--priority P1|P2|P3|P4] [--acceptance-criteria item1,item2] [--constraints item1,item2] [--depends-on task1,task2] [--execution-mode human|agent|pair]
  register-agent <agent_id> <name> <type> --permissions perm1,perm2 [--color hex_color] [--parent-id parent_id]
`);
}
function parseArgs(args) {
    const result = {
        command: '',
        options: {},
        positional: []
    };
    if (args.length === 0) {
        printHelp();
        process.exit(1);
    }
    result.command = args[0];
    let i = 1;
    while (i < args.length) {
        const arg = args[i];
        if (arg.startsWith('--')) {
            // Option with value
            const optionName = arg.slice(2);
            if (i + 1 < args.length && !args[i + 1].startsWith('--')) {
                result.options[optionName] = args[i + 1];
                i += 2;
            }
            else {
                result.options[optionName] = 'true';
                i += 1;
            }
        }
        else {
            // Positional argument
            result.positional.push(arg);
            i += 1;
        }
    }
    return result;
}
async function main() {
    const args = process.argv.slice(2);
    if (args.length === 0) {
        printHelp();
        process.exit(1);
    }
    const { command, options, positional } = parseArgs(args);
    try {
        let result;
        // Read commands
        switch (command) {
            case 'get-task-context':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = get_task_context(positional[0]);
                break;
            case 'get-task-summary':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = get_task_summary(positional[0]);
                break;
            case 'get-project-status':
                result = get_project_status();
                break;
            case 'get-milestone-overview':
                if (positional.length < 1)
                    throw new Error('Missing milestone_id');
                result = get_milestone_overview(positional[0]);
                break;
            case 'list-tasks':
                result = list_tasks(options.milestone || undefined, options.status || undefined, options.domain || undefined);
                break;
            case 'get-task-history':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = get_task_history(positional[0]);
                break;
            case 'list-agents':
                result = list_agents();
                break;
            case 'get-activity-feed':
                result = get_activity_feed(options.agent || undefined, options.limit ? parseInt(options.limit) : 30);
                break;
            // Write commands
            case 'start-task':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = start_task(positional[0], options.agent || 'orchestrator');
                break;
            case 'complete-task':
                if (positional.length < 2)
                    throw new Error('Missing task_id or summary');
                result = complete_task(positional[0], positional[1], options.agent || 'orchestrator');
                break;
            case 'approve-task':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = approve_task(positional[0], options.feedback || undefined);
                break;
            case 'reject-task':
                if (positional.length < 2)
                    throw new Error('Missing task_id or feedback');
                result = reject_task(positional[0], positional[1]);
                break;
            case 'reset-task':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = reset_task(positional[0]);
                break;
            case 'block-task':
                if (positional.length < 2)
                    throw new Error('Missing task_id or reason');
                result = block_task(positional[0], positional[1], options.agent || 'orchestrator');
                break;
            case 'unblock-task':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = unblock_task(positional[0], options.resolution || undefined, options.agent || 'orchestrator');
                break;
            case 'update-task':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = update_task(positional[0], options.priority || undefined, options.assignee || undefined, options['execution-mode'] || undefined, options.notes || undefined, options.agent || 'orchestrator');
                break;
            case 'log-action':
                if (positional.length < 3)
                    throw new Error('Missing target_id, action, or description');
                result = log_action(positional[0], positional[1], positional[2], options.tags ? options.tags.split(',') : [], options.agent || 'orchestrator');
                break;
            case 'enrich-task':
                if (positional.length < 1)
                    throw new Error('Missing task_id');
                result = enrich_task(positional[0], options.prompt || undefined, options['builder-prompt'] || undefined, options['acceptance-criteria'] ? options['acceptance-criteria'].split(',') : undefined, options.constraints ? options.constraints.split(',') : undefined, options['context-files'] ? options['context-files'].split(',') : undefined, options['reference-docs'] ? options['reference-docs'].split(',') : undefined, options.agent || 'orchestrator');
                break;
            case 'add-milestone-note':
                if (positional.length < 2)
                    throw new Error('Missing milestone_id or note');
                result = add_milestone_note(positional[0], positional[1]);
                break;
            case 'set-milestone-dates':
                if (positional.length < 1)
                    throw new Error('Missing milestone_id');
                result = set_milestone_dates(positional[0], options['actual-start'] || undefined, options['actual-end'] || undefined);
                break;
            case 'update-drift':
                if (positional.length < 2)
                    throw new Error('Missing milestone_id or drift_days');
                result = update_drift(positional[0], parseInt(positional[1]));
                break;
            case 'create-milestone':
                if (positional.length < 2)
                    throw new Error('Missing id or title');
                result = create_milestone(positional[0], positional[1], options.domain || 'general', options.phase || positional[0], options['planned-start'] || undefined, options['planned-end'] || undefined);
                break;
            case 'add-milestone-task':
                if (positional.length < 2)
                    throw new Error('Missing milestone_id or label');
                result = add_milestone_task(positional[0], positional[1], options.priority || 'P2', options['acceptance-criteria'] ? options['acceptance-criteria'].split(',') : [], options.constraints ? options.constraints.split(',') : [], options['depends-on'] ? options['depends-on'].split(',') : [], options['execution-mode'] || 'agent');
                break;
            case 'register-agent':
                if (positional.length < 3)
                    throw new Error('Missing agent_id, name, or type');
                result = register_agent(positional[0], positional[1], positional[2], options.permissions ? options.permissions.split(',') : [], options.color || '#9B9BAA', options['parent-id'] || undefined);
                break;
            default:
                printHelp();
                process.exit(1);
        }
        // Output result
        if (result.isError) {
            console.error('Error:', result.content[0].text);
            process.exit(1);
        }
        else {
            console.log(result.content[0].text);
        }
    }
    catch (error) {
        console.error('Error:', error instanceof Error ? error.message : String(error));
        process.exit(1);
    }
}
main();
//# sourceMappingURL=cli.js.map