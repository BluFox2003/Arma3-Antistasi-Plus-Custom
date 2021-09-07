if (!isServer && hasInterface) exitWith{};

diag_log format ["%1: [Antistasi] | INFO | ENC_Trader | Trader Mission Init.", servertime];
diag_log format ["%1: [Antistasi] | INFO | ENC_Trader | Server: %2", servertime, str isServer];

_markerX = _this select 0;
_positionX = getMarkerPos _markerX;

_traderPosition = [
    _positionX, //center
    0, //minimal distance
    300, //maximumDistance
    0, //object distance
    0, //water mode
    0.3, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_positionX, _positionX] //default position
] call BIS_fnc_findSafePos;

_radGrad = [_traderPosition, 0] call BIS_fnc_terrainGradAngle;

private _outOfBounds = _traderPosition findIf { (_x < 0) || {_x > worldSize}} != -1;

private _enemyBases = (airportsX + milbases + outposts + seaports + factories + resourcesX) select {sidesX getVariable [_x, sideUnknown] != teamPlayer};
private _isTooCloseToOutposts = _enemyBases findIf { _traderPosition distance2d (getMarkerPos _x) < 300 || _traderPosition inArea _x } != -1;

//mitigation of negative terrain gradient
if(!(_radGrad > -0.25 && _radGrad < 0.25) || {isOnRoad _traderPosition || {surfaceIsWater _traderPosition || {_outOfBounds || {_isTooCloseToOutposts}}}}) then {
    private _radiusX = 100;
    while {true} do {
        _traderPosition = [
            _positionX, //center
            0, //minimal distance
            _radiusX, //maximumDistance
            0, //object distance
            0, //water mode
            0.3, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_positionX, _positionX] //default position
        ] call BIS_fnc_findSafePos;
        _radGrad = [_traderPosition, 0] call BIS_fnc_terrainGradAngle;
        _outOfBounds = _traderPosition findIf { (_x < 0) || {_x > worldSize}} != -1;
        _isTooCloseToOutposts = _enemyBases findIf { _traderPosition distance2d (getMarkerPos _x) < 300 || _traderPosition inArea _x } != -1;
        if ((_radGrad > -0.25 && _radGrad < 0.25) && {!(isOnRoad _traderPosition) && {!(surfaceIsWater _traderPosition) && {!_outOfBounds && {!_isTooCloseToOutposts}}}}) exitWith {};
        _radiusX = _radiusX + 5;
    };
};

[2, format ["Trader position: %1", str _traderPosition], "ENC_Trader", true] call A3A_fnc_log;

traderX = [_traderPosition] call SCRT_fnc_trader_createTrader;
publicVariable "traderX";

//due to esotheric BS which fn_scheduler is i have no other choice than sending setTraderStock 
//everywhere in hope that it will be delivered to heckin server (because clientId 2 does not work at all)
[traderX] remoteExecCall ["SCRT_fnc_trader_setTraderStock", 0];
[traderX] remoteExecCall ["SCRT_fnc_trader_addVehicleMarketAction", 0, true];

_worldName = [] call SCRT_fnc_misc_getWorldName;

private _taskId = "ENC" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [format ["Whether %1 wanted it or not, an arms dealer has arrived on %2. So let's get to buy some weapons and gear from him, one by one. %3. From what i can gather he trades his goods from a hideout in the forest outside of major cities. He's well hidden, but with the right team, we can punch through those trees, find this man out and establish contact with black market.",nameOccupants,_worldName,name traderX, nameOccupants],
    "Find the Arms Dealer",_markerX],
    _traderPosition,
    false,
    0,
    true,
    "meet",
    true
] call BIS_fnc_taskCreate;
[_taskId, "ENC", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _trigger = createTrigger ["EmptyDetector", _traderPosition];
_trigger setTriggerArea [30, 30, 0, false];


waitUntil { 
    sleep 1;
    private _conditionMet = false;

    (call BIS_fnc_listPlayers) findIf {(side _x) in [teamPlayer, civilian] && {_x inArea _trigger}} != -1
};

[_taskId, "ENC", "SUCCEEDED"] call A3A_fnc_taskSetState;

{ [30, _x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
[20, theBoss] call A3A_fnc_playerScoreAdd;

traderPosition = _traderPosition;
publicVariable "traderPosition";

isTraderQuestCompleted = true; 
publicVariable "isTraderQuestCompleted";

deleteVehicle _trigger;

[_taskId, "ENC", 5] spawn A3A_fnc_taskDelete;