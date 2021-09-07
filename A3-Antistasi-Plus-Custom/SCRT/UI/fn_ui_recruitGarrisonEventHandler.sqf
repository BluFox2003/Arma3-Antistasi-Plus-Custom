params ["_mode"];

if(_mode == "ADD") then {
    [
        "recruitGarrison",
        "onMapSingleClick",
        {
            playSound "readoutClick";

            private _site = [markersX, _pos] call BIS_fnc_nearestPosition;
            if (getMarkerPos _site distance _pos > 25) exitWith {
                [
                    "FAIL",
                    "Recruit",  
                    parseText "You must click on friendly outpost.", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            private _side = sidesX getVariable [_site, sideUnknown];
            if (_side != teamPlayer) exitWith {
                [
                    "FAIL",
                    "Recruit",  
                    parseText format ["Selected outpost does not belong to %1.", nameTeamPlayer], 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            if ([_positionX, 500] call A3A_fnc_enemyNearCheck) exitWith {
                [
                    "FAIL",
                    "Recruit",  
                    parseText "You cannot manage this garrison while there are enemies nearby.", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            ["add", _site] spawn A3A_fnc_garrisonDialog;
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};