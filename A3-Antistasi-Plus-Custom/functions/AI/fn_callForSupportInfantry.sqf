params ["_group", "_supportTypes", "_target"];

/*  Simulates the call for support by a group by making the radioman a bit more dumb for a time

    Execution on: HC or Server

    Scope: Internal

    Params:
        _group: GROUP : The group which should call support
        _supportTypes: ARRAY of STRINGs : The types of support the group calls for
        _target: OBJECT : The target object the group wants support against

    Returns:
        Nothing
*/
private _fileName = "fn_callForSupportInfantry";

private _side = side _group;

if(_side == teamPlayer) exitWith {
    [1, format ["Rebel group %1 managed to call support, not allowed for rebel groups", _group], _fileName] call A3A_fnc_log;
};

private _radiomanIndex = (units _group) findIf {(_x getVariable "unitType") in radioMen};

if (_radiomanIndex == -1) exitWith {
    [3, format [" %1 Group has no capability to call support, no radiomen in squad", _group], _fileName] call A3A_fnc_log;
};

if ((_side == Occupants && areOccupantsDefeated) || {(_side == Invaders && areInvadersDefeated)}) exitWith {
    [2, format ["%1 faction was defeated earlier, aborting calling support.", str _side], _fileName, true] call A3A_fnc_log;
};

[2, format [" %1 Group has radioman, trying to call support...", _group], _fileName] call A3A_fnc_log;

private _radioMan = (units _group) select _radiomanIndex;

if((_group getVariable ["canCallSupportAt", -1]) > (dateToNumber date)) exitWith {};

//Block the group from calling support again
private _date = date;
_date set [4, (_date select 4) + 15];
private _dateNumber = dateToNumber _date;
_group setVariable ["canCallSupportAt", _dateNumber, true];

if !([_radioMan] call A3A_fnc_canFight) exitWith {};

[
    2,
    format ["Radioman of %1 (side %2) is starting to call for help against %3 with helps %4", _group, side _group, _target, _supportTypes],
    _fileName
] call A3A_fnc_log;

private _timeToCallSupport = time + 30 + random 15;

{_radioMan disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

_radioMan setVariable ["callAnimsDone",false];
_radioMan setVariable ["timeToCall", _timeToCallSupport];
_radioMan setVariable ["callSuccess",false];
_radioMan playMoveNow "Acts_SupportTeam_Front_ToKneelLoop";

_radioMan spawn {
    sleep random 3;
    playSound3D [(selectRandom radioSoundsIn), _this, false, getPosASL _this, 3, 1, 30];
};

_radioMan addEventHandler ["AnimDone", {
    private _supportCaller = _this select 0;
    if (([_supportCaller] call A3A_fnc_canFight) && (time <= (_supportCaller getVariable ["timeToCall",time])) && (_supportCaller == vehicle _supportCaller)) then {
        _supportCaller spawn {
            sleep random 3;
            playSound3D [(selectRandom radioSoundsMid), _this, false, getPosASL _this, 3, 1, 30];
        };
        _supportCaller playMoveNow "Acts_SupportTeam_Front_KneelLoop";
    }
    else {
        _supportCaller removeEventHandler ["AnimDone",_thisEventHandler];
        _supportCaller setVariable ["callAnimsDone",true];
        if (([_supportCaller] call A3A_fnc_canFight) && (_supportCaller == vehicle _supportCaller)) then {
            _supportCaller playMoveNow "Acts_SupportTeam_Front_FromKneelLoop";
            _supportCaller spawn {
                sleep random 3;
                playSound3D [(selectRandom radioSoundsOut), _this, false, getPosASL _this, 3, 1, 30];
            };
            _supportCaller setVariable ["callSuccess",true];
        };
    };
}];

waitUntil {sleep 0.5; (_radioMan getVariable ["callAnimsDone",true])};

_radioMan setVariable ["radioAnimsDone",nil];
_radioMan setVariable ["timeToCall", nil];

{_radioMan enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

if(_radioMan getVariable ["callSuccess",true]) then {
    private _revealed = [getPos _radioMan, side _group] call A3A_fnc_calculateSupportCallReveal;
    //Starting the support
    [2, format ["%1 managed to call help against %2, reveal value is %3", _group, _target, _revealed], _fileName] call A3A_fnc_log;
    [_target, _group knowsAbout _target, _supportTypes, side _group, _revealed] remoteExec ["A3A_fnc_sendSupport", 2];
}
else {
    [2, format ["%1 got no help as the radioman is dead or down", _group], _fileName] call A3A_fnc_log;
    _group setVariable ["canCallSupportAt", -1, true];
};
