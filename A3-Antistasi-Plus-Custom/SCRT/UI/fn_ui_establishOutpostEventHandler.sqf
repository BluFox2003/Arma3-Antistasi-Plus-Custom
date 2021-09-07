params ["_mode"];

if(_mode == "ADD") then {
    [
        "establishOutpost",
        "onMapSingleClick",
        {
            playSound "readoutClick";

            if (outpostType == "WATCHPOST" && {isOnRoad _pos}) exitWith {
                [
                    "FAIL",
                    "Establish Outpost",  
                    parseText "Watchpost should be not on road.", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            if (outpostType == "WATCHPOST") exitWith {
                [_pos] spawn SCRT_fnc_outpost_createWatchpost;
            };

            if (outpostType == "ROADBLOCK" && {!isOnRoad _pos}) exitWith {
                [
                    "FAIL",
                    "Establish Outpost",  
                    parseText "Roadblock should be on road.", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            if (outpostType == "ROADBLOCK") exitWith {
                [_pos] spawn SCRT_fnc_outpost_createRoadblock;
            };

            if (isNil "outpostOrigin") then {
                outpostOrigin = createMarkerLocal ["BRStart", _pos];
                outpostOrigin setMarkerShapeLocal "ICON";
                outpostOrigin setMarkerTypeLocal "hd_end";
                outpostOrigin setMarkerTextLocal format ["%1 Position", outpostType];

                [
                    "Info",
                    "Establish Outpost",
                    parseText "Set outpost direction.", 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            } else {           
                outpostDirection = createMarkerLocal ["BRFin", _pos];
                outpostDirection setMarkerShapeLocal "ICON";
                outpostDirection setMarkerTypeLocal "hd_dot";
                outpostDirection setMarkerTextLocal format ["%1 Direction", outpostType];

                private _direction = [(getMarkerPos outpostOrigin), (getMarkerPos outpostDirection)] call BIS_fnc_dirTo;

                switch (outpostType) do {
                    case ("AA"): {
                        [(getMarkerPos outpostOrigin), _direction] spawn SCRT_fnc_outpost_createAa;
                    };
                    case ("AT"): {
                        [(getMarkerPos outpostOrigin), _direction] spawn SCRT_fnc_outpost_createAt;
                    };
                    case ("MORTAR"): {
                        [(getMarkerPos outpostOrigin), _direction] spawn SCRT_fnc_outpost_createMortar;
                    };
                    case ("HMG"): {
                        [(getMarkerPos outpostOrigin), _direction] spawn SCRT_fnc_outpost_createHmg;
                    };
                    default {
                        [1, "Bad outpost type.", "establishOutpostEventHandler"] call A3A_fnc_log;
                    };
                };
            }
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};