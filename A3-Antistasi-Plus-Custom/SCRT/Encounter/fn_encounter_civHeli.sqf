private _fileName = "fn_encounter_civHeli";
[2, "Civilian Aircraft random event init.", _filename] call A3A_fnc_log;

//arrays for cleanup
private _vehicles = [];
private _groups = [];

private _allPlayers = (call BIS_fnc_listPlayers) select {side _x == teamPlayer};
private _player = selectRandom _allPlayers;
private _originPosition = position _player;
private _finPosition = [_originPosition, 2500, (random 360)] call BIS_fnc_relPos;

private _spawnPosition = [_originPosition, 1400, 1600, 0, 0, 1] call BIS_fnc_findSafePos;
private _civHeliData = [[(_spawnPosition select 0), (_spawnPosition select 1), 100 + random 200], 0, civHeli, civilian] call A3A_fnc_spawnVehicle;
private _heliVeh = _civHeliData select 0;
[_heliVeh, civilian] call A3A_fnc_AIVEHinit;
private _heliCrew = _civHeliData select 1;
{_x spawn A3A_fnc_CIVinit} forEach _heliCrew;
private _heliGroup = _civHeliData select 2;

_groups pushBack _heliGroup;
_vehicles pushBack _heliVeh;

_heliVeh flyInHeight (100 + (random 150));

private _relativePositions = [];

{
    private _relativePosition = [_originPosition, 300, _x] call BIS_fnc_relPos;
    _relativePositions pushBack _relativePosition;
} forEach [0, 180];

{
    private _wp = _heliGroup addWaypoint [_x, _forEachIndex];
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "SAFE";
} forEach _relativePositions;

private _wp3 = _heliGroup addWaypoint [_finPosition, 3];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "NORMAL";

private _timeOut = time + 600;
waitUntil { sleep 5; (currentWaypoint _heliGroup == 3) || (time > _timeOut) || !(canMove _heliVeh) || !alive (driver _heliVeh)};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

[3, format ["Heli Event clean up complete."], _filename] call A3A_fnc_log;