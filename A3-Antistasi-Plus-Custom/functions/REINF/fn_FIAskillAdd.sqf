if (player != theBoss) exitWith {
    [
        "FAIL",
        "Skill Add",  
        parseText "Only our Commander has access to this function.", 
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

if (skillFIA > 44) exitWith {
    [
        "FAIL",
        "Skill Add",  
        parseText "Your troops have the maximum training.", 
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

_resourcesFIA = server getVariable "resourcesFIA";
_costs = 1000 + (1.5*(skillFIA *750));

if (_resourcesFIA < _costs) exitWith {
    [
        "FAIL",
        "Skill Add",  
        parseText format ["%1 do not have enough money to afford additional training. %2 € needed", nameTeamPlayer, _costs], 
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

_resourcesFIA = _resourcesFIA - _costs;
skillFIA = skillFIA + 1;

[
    "SUCCESS",
    "Skill Add",  
    parseText format ["%2 Skill Level has been Upgraded<br/>Current level is %1.",skillFIA, nameTeamPlayer], 
    15
] spawn SCRT_fnc_ui_showMessage;

publicVariable "skillFIA";
server setVariable ["resourcesFIA",_resourcesFIA,true];
[] spawn A3A_fnc_statistics;

{
    private _costs = server getVariable _x;
    _costs = round (_costs + (_costs * (skillFIA/560)));
    server setVariable [_x,_costs,true];
} forEach soldiersSDK;

private _display = findDisplay 60000;
if !(str (_display) == "no display") then {
    private _title = _display displayCtrl 3102;
    _title ctrlSetText format ["FIA Skill Level: %1", skillFIA];
};