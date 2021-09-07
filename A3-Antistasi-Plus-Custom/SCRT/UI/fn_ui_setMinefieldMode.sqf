private _moneyCost = minefieldCost select 0;
private _hrCost = minefieldCost select 1;

private _resourcesFIA = server getVariable "resourcesFIA";
private _hrFIA = server getVariable "hr";
private _mineQuantity = minefieldCost select 2;

if ((_resourcesFIA < _moneyCost) or (_hrFIA < _hrCost)) exitWith {
	[
        "FAIL",
        "Minefield",  
        parseText format ["You have not enough resources to establish new minefield.<br/> %1 HR and %2 € needed.", _hrCost, _moneyCost], 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};
if ("Mines" in A3A_activeTasks) exitWith {
	[
        "FAIL",
        "Minefield",  
        parseText "We can only deploy one minefield at a time.", 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (!([player] call A3A_fnc_hasRadio)) exitWith {
    [
        "FAIL",
        "Minefield",  
        parseText "You need a radio in your inventory to be able to give orders to other squads while establishing outpost.", 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (_mineQuantity < 5) exitWith {
    [
        "FAIL",
        "Minefield",  
        parseText "You need at least 5 mines of selected type to build minefield.", 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_minefieldEventHandler;

[
    "INFO",
    "Create Minefield",  
    parseText "Click on desired position on map to build minefield there.", 
    60
] spawn SCRT_fnc_ui_showMessage;