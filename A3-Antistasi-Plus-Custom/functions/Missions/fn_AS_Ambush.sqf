//Mission: Ambush Officer
if (!isServer && hasInterface) exitWith{};

params ["_missionOrigin"];

private _fileName = "fn_AS_Ambush";
[2, "Ambush Officer mission init.", _fileName, true] call A3A_fnc_log;

//arrays for cleanup
private _vehicles = [];
private _groups = [];

private _missionOriginPos = getMarkerPos _missionOrigin;
private _difficult = if (random 10 < tierWar) then {true} else {false};
private _sideX = if (sidesX getVariable [_missionOrigin,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _sideName = if(_sideX == Occupants) then { nameOccupants } else { nameInvaders };
[3, format ["Origin: %1, Hardmode: %2, Controlling Side: %3", _missionOrigin, _difficult, _sideX], _filename] call A3A_fnc_log;

private _timeLimit = 90 * settingsTimeMultiplier;
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum]; //converts datenumber back to date array so that time formats correctly
private _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString; //Converts the time portion of the date array to a string for clarity in hints

private _originName = [_missionOrigin] call A3A_fnc_localizar;

private _departingTimeLimit = 10 * settingsTimeMultiplier;
private _departingDateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _departingTimeLimit];
private _departingDateLimitNum = dateToNumber _departingDateLimit;
_departingDateLimit = numberToDate [date select 0, _departingDateLimitNum]; //converts datenumber back to date array so that time formats correctly
private _departingDisplayTime = [_departingDateLimit] call A3A_fnc_dateToTimeString; //Converts the time portion of the date array to a string for clarity in hints

//choosing enemy destination site
private _potentialSites = (outposts + milbases + airportsX + resourcesX + factories + seaports) select {
    private _potentialPos = getMarkerPos _x;
    sidesX getVariable [_x,sideUnknown] == _sideX && _missionOriginPos distance _potentialPos < 2500 && _missionOriginPos distance _potentialPos > 1200
};

private _destinationSite = nil;
if(count _potentialSites > 0) then {
    _destinationSite = selectRandom _potentialSites;
};

if (isNil "_destinationSite") exitWith {
    ["AS"] remoteExecCall ["A3A_fnc_missionRequest",2];
	[1, format ["Problems with finding proper delivery site, rerequesting new AS mission."], _filename] call A3A_fnc_log;
};

private _destinationName = [_destinationSite] call A3A_fnc_localizar;
private _destinationPosition = getMarkerPos _destinationSite;

private _markerColor = if(_sideX == Occupants) then {"colorBLUFOR"} else {"colorOPFOR"};
private _markerPosition = [_destinationPosition select 0, (_destinationPosition select 1) + 50, _destinationPosition select 2];

private _officerDestinationMarker = createMarker ["OfficerDestinationMarker", _markerPosition];
_officerDestinationMarker setMarkerType "hd_objective";
_officerDestinationMarker setMarkerSize [1, 1];
_officerDestinationMarker setMarkerText "Officer Destination";
_officerDestinationMarker setMarkerColor _markerColor;
_officerDestinationMarker setMarkerAlpha 1;

[3, format ["Origin: %1, Destination: %2", str _missionOrigin, str _destinationSite], _filename] call A3A_fnc_log;

// selecting classnames
private _officerClass = nil;
private _officerVehicleClass = nil;
private _escortVehicleClass = nil;
private _infantrySquadArray = nil;

private _squads = [_sideX, "SQUAD"] call SCRT_fnc_unit_getGroupSet;

if (_sideX == Occupants) then { 
    _officerClass = NATOOfficer;
    _escortVehicleClass = if(_difficult) then { selectRandom vehNATOAPC } else {selectRandom vehNATOTrucks};
    _officerVehicleClass = if(_difficult) then { selectRandom vehNATOAPC } else { selectRandom vehNATOLightArmed };
    _infantrySquadArray = selectRandom _squads;
} else { 
    _officerClass = CSATOfficer;
    _escortVehicleClass = if(_difficult) then { selectRandom vehCSATAPC } else {selectRandom vehCSATTrucks};
    _officerVehicleClass = if(_difficult) then { selectRandom vehCSATAPC } else { selectRandom vehCSATLightArmed };
    _infantrySquadArray = selectRandom _squads;
};

if (isNil "_officerClass" || {isNil "_officerVehicleClass"} || {isNil "_escortVehicleClass"} || {isNil "_infantrySquadArray"}) exitWith {
    ["AS"] remoteExecCall ["A3A_fnc_missionRequest",2];
    [1, format ["Classname problems, rerequesting new AS mission."], _filename] call A3A_fnc_log;
};

[
    2, 
    format ["Officer: %1, officer vehicle: %2, escort vehicle: %3, infantry squad: %4", 
        _officerClass, _officerVehicleClass, _escortVehicleClass, str _infantrySquadArray
    ], 
    _fileName, 
    true
] call A3A_fnc_log;

//creating Task
private _rebelTaskText = format [
    "High-ranked officer will move from %1 to %2 at %3. Intercept his vehicle and eliminate him. We must do it before %4.", 
    _originName, 
    _destinationName,
    _departingDisplayTime,
    _displayTime
];
private _taskId = "AS" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [_rebelTaskText, "Ambush Officer", _missionOrigin],
    _missionOrigin,
    false,
    0,
    true,
    "car",
    true
] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

