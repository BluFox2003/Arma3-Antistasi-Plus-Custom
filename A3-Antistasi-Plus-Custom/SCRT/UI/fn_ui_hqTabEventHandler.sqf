params ["_mode"];

if(_mode == "ADD") then {
    [
        "hqMap",
        "onMapSingleClick",
        {
            playSound "readoutClick";

            private _site = [markersX, _pos] call BIS_fnc_nearestPosition;
            if (getMarkerPos _site distance _pos > 50) exitWith {
                [
                    "FAIL",
                    "Rebuild Assets",  
                    parseText "You must click on friendly map marker.", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            private _side = sidesX getVariable [_site, sideUnknown];
            if (_side != teamPlayer) exitWith {
                [
                    "FAIL",
                    "Rebuild Assets",  
                    parseText format ["Selected site does not belong to %1.", nameTeamPlayer], 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            
            private _resourcesFIA = server getVariable "resourcesFIA";
            if (_resourcesFIA < 5000) exitWith {
                [
                    "FAIL",
                    "Rebuild Assets",  
                    parseText "Not enough money to rebuild assets there.</br>Costs: 5000€", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            [_site, _pos] call A3A_fnc_rebuildAssets;
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["hqMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};