params ["_side", "_timerIndex", "_plane", "_groups", "_posDestination", "_supportName"];

/*  The despawn routine of the QRF support

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _side: SIDE : The side of the attackers
        _plane: OBJECT : Airdrop plane
        _groups: ARRAY of GROUPS : All groups used by the QRF
        _posDestination: POSITION : The target position
        _supportName: STRING : The callname of the support

    Returns:
        Nothing
*/

private _fileName = "SUP_airdropRoutine";
//Prepare despawn conditions
private _endTime = time + 2700;
private _airdropHasArrived = false;
private _airdropHasWon = false;

private _targetList = server getVariable [format ["%1_targets", _supportName], []];
private _reveal = _targetList select 0 select 1;

private _timerArray = if(_side == Occupants) then {occupantsAirdropTimer} else {invadersAirdropTimer};

_timerArray set [_timerIndex, time + 1800];
_plane setVariable ["TimerArray", _timerArray, true];
_plane setVariable ["TimerIndex", _timerIndex, true];
_plane setVariable ["supportName", _supportName, true];
_plane setVariable ["side", _side, true];
_plane setVariable ["planeDead", false, true];

//Setting up the EH for support destruction
_plane addEventHandler [
    "Killed",
    {
        params ["_plane"];
        [2, "Paradrop plane has been destroyed, airdrop aborted", "SUP_airdrop"] call A3A_fnc_log;
        ["TaskSucceeded", ["", "Paradrop Plane Destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        private _timerArray = _plane getVariable "TimerArray";
        private _timerIndex = _plane getVariable "TimerIndex";
        _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 3600];
        [_plane getVariable "supportName", _plane getVariable "side"] spawn A3A_fnc_endSupport;
        _plane setVariable ["planeDead", true, true];
        [_plane] spawn A3A_fnc_postMortem;
        [(_plane getVariable "side"), 20, 45] remoteExec ["A3A_fnc_addAggression", 2];
    }
];

private _pilot = driver _plane;
_pilot setVariable ["Plane", _plane, true];
_pilot addEventHandler [
    "Killed",
    {
        params ["_unit"];
        ["TaskSucceeded", ["", "Airdrop crew killed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        private _plane = _unit getVariable "Plane";
        _plane setVariable ["planeDead", true, true];
        [2, format ["Crew for %1 killed, airdrop aborted", _plane getVariable "supportName"], "SUP_airdrop"] call A3A_fnc_log;
        private _timerArray = _plane getVariable "TimerArray";
        private _timerIndex = _plane getVariable "TimerIndex";
        _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 1800];
        [_unit] spawn A3A_fnc_postMortem;
    }
];

while {true} do
{
    sleep 1;
    if !(_airdropHasArrived) then
    {
        //Not yet arrived
        private _isInside = if ((getPos _plane) distance2D _posDestination < 350) then {true} else {false};
        if(_isInside) then
        {
            [2, format ["%1 has arrived with at least one vehicle, attacking now", _supportName], _fileName] call A3A_fnc_log;
            _airdropHasArrived = true;

            private _textMarker = createMarker [format ["%1_text", _supportName], _posDestination];
            _textMarker setMarkerShape "ICON";
            _textMarker setMarkerType "mil_dot";
            _textMarker setMarkerText "QRF";
            if(_side == Occupants) then
            {
                _textMarker setMarkerColor colorOccupants;
            }
            else
            {
                _textMarker setMarkerColor colorInvaders;
            };
            _textMarker setMarkerAlpha 0;
            [_reveal, _posDestination, _side, "QRF", format ["%1_coverage", _supportName], _textMarker] spawn A3A_fnc_showInterceptedSupportCall;
        };
    }
    else
    {
        //airdrop in combat, check if won
        private _nearbyEnemyGroups = allGroups select {(side _x != _side) && (side _x != civilian) && {getPos (leader _x) distance2D _posDestination < 300}};
        if(count _nearbyEnemyGroups == 0) then
        {
            [2, format ["%1 has cleared the area, starting despawn routines", _supportName], _fileName] call A3A_fnc_log;
            _airdropHasWon = true;
        };
    };
    if(_airdropHasWon) exitWith {};

    private _groupAlive = false;
    {
        private _index = (units _x) findIf {[_x] call A3A_fnc_canFight};
        if(_index != -1) exitWith
        {
            _groupAlive = true;
        };
    } forEach _groups;

    if !(_groupAlive) exitWith
    {
        [2, format ["%1 has been eliminated, starting despawn routines", _supportName], _fileName] call A3A_fnc_log;
        [_side, 10, 60] remoteExec ["A3A_fnc_addAggression", 2];
    };

    if(_endTime < time) exitWith
    {
        [2, format ["%1 timed out without winning or losing, starting despawn routines", _supportName], _fileName] call A3A_fnc_log;
    };
};

private _apc = _plane getVariable ["apc", objNull];

if (!(isNull _apc)) then {
    [_apc] spawn A3A_fnc_VEHDespawner;
};

[_plane] spawn A3A_fnc_VEHDespawner;

{
    [_x] spawn A3A_fnc_groupDespawner;
} forEach _groups;

private _waitTime = 3 - (tierWar - 1);
if(_waitTime < 0) then {_waitTime = 0};
[_supportName, _side, _waitTime] spawn A3A_fnc_endSupport;