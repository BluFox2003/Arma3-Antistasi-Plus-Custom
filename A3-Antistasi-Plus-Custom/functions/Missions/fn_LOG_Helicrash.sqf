//Mission: Steal ammo box from helicrash
if (!isServer && hasInterface) exitWith{};

params ["_missionOrigin"];

private _fileName = "fn_LOG_Helicrash";
[2, "Helicrash mission init.", _fileName, true] call A3A_fnc_log;

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

private _destinationName = [_missionOrigin] call A3A_fnc_localizar;

//creating array for cleanup
private _vehicles = [];
private _groups = [];
private _effects = [];

//choosing enemy delivery target site
private _potentialSites = outposts + milbases + airportsX;
_potentialSites = _potentialSites select {sidesX getVariable [_x,sideUnknown] != teamPlayer};
private _deliverySite = getMarkerPos _missionOrigin;
if(count _potentialSites > 0) then {
    //TODO: find closest enemy outposts
    _randomEnemySite = selectRandom _potentialSites;
    _deliverySite = getMarkerPos _randomEnemySite;
};


[2, format ["Difficulty: %1, Side: %2, Destination: %3", str _difficult, str _sideX, _destinationName], "LOG_Helicrash", true] call A3A_fnc_log;

//finding crash position
private _angle = random 360;
private _countX = 0;
private _distance = if (_difficult) then {2000} else {3000};
private _posCrashOrigin = [];
private _respawnTeamPlayerMarkerPos = getMarkerPos respawnTeamPlayer;
while {true} do {
	_posCrashOrigin = _missionOriginPos getPos [_distance,_angle];
    _respawnTeamPlayerMarkerPos = getMarkerPos respawnTeamPlayer;
    _outOfBounds = _posCrashOrigin findIf { (_x < 0) || {_x > worldSize}} != -1;
	if (!surfaceIsWater _posCrashOrigin 
        && _posCrashOrigin distance _respawnTeamPlayerMarkerPos < 4000 
        && _posCrashOrigin distance _respawnTeamPlayerMarkerPos > 1000
        && !_outOfBounds
    ) exitWith {};
	_angle = _angle + 1;
	_countX = _countX + 1;
	if (_countX > 360) then {
		_countX = 0;
		_distance = _distance - 500;
	};
};

// selecting classnames
_pilotClass = nil;
_helicopterClass = nil;
_searchHeliClass = nil;
_cargoTruckClass = nil;
_boxClass = nil;
_escortClass = nil;
_specOpsArray = nil;

private _squads = [_sideX, "SQUAD"] call SCRT_fnc_unit_getGroupSet;

_infantrySquadArray = selectRandom _squads;

if(_sideX == Occupants) then { 
    _pilotClass = NATOPilot;
    _helicopterClass = selectRandom vehNATOTransportHelis; 
    _searchHeliClass = if(_difficult) then { selectRandom vehNATOAttackHelis; } else { vehNATOPatrolHeli; };
    _boxClass = NATOAmmoBox;
    _cargoTruckClass = selectRandom vehNATOTrucks;
    _escortClass = if(_difficult) then { selectRandom vehNATOAPC; } else { selectRandom vehNATOLightArmed; };
    _specOpsArray = NATOSpecOp;
} 
else { 
    _pilotClass = CSATPilot;
    _helicopterClass = selectRandom vehCSATTransportHelis;
    _searchHeliClass = if(_difficult) then { selectRandom vehCSATAttackHelis; } else { vehCSATPatrolHeli; };
    _boxClass = CSATAmmoBox;
    _cargoTruckClass = selectRandom vehCSATTrucks; 
    _escortClass = if(_difficult) then { selectRandom vehCSATAPC; } else { selectRandom vehCSATLightArmed; };
    _specOpsArray = CSATSpecOp;
};

