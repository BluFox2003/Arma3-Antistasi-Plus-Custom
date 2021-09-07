#define MONEY_AMOUNT 500

_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < MONEY_AMOUNT) exitWith {
    [
        "FAIL",
        "Money Grab",  
        parseText format ["%1 has not enough money to transfer.", nameTeamPlayer], 
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

server setvariable ["resourcesFIA", _resourcesFIA - MONEY_AMOUNT, true];
[-2,theBoss] call A3A_fnc_playerScoreAdd;
[MONEY_AMOUNT] call A3A_fnc_resourcesPlayer;

[
    "SUCCESS",
    "Money Grab",  
    parseText format ["You grabbed %1 € from the %2 Money Pool.<br/><br/>This will affect your prestige and status among %2 forces.", str MONEY_AMOUNT, nameTeamPlayer], 
    15
] spawn SCRT_fnc_ui_showMessage;