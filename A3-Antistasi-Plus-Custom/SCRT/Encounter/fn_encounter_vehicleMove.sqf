private _fileName = "fn_encounter_vehicleMove";
[2, "Vehicle Move Event Init.", _filename] call A3A_fnc_log;

private _vehicles = [];
private _groups = [];

private _allPlayers = (call BIS_fnc_listPlayers) select {side _x == teamPlayer};
private _player = selectRandom _allPlayers;
private _originPosition = position _player;

private _potentialOutposts = (outposts + milbases + airportsX + resourcesX + factories) select {
    sidesX getVariable [_x, sideUnknown] != teamPlayer && {(getMarkerPos _x) distance2D _player < distanceSPWN}
};

if (_potentialOutposts isEqualTo []) exitWith {
    [2, "No outposts in proximity, aborting Vehicle Move Event.", _filename] call A3A_fnc_log;
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _outpost = selectRandom _potentialOutposts;
private _side = sidesX getVariable [_outpost, sideUnknown];
private _outpostPosition = getMarkerPos _outpost;

private _spawnPosition = [_originPosition, 1400, 1600, 0, 0, 1] call BIS_fnc_findSafePos;
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

private _truckClass = if (_side == Occupants) then {selectRandom vehNATOUtilityTrucks} else {selectRandom vehCSATUtilityTrucks};

if (_truckClass == "" || {_truckClass == "not_supported"}) exitWith {
    [2, "No truck class, aborting Vehicle Move Event.", _filename] call A3A_fnc_log;
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _truckVehicleData = [_roadPosition, _dirveh, _truckClass, _side] call A3A_fnc_spawnVehicle;
private _truckVehicle = _truckVehicleData select 0;
_truckVehicle limitSpeed 50;
[_truckVehicle, _side] call A3A_fnc_AIVEHinit;

private _truckVehicleCrew = _truckVehicleData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _truckVehicleCrew;
private _truckGroup = _truckVehicleData select 2;

_groups pushBack _truckGroup;
_vehicles pushBack _truckVehicle;

private _wp = _truckGroup addWaypoint [_outpostPosition, 0];
_wp setWaypointSpeed "LIMITED";
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";

private _timeOut = time + 1800;
waitUntil { sleep 5; (time > _timeOut) || isNull _truckVehicle || {_allPlayers findIf {_x distance2D (position _truckVehicle) < distanceSPWN} == -1}};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

[3, format ["Vehicle Move clean up complete."], _filename] call A3A_fnc_log;