if (isNil "_pilotClass" || 
    {isNil "_helicopterClass"} || 
    {isNil "_searchHeliClass"} || 
    {isNil "_cargoTruckClass"} || 
    {isNil "_boxClass"} || 
    {isNil "_escortClass"} || 
    {isNil "_infantrySquadArray"} ||
    {isNil "_specOpsArray"}) 
exitWith {
	["LOG"] remoteExecCall ["A3A_fnc_missionRequest",2];
	[1, format ["Problems with unit templates, rerequesting new logistics mission."], _filename] call A3A_fnc_log;
};

[
    2, 
    format ["Pilot: %1, helicopter: %2, search heli: %3, Box: %4, cargo truck: %5, APC: %6, infantry array: %7", 
        _pilotClass, _helicopterClass, _searchHeliClass, _boxClass, _cargoTruckClass, _escortClass, str _infantrySquadArray
    ], 
    "LOG_Helicrash", 
    true
] call A3A_fnc_log;

//refining crash spawn position, to avoid exploding on spawn or "Armaing" during mission
private _flatPosition = [_posCrashOrigin, 0, 1000, 0, 0, 0.4] call BIS_fnc_findSafePos;
private _crashPosition = _flatPosition findEmptyPosition [0, 100, _helicopterClass];
private _iterations = 0;
//crash position could be too close to petros, lets find out it again
while {_iterations < 30} do {
    _flatPosition = [_posCrashOrigin, 0, 1000, 0, 0, 0.4] call BIS_fnc_findSafePos;
    _crashPosition = _flatPosition findEmptyPosition [0, 100, _helicopterClass];
    if(_crashPosition distance _respawnTeamPlayerMarkerPos < 1000 && _crashPosition distance _respawnTeamPlayerMarkerPos > 4000) exitWith {};
    _iterations = _iterations + 1; 
};
if (count _crashPosition == 0) then {_crashPosition = _posCrashOrigin};
[2, format ["Helicrash position has been found after %1 iterations.", str _iterations], _fileName, true] call A3A_fnc_log;
[2, format ["Helicrash position: %1", str _crashPosition], _fileName, true] call A3A_fnc_log;

{  
	[_x, true] remoteExec ["hideObject", 0, true];
    _x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_crashPosition, ["ROCKS"], 50, false, true];
{  
    _x setDammage 1;
} forEach nearestTerrainObjects [_crashPosition, ["Tree", "Bush", "BUILDING"], 20, false, true];

[3, format ["Crash Location: %1, Aircraft: %2", _crashPosition, _helicopterClass], _filename] call A3A_fnc_log;


//creating crashed helicopter
private _crater = "CraterLong_02_F" createVehicle _crashPosition;
private _helicopter = createVehicle [_helicopterClass, [_crashPosition select 0, _crashPosition select 1, 0.9], [], 0, "CAN_COLLIDE"];
_helicopter setDamage 0.8;
_helicopter setFuel 0;
_helicopter animateDoor ["Door_rear_source", 1, true];
clearWeaponCargoGlobal _helicopter;
clearMagazineCargoGlobal _helicopter;

private _smokeEffect = "test_EmptyObjectForSmoke" createVehicle _crashPosition; 
_smokeEffect attachTo [_helicopter,[0,1.5,-1]];
_effects pushBack _smokeEffect;

_vehicles append [_helicopter, _crater];