////////////////
//convoy spawn//
////////////////

//finding road
private _radiusX = 100;
private _roads = [];
while {true} do {
	_roads = _missionOriginPos nearRoads _radiusX;
	if (count _roads > 1) exitWith {};
	_radiusX = _radiusX + 50;
};
private _roadE = _roads select 1;
private _roadR = _roads select 0;
sleep 1;

//spawning escort
private _escortVehicleData = [position _roadE, 0, _escortVehicleClass, _sideX] call A3A_fnc_spawnVehicle;
private _escortVeh = _escortVehicleData select 0;
_escortVeh limitSpeed 35;
[_escortVeh, "Officer Convoy"] spawn A3A_fnc_inmuneConvoy;
private _escortVehCrew = crew _escortVeh;
{[_x] call A3A_fnc_NATOinit} forEach _escortVehCrew;
[_escortVeh, _sideX] call A3A_fnc_AIVEHinit;
private _escortVehicleGroup = _escortVehicleData select 2;
_groups pushBack _escortVehicleGroup;
_vehicles pushBack _escortVeh;

//spawning escort inf
private _groupX = [position _roadE, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{
    _x assignAsCargo _escortVeh; 
    // _x moveInCargo _escortVeh; 
    [_x] join _escortVehicleGroup; 
    [_x] call A3A_fnc_NATOinit;
} forEach units _groupX;
deleteGroup _groupX;

//officer and his vehicle
private _officerVehicleData = [position _roadR, 0, _officerVehicleClass, _sideX] call A3A_fnc_spawnVehicle;
private _officerVeh = _officerVehicleData select 0;
_officerVeh limitSpeed 35;
[_officerVeh, "Officer Convoy"] spawn A3A_fnc_inmuneConvoy;
private _officerVehCrew = crew _officerVeh;
{[_x] call A3A_fnc_NATOinit} forEach _officerVehCrew;
[_officerVeh, _sideX] call A3A_fnc_AIVEHinit;
private _officerVehicleGroup = _officerVehicleData select 2;
_groups pushBack _officerVehicleGroup;
_vehicles pushBack _officerVeh;

private _groupOfficer = createGroup _sideX;
private _officer =  [_groupOfficer, _officerClass, position _roadR, [], 0, "NONE"] call A3A_fnc_createUnit;
_officer allowDamage false;

[_officer] join _officerVehicleGroup; 
[_officer] call A3A_fnc_NATOinit;
_officerVehicleGroup selectLeader _officer;
deleteGroup _groupOfficer;

sleep 2;
_officer allowDamage true;
_officer assignAsCargo _officerVeh; 
_officer moveInCargo _officerVeh; 

[3, "Waiting for starting convoy movement...", _filename] call A3A_fnc_log;
waitUntil {
	sleep 1;
    private _position = position _officer;
    [3, format ["Officer Position: %1", str _position], _filename] call A3A_fnc_log;
	dateToNumber date > _dateLimitNum || {dateToNumber date > _departingDateLimitNum} || !(alive _officer)
};

[3, "Setting things in motion...", _filename] call A3A_fnc_log;

if (alive _officer) then {
    private _officerWP = _officerVehicleGroup addWaypoint [_destinationPosition, 5];
    _officerWP setWaypointType "MOVE";
    _officerWP setWaypointBehaviour "SAFE";
    [3, format ["Officer Vehicle Waypoint: %1", str _destinationPosition], _filename] call A3A_fnc_log;
};

sleep 5;

if ((units _escortVehicleGroup) findIf {alive _x} != -1) then {
    private _escortWP = _escortVehicleGroup addWaypoint [_destinationPosition, 5];
    _escortWP setWaypointType "MOVE";
    _escortWP setWaypointBehaviour "SAFE";
    [3, format ["Escort Vehicle Waypoint: %1", str _destinationPosition], _filename] call A3A_fnc_log;
};

waitUntil {
	sleep 1;
	dateToNumber date > _dateLimitNum || _officer inArea _destinationSite || !(alive _officer)
};

switch(true) do {
    case (_officer inArea _destinationSite || dateToNumber date > _dateLimitNum): {
        [3, "Officer Reached destination or time is out, fail.", _filename] call A3A_fnc_log;

        [_taskId, "AS", "FAILED"] call A3A_fnc_taskSetState;

        [-900, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        [-10,theBoss] call A3A_fnc_playerScoreAdd;
    };
    case (!alive _officer): {
        [3, "Officer died, success.", _filename] call A3A_fnc_log;
        [_taskId, "AS", "SUCCEEDED"] call A3A_fnc_taskSetState;
        [0, 600] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        { [40,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
        [20, theBoss] call A3A_fnc_playerScoreAdd;
    };
    default {
        [3, "Unexpected behaviour, cancelling mission.", _filename] call A3A_fnc_log;
        [_taskId, "AS", "CANCELED"] call A3A_fnc_taskSetState;
    };
};


sleep 30;

[_taskId, "AS", 1200] spawn A3A_fnc_taskDelete;

deleteMarker _officerDestinationMarker;

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
[3, format ["Officer Ambush clean up complete."], _filename] call A3A_fnc_log;