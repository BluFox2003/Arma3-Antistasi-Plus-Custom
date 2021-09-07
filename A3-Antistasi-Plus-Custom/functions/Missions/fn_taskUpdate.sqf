/*
    A3A_fnc_taskUpdate

    Maintains the A3A task list and related vars:
    A3A_tasksData: array of all active tasks, format [taskID, type, state, creationTime]. Non-public.
    A3A_activeTasks: unique string array of all active task types, completed or not. Public.
    A3A_taskCount: number of tasks created. Used to help generate unique task IDs. Public.

    Parameters:
    <STRING> taskID: Unique ID for task.
    <STRING> taskType: Task type. Will act appropriately if non-unique.
    <STRING> state/action: CREATED, DELETED, SUCCEEDED, FAILED

    Scope: Server, preferably unscheduled
*/

private _fileName = "fn_taskUpdate";

if (!isServer) exitWith { [3,"Server-only function miscalled", _fileName, true] call A3A_fnc_log; };


params ["_taskId", "_taskType", "_state"];
private _taskIndex = A3A_tasksData findIf { (_x#0) isEqualTo _taskId };

if (_state isEqualTo "CREATED") exitWith
{
    A3A_taskCount = A3A_taskCount + 1; publicVariable "A3A_taskCount";

    if (_taskIndex != -1) exitWith { [3, format ["Non-unique task ID %1 created", _taskId], _fileName, true] call A3A_fnc_log; };
    A3A_tasksData pushBack [_taskId, _taskType, "CREATED", serverTime];

    if (A3A_activeTasks find _taskType != -1) exitWith { [3, format ["Task type %1 already active", _taskType], _fileName, true] call A3A_fnc_log; };
    A3A_activeTasks pushBack _taskType; publicVariable "A3A_activeTasks";
};

if (_taskIndex == -1) exitWith { [3, format ["Task ID %1 not found for state %2", _taskId, _state], _fileName, true] call A3A_fnc_log; };

if (_state isEqualTo "DELETED") exitWith {
    A3A_tasksData deleteAt _taskIndex;
    if (A3A_tasksData findIf { (_x#1) isEqualTo _taskType } != -1) exitWith {};				// non-unique task type
    A3A_activeTasks deleteAt (A3A_activeTasks find _taskType); publicVariable "A3A_activeTasks";
};

if !(_state in ["SUCCEEDED", "FAILED"]) exitWith { [3, format ["Bad state %1 for task ID %2", _state, _taskId], _fileName, true] call A3A_fnc_log; };
(A3A_tasksData#_taskIndex) set [2, _state];