//creating pilot body
//pilot body will stay as monument to my failed efforts to make this mission as "rescue pilot" task 
_groupPilot = createGroup _sideX;
_pilot = [_groupPilot, _pilotClass, _crashPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
sleep 2;
_pilotPosition = position _pilot;
_bloodSplatter = createVehicle ["BloodSplatter_01_Large_New_F", [_pilotPosition select 0, _pilotPosition select 1, (_pilotPosition select 2) + 0.05], [], 0,  "CAN_COLLIDE"];
_pilot setDammage 1;

_vehicles append [_pilot, _bloodSplatter];

for "_i" from 0 to (random [3,5,6]) do {
    _firePosition = [
        _crashPosition, 
        2,
        25,
        2
    ] call BIS_fnc_findSafePos;

    [_firePosition, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0, _helicopter];

    private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
    [_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

    private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
    [_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

    _effects append [_fireEffectEmitter, _lightEffectEmitter];
};

//creating mission marker near crash site
private _crashPositionMarker = _helicopter getRelPos [random 500,random 360];
private _taskMarker = createMarker [format ["LOG%1", random 100],_crashPositionMarker];
_taskMarker setMarkerShape "ICON";

//creating Task
private _taskId = "LOG" + str A3A_taskCount;
private _rebelTaskText = format [
    "%1 helicopter with some valueable cargo has been shot down in %2. Bring helicopter's cargo to the HQ before enemy's rescue team. We must get it before %3.", 
    _sideName, 
    _destinationName,
    _displayTime
];

[
    [teamPlayer,civilian],
    _taskId,
    [_rebelTaskText, "Helicopter Crash Site", _missionOrigin],
    _crashPositionMarker,
    false,
    0,
    true,
    "heli",
    true
] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


//spawning box
_box = _boxClass createVehicle _crashPosition;
_box allowDamage false;
_box setVectorDirAndUp [[0,0,-1], [0,1,0]];
[_box] spawn A3A_fnc_fillLootCrate;
[_box] call A3A_fnc_logistics_addLoadAction;

sleep 3;
_box allowDamage true;

[2, format ["Box type: %1, box position: %2", str (typeOf _box), str (position _box)], "LOG_Helicrash", true] call A3A_fnc_log;

//if rebels are near - assign box coordinates to them
[_box, _missionOrigin, _rebelTaskText] spawn {
    params ["_box", "_missionOrigin", "_taskText"];
    waitUntil { sleep 2; count ([25, 0, _box, teamPlayer] call A3A_fnc_distanceUnits) > 0 || {isNull _box} || {!alive _box}; };

    if(alive _box && {!isNull _box}) then {
        [
            "LOG",
            [_taskText, "Helicopter Crash Site", _missionOrigin],
            _box,
            "ASSIGNED"
        ] call A3A_fnc_taskUpdate;
    };
};


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
private _escortVehicleData = [position _roadE, 0, _escortClass, _sideX] call A3A_fnc_spawnVehicle;
private _escortVeh = _escortVehicleData select 0;
_escortVeh limitSpeed 50;
[_escortVeh, "Escort"] spawn A3A_fnc_inmuneConvoy;
private _vehCrew = crew _escortVeh;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
[_escortVeh, _sideX] call A3A_fnc_AIVEHinit;
private _escortVehicleGroup = _escortVehicleData select 2;
_groups pushBack _escortVehicleGroup;
_vehicles pushBack _escortVeh;

//spawning escort inf
private _typeGroup = if (_sideX == Occupants) then {groupsNATOSentry call SCRT_fnc_unit_selectInfantryTier} else {groupsCSATSentry call SCRT_fnc_unit_selectInfantryTier};
private _groupX = [_missionOriginPos, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
{
    _x assignAsCargo _escortVeh; 
    _x moveInCargo _escortVeh; 
    [_x] join _escortVehicleGroup; 
    [_x] call A3A_fnc_NATOinit
} forEach units _groupX;
deleteGroup _groupX;

//moving to crash site
private _escortWP = _escortVehicleGroup addWaypoint [_crashPosition, 5];
_escortWP setWaypointType "MOVE";
_escortWP setWaypointBehaviour "SAFE";
[3, format ["Placed Group: %1 in Lite Vehicle and set waypoint %2", _typeGroup, _crashPosition], _filename] call A3A_fnc_log;

//creating cargo vehicle
private _cargoVehicleData = [position _roadR, 0, _cargoTruckClass, _sideX] call A3A_fnc_spawnVehicle;
private _cargoVehicle = _cargoVehicleData select 0;
_cargoVehicle limitSpeed 50;
[_cargoVehicle, _sideX] call A3A_fnc_AIVEHinit;
sleep 1;
[_cargoVehicle,"Cargo Truck"] spawn A3A_fnc_inmuneConvoy;
private _cargoVehicleGroup = _cargoVehicleData select 2;
private _cargoVehicleCrew = units _cargoVehicleGroup;
{[_x] call A3A_fnc_NATOinit} forEach _cargoVehicleCrew;
_groups pushBack _cargoVehicleGroup;
_vehicles pushBack _cargoVehicle;

_cargoGroupX = [_missionOriginPos, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{
    _x assignAsCargo _cargoVehicle; 
    _x moveInCargo _cargoVehicle; 
    [_x] join _cargoVehicleGroup; 
    [_x] call A3A_fnc_NATOinit;
} forEach units _cargoGroupX;
deleteGroup _cargoGroupX;

//crashsite patrollers
if(_difficult) then {
    _patrolGroup = [_crashPosition, _sideX, _specOpsArray] call A3A_fnc_spawnGroup;
    { 
        [_x] call A3A_fnc_NATOinit;
    } forEach units _patrolGroup;
    _groups pushBack _patrolGroup;

    [_patrolGroup, _crashPosition, 100] call bis_fnc_taskPatrol;
} else {
    _patrolGroup = [_crashPosition, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
    { 
        [_x] call A3A_fnc_NATOinit;
    } forEach units _patrolGroup;
    _groups pushBack _patrolGroup;

    [_patrolGroup, _crashPosition, 100] call bis_fnc_taskPatrol;
};


//moving to crash site
_cargoVehicleWp = _cargoVehicleGroup addWaypoint [position _box, 1];
_cargoVehicleWp setWaypointType "GETOUT";
_cargoVehicleWp setWaypointBehaviour "SAFE";
[3, format ["Transport Vehicle: %1, Crew: %2, Waypoint: %3", _cargoTruckClass, _cargoVehicleCrew, _crashPosition], _filename] call A3A_fnc_log;

//loiter helicopter
_searchHeliData = [[(_crashPosition select 0) + random 100, (_crashPosition select 1) + random 100, 300 + random 500], 0, _searchHeliClass, _sideX] call A3A_fnc_spawnVehicle;
_searchHeliVeh = _searchHeliData select 0;
[_searchHeliVeh, _sideX] call A3A_fnc_AIVEHinit;
_searchHeliCrew = _searchHeliData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _searchHeliCrew;
_heliVehicleGroup = _searchHeliData select 2;

//maybe this should be broadcasted
_searchHeliVeh setPilotLight true;
_searchHeliVeh setCollisionLight true;
leader (_searchHeliCrew select 0) action ["lightOn", _searchHeliVeh];

_groups pushBack _heliVehicleGroup;
_vehicles pushBack _searchHeliVeh;

if(_searchHeliClass == vehNATOPatrolHeli || _searchHeliClass == vehCSATPatrolHeli) then {
    _heliLoiterWaypoint = _heliVehicleGroup addWaypoint [_crashPosition, 0];
    _heliLoiterWaypoint setWaypointType "LOITER";
    _heliLoiterWaypoint setWaypointBehaviour "SAFE";
    [_heliVehicleGroup, 0] setWaypointLoiterRadius 400;
    [_heliVehicleGroup, 0] setWaypointLoiterType "CIRCLE_L";

    //spawning escort inf
    private _heliInfGroup = if (_sideX == Occupants) then {
        private _mid = [Occupants, "MID"] call SCRT_fnc_unit_getGroupSet;
        selectRandom _mid;
    } else {
        private _mid = [Invaders, "MID"] call SCRT_fnc_unit_getGroupSet;
        selectRandom _mid;
    };
    private _heliInfgroupX = [_missionOriginPos, _sideX, _heliInfGroup] call A3A_fnc_spawnGroup;
    {
        _x assignAsCargo _searchHeliVeh; 
        _x moveInAny _searchHeliVeh; 
        [_x] join _heliVehicleGroup; 
        [_x] call A3A_fnc_NATOinit
    } forEach units _heliInfgroupX;
    deleteGroup _heliInfgroupX;
} else {
    [_heliVehicleGroup, _crashPosition, 450] call bis_fnc_taskPatrol;
};

[3, format ["Waiting until %1 reaches origin or rebel base, gets destroyed, timer expires at %3 or %2 reaches %1", _box, _cargoVehicle, _dateLimit], _filename] call A3A_fnc_log;
waitUntil {
	sleep 1;
	!alive _box ||
	{_cargoVehicle distance _box < 50 ||
    _box distance (getMarkerPos respawnTeamPlayer) < 50 ||
	{dateToNumber date > _dateLimitNum}}
};

if(_cargoVehicle distance _box < 50 && {alive _cargoVehicle} && {!isNull (driver _cargoVehicle)}) then {
    _allParticipatingUnits = [];
    {
        _allParticipatingUnits append (units _x);
    } forEach _groups;

    _isEnemyKnowsAboutTeamplayer = false;
    {
        _rebel = _x;
        {
            if(_x knowsAbout _rebel > 1.4) exitWith { _isEnemyKnowsAboutTeamplayer = true; };
        } forEach _allParticipatingUnits;
        if(_isEnemyKnowsAboutTeamplayer) exitWith {};
    } forEach ([500, 0, _cargoVehicle, teamPlayer] call A3A_fnc_distanceUnits);

    if(_isEnemyKnowsAboutTeamplayer) then {
        [3, "Cargo truck has reached helicopter, they know about enemies, so starting doing some actions aware...", _filename] call A3A_fnc_log;    

        _cargoVehicleGroup setCombatMode "YELLOW";
        _cargoVehicleGroup setBehaviour "AWARE";

        _escortVehicleGroup setCombatMode "YELLOW";
        _escortVehicleGroup setBehaviour "AWARE";
     
        _heliVehicleGroup setCombatMode "YELLOW";
        _heliVehicleGroup setBehaviour "AWARE";

        [_escortVehicleGroup, _crashPosition, 300] call bis_fnc_taskPatrol;
    };

    [3, "Cargo truck has reached helicopter, starting doing some actions...", _filename] call A3A_fnc_log;

    _waypointTimeout = time + 10;
    waitUntil{sleep 1; time > _waypointTimeout };

    _cargoTimeout = time + 100;
    waitUntil{sleep 1; time > _cargoTimeout };

    if(({alive _x} count units _cargoVehicleGroup) > 0) then {
        [3, "Putting pilot in bodybag.", _filename] call A3A_fnc_log;
        _bodyBag = createVehicle  ["Land_Bodybag_01_black_F", position _pilot, [], 0, "CAN_COLLIDE"];
        _vehicles pushBack _bodyBag;
        deleteVehicle _pilot;
    } else {
        [3, "Players disrupt RIP pilot operation.", _filename] call A3A_fnc_log;
    };

    _cargoTimeout = time + 100;
    waitUntil{sleep 1; time > _cargoTimeout };

    if(({alive _x} count units _cargoVehicleGroup) > 3 && {alive _cargoVehicle}) then {
        [3, "Putting ammobox inside truck", _filename] call A3A_fnc_log;

        private _return = [_vehicle, _cargo] call A3A_fnc_logistics_canLoad;
        if !(_return isEqualType 0) exitWith {
            _return remoteExec ["A3A_fnc_logistics_load", 2];
        };
    } else {
        [3, "Players disrupt cargo operation.", _filename] call A3A_fnc_log;
    };

    _cargoTimeout = time + 100;
    waitUntil{sleep 1; time > _cargoTimeout };

    if(({alive _x} count units _cargoVehicleGroup) > 2) then {
        [3, "Putting", _filename] call A3A_fnc_log;
        //cargo team will plant the explosive on helicopter
        [_crashPosition, _helicopter, _cargoVehicle] spawn {
            params ["_crashPosition", "_helicopter", "_cargoVehicle"];
            waitUntil {sleep 1; _cargoVehicle distance _crashPosition > 150};
            _shell = "Sh_155mm_AMOS" createVehicle position _helicopter;
            _shell setVelocity [0,1,-1];
            _helicopter setDammage 1;
        };
    } else {
        [3, "Players disrupts mining operation.", _filename] call A3A_fnc_log;
    };

    _cargoTimeout = time + 60;
    waitUntil{sleep 1; time > _cargoTimeout };

    [3, "Departing.", _filename] call A3A_fnc_log;

    if(count waypoints _cargoVehicleGroup > 0) then {
        for "_i" from count waypoints _cargoVehicleGroup - 1 to 0 step -1 do {
            deleteWaypoint [_cargoVehicleGroup, _i];
        };
    };

    _cargoWp1 = _cargoVehicleGroup addWaypoint [_box, 0];
    _cargoWp1 setWaypointType "GETIN";
    _cargoWp1 setWaypointBehaviour "SAFE";

    _cargoWp2 = _cargoVehicleGroup addWaypoint [_deliverySite, 1];
    _cargoWp2 setWaypointType "MOVE";
    if(_isEnemyKnowsAboutTeamplayer) then {
        _cargoWp2 setWaypointBehaviour "AWARE";
    } else {
       _cargoWp2 setWaypointBehaviour "SAFE";
    };


    if(count waypoints _escortVehicleGroup > 0) then {
        for "_i" from count waypoints _escortVehicleGroup - 1 to 0 step -1 do {
            deleteWaypoint [_escortVehicleGroup, _i];
        };
    };
    _escortWp1 = _escortVehicleGroup addWaypoint [_deliverySite, 2];
    _escortWp1 setWaypointType "MOVE";
    if(_isEnemyKnowsAboutTeamplayer) then {
        _escortWp1 setWaypointBehaviour "AWARE";
    } else {
        _escortWp1 setWaypointBehaviour "SAFE";
    };

    if(count waypoints _escortVehicleGroup > 0) then {
        for "_i" from count waypoints _heliVehicleGroup - 1 to 0 step -1 do {
            deleteWaypoint [_heliVehicleGroup, _i];
        };
    };
    _searchHeliWp1 = _heliVehicleGroup addWaypoint [_deliverySite, 2];
    _searchHeliWp1 setWaypointType "MOVE";
    if(_isEnemyKnowsAboutTeamplayer) then {
        _searchHeliWp1 setWaypointBehaviour "AWARE";
    } else {
        _searchHeliWp1 setWaypointBehaviour "SAFE";
    };
};

waitUntil {
	sleep 1;
	!alive _box ||
	_box distance _deliverySite < 50 ||
	_box distance (getMarkerPos respawnTeamPlayer) < 25 ||
	dateToNumber date > _dateLimitNum
};

switch(true) do {
    case(_box distance _deliverySite < 50 || dateToNumber date > _dateLimitNum): {
        [3, "Box has been recovered by enemy, mission falied.", _filename] call A3A_fnc_log;

        [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;

        [-900, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        [-10,theBoss] call A3A_fnc_playerScoreAdd;
    };
    case(!alive _box): {
        [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
        [-300, _sideX] remoteExec ["A3A_fnc_timingCA",2];
    };
    case(_box distance (getMarkerPos respawnTeamPlayer) < 25): {
        [_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;

        [0, 600] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        { [50,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
        [20, theBoss] call A3A_fnc_playerScoreAdd;
    };
    default {
        [1, "Undefined mission outcome.", _fileName, true] call A3A_fnc_log;
    };
};

////////////
//Clean up//
////////////
{
    deleteVehicle _x;
} forEach _effects;


[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;

deleteMarker _taskMarker;

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
[3, format ["Helicrash clean up complete."], _filename] call A3A_fnc_log;