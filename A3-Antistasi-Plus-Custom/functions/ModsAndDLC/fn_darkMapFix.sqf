/*
    Author: Spoffy & Håkon
    Description:
        Corrects player aperature based on the time of day for dark maps

    Arguments: <Nil>

    Return Value: <Nil>

    Scope: Clients
    Environment: Scheduled
    Public: Yes
    Dependencies:

    Example: [] spawn A3A_fnc_darkMapFix;

    License: MIT License
*/
private _fileName = "fn_darkMapFix";

if (!canSuspend) exitWith {
    [3, "Executed in non-suspendable environment", _fileName] call A3A_fnc_log;
};

_darkMaps = ["cam_lao_nam"];
if !(toLower worldName in _darkMaps) exitWith {};
if (!isNil "A3A_darkMapFixRunning" && {A3A_darkMapFixRunning}) exitWith {
    [3, "Dark map fix is already running", _fileName] call A3A_fnc_log;
};
A3A_darkMapFixRunning = true;
[3, "Installing dark map fix", _fileName] call A3A_fnc_log;
while {A3A_darkMapFixRunning} do {
    call {
        private _lightBrightness = getLighting select 1;

        if (4 < _lightBrightness && _lightBrightness < 120) exitWith {
            setApertureNew [4, 6, 9, 0.9];
        };

        if (_lightBrightness < 4) exitWith {
            private _minAperture = linearConversion [0, 4, _lightBrightness, 1, 3, true];
            setApertureNew [_minAperture, 6, 9, 0.9];
        };

        setAperture -1;
    };
    sleep 15;
};
