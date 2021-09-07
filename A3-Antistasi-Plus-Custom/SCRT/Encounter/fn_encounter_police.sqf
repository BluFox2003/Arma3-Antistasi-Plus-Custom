private _fileName = "fn_encounter_police";
[2, "Police Car Event Init.", _filename] call A3A_fnc_log;

private _vehicles = [];
private _groups = [];

private _allPlayers = (call BIS_fnc_listPlayers) select {side _x == teamPlayer};
private _player = selectRandom _allPlayers;
private _side = if (gameMode == 4) then {Invaders} else {Occupants};

private _cities = citiesX select {sidesX getVariable [_x, sideUnknown] != teamPlayer && {(getMarkerPos _x) distance2D _player < distanceSPWN}};

if (_cities isEqualTo []) exitWith {
    [2, "No cities in proximity, aborting Police Car Event.", _filename] call A3A_fnc_log;
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _city = [_cities, _player] call BIS_fnc_nearestPosition;
private _cityPosition = getMarkerPos _city;

private _road = objNull;
private _radiusX = 5;

while {true} do {
    _road = _cityPosition nearRoads _radiusX;
    if (count _road > 0) exitWith {};
    _radiusX = _radiusX + 5;
};

private _roadcon = roadsConnectedto (_road select 0);
private _dirveh = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPosition = getPos (_road select 0);

private _policeVehicleClass = selectRandom vehPoliceCars;

private _policeVehicleData = [(getPos (_road select 0)), _dirveh, _policeVehicleClass, _side] call A3A_fnc_spawnVehicle;
private _policeVehicle = _policeVehicleData select 0;
_policeVehicle limitSpeed 50;
[_policeVehicle, _side] call A3A_fnc_AIVEHinit;
[_policeVehicle, ["BeaconsStart", 1]] remoteExecCall ["animate", 0, _policeVehicle];

private _policeVehicleCrew = _policeVehicleData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _policeVehicleCrew;
private _policeGroup = _policeVehicleData select 2;

_groups pushBack _policeGroup;
_vehicles pushBack _policeVehicle;

private _typeCargoGroup = [_policeVehicleClass, _side] call A3A_fnc_cargoSeats;
private _cargoGroup = [_cityPosition, _side, _typeCargoGroup, true,false] call A3A_fnc_spawnGroup;

{
    _x assignAsCargo _policeVehicle;
	_x moveInCargo _policeVehicle;
} forEach (units _cargoGroup);
(units _cargoGroup) join _policeGroup;

private _relativePositions = [];
{
    private _relativePosition = [_cityPosition, 200, _x] call BIS_fnc_relPos;
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
    private _wp = _policeGroup addWaypoint [_roadPosition, _forEachIndex];
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "SAFE";
} forEach _relativePositions;

private _wp1 = _policeGroup addWaypoint [_cityPosition, 3];
_wp1 setWaypointType "CYCLE";

private _timeOut = time + 1800;
waitUntil { sleep 5; (time > _timeOut) || isNull _policeVehicle || {_allPlayers findIf {_x distance2D _cityPosition < distanceSPWN} == -1}};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

[3, format ["Police Event clean up complete."], _filename] call A3A_fnc_log;