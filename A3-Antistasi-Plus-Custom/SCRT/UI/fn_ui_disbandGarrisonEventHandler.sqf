params ["_mode"];

if(_mode == "ADD") then {
    [
        "disbandGarrison",
        "onMapSingleClick",
        {
            playSound "readoutClick";

            private _site = [markersX, _pos] call BIS_fnc_nearestPosition;
            if (getMarkerPos _site distance _pos > 50) exitWith {
                [
                    "FAIL",
                    "Disband",  
                    parseText "You must click on friendly outpost.", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            private _side = sidesX getVariable [_site, sideUnknown];
            if (_side != teamPlayer) exitWith {
                [
                    "FAIL",
                    "Disband",  
                    parseText format ["Selected outpost does not belong to %1.", nameTeamPlayer], 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            if ([_positionX, 500] call A3A_fnc_enemyNearCheck) exitWith {
                [
                    "FAIL",
                    "Disband",  
                    parseText "You cannot manage this garrison while there are enemies nearby.", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            ["rem", _site] spawn A3A_fnc_garrisonDialog;
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};