//	Author: Socrates
// 
//	Description:
//	Removes current trader positon, rollbacks variables and assigns new find trader task.
//
//	Returns:
//	void
//
// 	How to use: 
// 	[] spawn SCRT_fnc_trader_rerollTrader;

#define COST 1000

private _fileName = "fn_trader_rerollTrader";

if (!(isTraderQuestCompleted || (!(isNil 'isTraderQuestAssigned') && {isTraderQuestAssigned}))) exitWith {
    [2,"Trader task is not completed yet, aborting.",_fileName, true] call A3A_fnc_log;
};

[2,"Arms dealer reroll initiated.",_fileName, true] call A3A_fnc_log;

private _resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < COST) exitWith {
    [
        "FAIL",
        "Trader Position Reroll",  
        parseText "Not enough money to reroll", 
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

closeDialog 0;
closeDialog 0;

[0, -COST] remoteExec ["A3A_fnc_resourcesFIA",2];


[2,"Cancelling state variables.",_fileName, true] call A3A_fnc_log;

isTraderQuestAssigned = false;
isTraderQuestCompleted = false;
publicVariable "isTraderQuestAssigned";
publicVariable "isTraderQuestCompleted";


[2,"Deleting trader markers.",_fileName, true] call A3A_fnc_log;

deleteMarker "TraderMarker";
traderMarker = nil;
publicVariable "traderMarker";

[2,"Deleting trader.",_fileName, true] call A3A_fnc_log;

deleteVehicle traderX;
publicVariable "traderX";

[2,"Deleting trader objects.",_fileName, true] call A3A_fnc_log;

{
    deleteVehicle _x;
} forEach traderObjects;

sleep 1.5;

traderObjects = nil;
publicVariable "traderObjects";

[2,"Assigning new trader task.",_fileName, true] call A3A_fnc_log;

[] remoteExec ["SCRT_fnc_trader_prepareTraderQuest", 2];

[2,"Trader reroll finished.",_fileName, true] call A3A_fnc_log;