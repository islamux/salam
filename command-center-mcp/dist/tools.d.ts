interface ToolResponse {
    content: {
        type: string;
        text: string;
    }[];
    isError?: boolean;
}
export declare function createErrorResponse(message: string): ToolResponse;
export declare function get_task_context(task_id: string): ToolResponse;
export declare function get_task_summary(task_id: string): ToolResponse;
export declare function get_project_status(): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function get_milestone_overview(milestone_id: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function list_tasks(milestone_id?: string, status?: string, domain?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function get_task_history(task_id: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function list_agents(): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function get_activity_feed(agent_id?: string, limit?: number): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function start_task(task_id: string, agent_id?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function complete_task(task_id: string, summary: string, agent_id?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function approve_task(task_id: string, feedback?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function reject_task(task_id: string, feedback: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function reset_task(task_id: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function block_task(task_id: string, reason: string, agent_id?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function unblock_task(task_id: string, resolution?: string, agent_id?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function update_task(task_id: string, priority?: string, assignee?: string, execution_mode?: string, notes?: string, agent_id?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function log_action(target_id: string, action: string, description: string, tags?: string[], agent_id?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function enrich_task(task_id: string, prompt?: string, builder_prompt?: string, acceptance_criteria?: string[], constraints?: string[], context_files?: string[], reference_docs?: string[], agent_id?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function add_milestone_note(milestone_id: string, note: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function set_milestone_dates(milestone_id: string, actual_start?: string, actual_end?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function update_drift(milestone_id: string, drift_days: number): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function create_milestone(id: string, title: string, domain?: string, phase?: string, planned_start?: string, planned_end?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function add_milestone_task(milestone_id: string, label: string, priority?: string, acceptance_criteria?: string[], constraints?: string[], depends_on?: string[], execution_mode?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export declare function register_agent(agent_id: string, name: string, type: 'orchestrator' | 'sub-agent' | 'human' | 'external', permissions: string[], color?: string, parent_id?: string): {
    content: {
        type: string;
        text: string;
    }[];
};
export {};
