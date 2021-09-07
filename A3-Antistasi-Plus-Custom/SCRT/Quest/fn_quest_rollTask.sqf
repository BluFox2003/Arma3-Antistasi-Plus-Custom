//	Author: Socrates
// 
//	Description:
//	Rolls tasks for new quest system.
//
//	Returns:
//	Is task created. (BOOLEAN);
//
// 	How to use: 
// 	[] call SCRT_fnc_quest_rollTask;

//Define results for tasks
#define TRADER          1000


diag_log format ["%1: [Antistasi] | INFO | fn_quest_rollTask | Rolling tasks.",servertime];

_return = false;

_tasksWithProbabilities = selectRandomWeighted [TRADER, 1];

switch (_tasksWithProbabilities) do {
    case (TRADER): {
        diag_log format ["%1: [Antistasi] | INFO | fn_quest_rollTask | Trader quest roll.",servertime];

        if(isTraderQuestCompleted || (!(isNil "isTraderQuestAssigned") && {isTraderQuestAssigned})) then {
            diag_log format ["%1: [Antistasi] | INFO | fn_quest_rollTask | Trader quest was already completed/assigned, rerolling.",servertime];
            ["Intel", localize "STR_trader_task_hint_outdated"] call A3A_fnc_customHint;
            // TODO: task reroll when new tasks will be ready
            // TODO: or simply gave everyone money
        } else {
            diag_log format ["%1: [Antistasi] | INFO | fn_quest_rollTask | Trader quest has been assigned.",servertime];
            ["Intel", localize "STR_trader_task_hint_description"] call A3A_fnc_customHint;

            isTraderQuestAssigned = true; 
            publicVariable "isTraderQuestAssigned";

            [] remoteExec ["SCRT_fnc_trader_prepareTraderQuest", 2];
            _return = true;
        };
    };
};

_return