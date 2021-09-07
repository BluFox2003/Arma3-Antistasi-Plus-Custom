
private _players = [] call SCRT_fnc_paradrop_getPlayersToParadrop;

if (_players isEqualTo []) exitWith {};

private _totalSeats = [vehSDKPlane, true] call BIS_fnc_crewCount;
private _crewSeats = [vehSDKPlane, false] call BIS_fnc_crewCount;
private _cargoSeats = _totalSeats - _crewSeats;

if (_cargoSeats < count _players) then {
    _players = [_players] call BIS_fnc_arrayShuffle;
};

{
   [] remoteExec ["SCRT_fnc_paradrop_movePlayerToPlane", _x];
} forEach _players;