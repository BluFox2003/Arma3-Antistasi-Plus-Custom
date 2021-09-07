["REMOVE"] call SCRT_fnc_ui_manageSupportTabEventHandler;
["REMOVE"] call SCRT_fnc_ui_hqTabEventHandler;
["REMOVE"] call SCRT_fnc_ui_establishOutpostEventHandler;
["REMOVE"] call SCRT_fnc_ui_disbandGarrisonEventHandler;
["REMOVE"] call SCRT_fnc_ui_recruitGarrisonEventHandler;
["REMOVE"] call SCRT_fnc_ui_minefieldEventHandler;

menuSliderArray = nil;
menuComplete = nil;
menuSliderCurrent = nil;
outpostType = nil;
supportType = nil;
minefieldType = nil;
outpostCost = nil;
minefieldCost = nil;

if (!isNil "forbiddenParadropZones") then {
    {deleteMarkerLocal _x} forEach forbiddenParadropZones;
};

[] spawn SCRT_fnc_ui_clearSupport;
[] call SCRT_fnc_ui_clearOutpost;