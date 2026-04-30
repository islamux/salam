import { TrackerState, Milestone, Subtask } from './tracker.js';
export declare function buildTaskContext(state: TrackerState, subtask: Subtask, milestone: Milestone): string;
export declare function buildTaskSummary(state: TrackerState, subtask: Subtask, milestone: Milestone): string;
export declare function buildProjectStatus(state: TrackerState): string;
export declare function buildMilestoneOverview(milestone: Milestone, state: TrackerState): string;
