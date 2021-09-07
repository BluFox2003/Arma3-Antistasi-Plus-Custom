private _fileName = "fn_encounter_vehiclePatrol";
[2, "Vehicle Patrol Event Init.", _filename] call A3A_fnc_log;

private _vehicles = [];
private _groups = [];

private _allPlayers = (call BIS_fnc_listPlayers) select {side _x == teamPlayer};
private _player = selectRandom _allPlayers;
private _originPosition = position _player;
private _distance = (distanceSPWN + 500);

private _potentialOutposts = (outposts + milbases + airportsX + resourcesX + factories) select {
    sidesX getVariable [_x, sideUnknown] != teamPlayer && {(getMarkerPos _x) distance2D _player < _distance}
};

if (_potentialOutposts isEqualTo []) exitWith {
    [2, "No outposts in proximity, aborting Vehicle Patrol Event.", _filename] call A3A_fnc_log;
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _outpost = selectRandom _potentialOutposts;
private _side = sidesX getVariable [_outpost, sideUnknown];

private _spawnPosition = [_originPosition, 1000, _distance, 0, 0, 1] call BIS_fnc_findSafePos;
private _road = objNull;
private _radiusX = 5;

while {true} do {
    _road = _spawnPosition nearRoads _radiusX;
    if (count _road > 0) exitWith {};
    _radiusX = _radiusX + 5;
};

private _roadcon = roadsConnectedto (_road select 0);
private _dirveh = if (count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPosition = getPos (_road select 0);

private _isFia = if (random 10 > (tierWar + difficultyCoef)) then {true} else {false};
private _vehClass = if (_side == Occupants) then {
    if (_isFia) then {
        selectRandom (vehFIAAPC + vehFIATanks)
    } else {
        selectRandom vehNATOAttack
    };
} else {
    if (_isFia) then {
        selectRandom (vehWAMAPC + vehWAMTanks)
    } else {
        selectRandom vehCSATAttack
    };
};

if (_vehClass == "" || {_vehClass == "not_supported"}) exitWith {
    [2, "No vehicle class, aborting Vehicle Patrol Event.", _filename] call A3A_fnc_log;
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _patrolVehicle1Data = [_roadPosition, _dirveh, _vehClass, _side] call A3A_fnc_spawnVehicle;
private _patrolVehicle1 = _patrolVehicle1Data select 0;
_patrolVehicle1 limitSpeed 50;
[_patrolVehicle1, _side] call A3A_fnc_AIVEHinit;

private _patrolVehicle1Crew = _patrolVehicle1Data select 1;
{[_x] call A3A_fnc_NATOinit} forEach _patrolVehicle1Crew;
private _patrolGroup1 = _patrolVehicle1Data select 2;

_groups pushBack _patrolGroup1;
_vehicles pushBack _patrolVehicle1;

private _typeCargoGroup = [_vehClass, _side] call A3A_fnc_cargoSeats;
private _cargoGroup = [_roadPosition, _side, _typeCargoGroup, true,false] call A3A_fnc_spawnGroup;

{
    _x assignAsCargo _patrolVehicle1;
	_x moveInCargo _patrolVehicle1;
} forEach (units _cargoGroup);
(units _cargoGroup) join _patrolGroup1;

private _relativePositions = [];
{
    private _relativePosition = [_roadPosition, 300, _x] call BIS_fnc_relPos;
    _relativePositions pushBack _relativePosition;
} forEach [0, 90, 180];

{
    private _rndPosition = [_x, 0, 100, 0, 0, 0.75] call BIS_fnc_findSafePos;
    private _road = objNull;
    private _radiusX = 5;
    while {true} do {
        _road = _rndPosition nearRoads _radiusX;
        if (count _road > 0) exitWith {};
        _radiusX = _radiusX + 5;
    };
    private _roadPosition = getPos (_road select 0);
    private _wp = _patrolGroup1 addWaypoint [_roadPosition, _forEachIndex];
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "AWARE";
} forEach _relativePositions;

private _wp1 = _patrolGroup1 addWaypoint [_roadPosition, 3];
_wp1 setWaypointType "CYCLE";

[(gunner _patrolVehicle1), 300] spawn SCRT_fnc_common_scanHorizon;

private _timeOut = time + 1800;
waitUntil { sleep 5; (time > _timeOut) || isNull _patrolVehicle1 || {_allPlayers findIf {_x distance2D (position _patrolVehicle1) < _distance} == -1}};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

[3, format ["Vehicle Patrol clean up complete."], _filename] call A3A_fnc_log;