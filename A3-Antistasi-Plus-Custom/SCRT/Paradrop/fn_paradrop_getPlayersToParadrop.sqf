if (count paradropAttendants == 0) exitWith {
    [
        "Paradrop", 
        "No players are ready for jump. Make sure that players pressed PARADROP switch button in Game Options menu (O key or map-on-tripod action)."
    ] remoteExec ["SCRT_fnc_misc_showDeniedActionHint", theBoss];

    []
};

private _readyPlayers = paradropAttendants apply {_x call BIS_fnc_getUnitByUID};
_readyPlayers = _readyPlayers select {_x distance2D (getMarkerPos "Synd_HQ") < 50 && vehicle _x == _x && {[_x] call A3A_fnc_canFight} };

if (isNil "_readyPlayers" || {count _readyPlayers == 0}) then {
    [
        "Paradrop", 
        "Players that ready to be paradropped must be alive, not in vehicle and be at HQ."
    ] remoteExec ["SCRT_fnc_misc_showDeniedActionHint", theBoss];

    []
};

[2, format ["Paradrop players: %1", str _readyPlayers], "fn_paradrop_getPlayersToParadrop"] call A3A_fnc_log;

_readyPlayers