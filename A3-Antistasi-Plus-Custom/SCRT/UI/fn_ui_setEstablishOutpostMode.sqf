private _moneyCost = outpostCost select 0;
private _hrCost = outpostCost select 1;

private _resourcesFIA = server getVariable "resourcesFIA";
private _hrFIA = server getVariable "hr";

if ((_resourcesFIA < _moneyCost) or (_hrFIA < _hrCost)) exitWith {
	[
        "FAIL",
        "Establish Outpost",  
        parseText format ["You have not enough resources to establish new outpost.<br/> %1 HR and %2 € needed.", _hrCost, _moneyCost], 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if ("outpostTask" in A3A_activeTasks) exitWith {
    [
        "FAIL",
        "Establish Outpost",  
        parseText "We can only deploy / delete one outpost at time.", 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (!([player] call A3A_fnc_hasRadio)) exitWith {
    [
        "FAIL",
        "Establish Outpost",  
        parseText "You need a radio in your inventory to be able to give orders to other squads while establishing outpost.", 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (outpostType in ["ROADBLOCK", "HMG"] && {tierWar < 3}) exitWith {
    [
        "FAIL",
        "Establish Outpost",  
        parseText "You need to be at War Level 3 to be able to establish roadblocks or HMG emplacements.", 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (outpostType in ["AA", "AT"] && {tierWar < 4}) exitWith {
    [
        "FAIL",
        "Establish Outpost",  
        parseText "You need to be at War Level 4 to be able to establish AA/AT emplacement.", 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (outpostType == "MORTAR" && {tierWar < 5}) exitWith {
    [
        "FAIL",
        "Establish Outpost",  
        parseText "You need to be at War Level 5 to be able to establish mortar emplacement.", 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_establishOutpostEventHandler;

[
    "INFO",
    "Establish Outpost",  
    parseText "Click on desired position on map to establish outpost there.", 
    60
] spawn SCRT_fnc_ui_showMessage;