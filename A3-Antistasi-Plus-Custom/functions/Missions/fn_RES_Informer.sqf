//Mission: Rescue Rebel Informer
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

private _fileName = "fn_RES_Informer";

[2, format ["Rescue Rebel Informer task initialization started, marker: %1.", _markerX], _fileName] call A3A_fnc_log;

private _side = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _sideTitle = if (_side == Occupants) then {nameOccupants} else {nameInvaders};
private _difficulty = if (random 10 < tierWar) then {true} else {false};
private _positionX = getMarkerPos _markerX;

private _vehicles = [];
private _groups = [];
private _effects = [];
private _props = [];

private _timeLimit = 90 * settingsTimeMultiplier;
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];
private _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;

private _destinationName = [_markerX] call A3A_fnc_localizar;

[2, format ["Side: %1, difficulty: %2.", str _side, str _difficulty], _fileName] call A3A_fnc_log;

//////////////////////
//Roadblocks
/////////////////////

private _cities = ["NameCityCapital","NameCity"] call SCRT_fnc_misc_getWorldPlaces;
private _isCity  = _cities findIf {(_x select 1) distance2D _positionX <= 250} == 0;
private _size = 100;
private _searchIterations = 0;

//calculating city size
private _marker1 = createMarkerLocal [format ["%1informerTask1", _markerX], _positionX];
_marker1 setMarkerShapeLocal "ELLIPSE";
_marker1 setMarkerSizeLocal [(_size - 20),(_size - 20)];
_marker1 setMarkerTypeLocal "hd_warning";
_marker1 setMarkerAlphaLocal 0;

private _marker2 = createMarkerLocal [format ["%1informerTask2", _markerX], _positionX];
_marker2 setMarkerShapeLocal "ELLIPSE";
_marker2 setMarkerSizeLocal [_size,_size];
_marker2 setMarkerTypeLocal "hd_warning";
_marker2 setMarkerAlphaLocal 0;

while {true} do {
    if (_isCity && {_size > 500}) exitWith {};
    if (!_isCity && {_size > 250}) exitWith {};
    if (_searchIterations > 20) exitWith {};
    private _hasBorderBuildings = (_positionX nearObjects ["House", _size]) findIf {!(_x inArea _marker1) && _x inArea _marker2} != -1;
    if (!_hasBorderBuildings) exitWith {};

    _size = _size + 20;
    _marker1 setMarkerSizeLocal [(_size - 20),(_size - 20)];
    _marker2 setMarkerSizeLocal [_size,_size];
    
    _searchIterations = _searchIterations + 1;
};

[2, format ["City size: %1.", str _size], _fileName] call A3A_fnc_log;

private _roadblockCount = ceil (random [1,2,4]);
private _previousRoadblockPositions = [];
private _cardinalDirections = [0,90,180,270];

[2, format ["Roadblocks count: %1.", str _roadblockCount], _fileName] call A3A_fnc_log;

private _earlyEscape = false;

//placing roadblocks on different entrances to the city
for "_i" from 0 to _roadblockCount do {
    private _cardinalDirection = selectRandom _cardinalDirections;
    _cardinalDirections deleteAt (_cardinalDirections find _cardinalDirection);

    private _rawPosition = [_positionX, _size, _cardinalDirection] call BIS_fnc_relPos;
    
    private _radiusX = 20;
    private _roads = nil;
    private _dirveh = 0;
	while {_radiusX < 500} do {
		_roads = _rawPosition nearRoads _radiusX;
		_roads = _roads select { count (roadsConnectedTo _x) == 2 };
		if (count _roads > 0) exitWith {};
		_radiusX = _radiusX + 20;
	};

    if (_radiusX >= 500) then {
		continue;
	} else {
        private _roadscon = roadsConnectedto (_roads select 0);
	    _dirveh = [_roads select 0, _roadscon select 0] call BIS_fnc_DirTo;
    };

    //no roads at all, aborting
    if (_i == 0 && {(isNil "_roads" || count _roads < 1)}) exitWith {
        _earlyEscape = true;
    };

    private _roadblockPosition = position (_roads select 0);   

    private _typeVehX = if(random 10 < (tierWar + (difficultyCoef / 2))) then {
        if (_side == Occupants) then {selectRandom vehFIAAPC} else {selectRandom vehWAMAPC};
    } else {
        if (_side == Occupants) then {selectRandom vehFIAArmedCars} else {selectRandom vehWAMArmedCars};
    };

    private _roadblockVehicleData = [_roadblockPosition, 0, _typeVehX, _side] call A3A_fnc_spawnVehicle;
    private _roadblockVeh = _roadblockVehicleData select 0;
    private _vehCrew = crew _roadblockVeh;
    {[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
    [_roadblockVeh, _side] call A3A_fnc_AIVEHinit;
    private_roadblockVehicleGroup = _roadblockVehicleData select 2;

    _roadblockVeh setDir _dirveh + 90;

    private _gunner = gunner _roadblockVeh;
    if (!isNull _gunner) then {
        _gunner lookAt (_gunner getRelPos [100, _dirveh]);
    };

    _groups pushBack private_roadblockVehicleGroup;
    _vehicles pushBack _roadblockVeh;

    private _typeGroup = if (_side == Occupants) then {selectRandom groupsFIAMid} else {selectRandom groupsWAMMid};
    private _roadblockPosition = [
    _roadblockPosition, //center
        2, //minimal distance
        15, //maximumDistance
        0, //object distance
        0, //water mode
        5, //maximum terrain gradient
        0, //shore mode
        [], //blacklist positions
        [_roadblockPosition, _roadblockPosition] //default position
    ] call BIS_fnc_findSafePos;
    private _groupX = [_roadblockPosition, _side, _typeGroup, true] call A3A_fnc_spawnGroup;
    if !(isNull _groupX) then {
        {
            [_x,"", false] call A3A_fnc_NATOinit;
        } forEach units _groupX;
    };
    _groups pushBack _groupX;
};

deleteMarkerLocal _marker1;
deleteMarkerLocal _marker2;

if (_earlyEscape) exitWith {
    ["RES"] remoteExecCall ["A3A_fnc_missionRequest",2];
	[1, "Problems with road positions, rerequesting new rescue mission.", _filename] call A3A_fnc_log;
};

[2, "Roadblocks have been spawned, proceeding to informer.", _fileName] call A3A_fnc_log;

//////////////////////
//Roadblocks position
/////////////////////
private _buildings = _positionX nearobjects ["house",_size];

if (isNil "_buildings" || {count _buildings < 0}) exitWith {
    ["RES"] remoteExecCall ["A3A_fnc_missionRequest",2];
	[1, "Problems with city buildings, rerequesting new rescue mission.", _filename] call A3A_fnc_log;
};

private _capableBuildings = _buildings select {!(([_x] call BIS_fnc_buildingPositions) isEqualTo [])};

if (isNil "_capableBuildings" || {count _capableBuildings < 0}) exitWith {
    ["RES"] remoteExecCall ["A3A_fnc_missionRequest",2];
	[1, "Problems with city buildings, rerequesting new rescue mission.", _filename] call A3A_fnc_log;
};

private _informerBuilding = selectRandom _capableBuildings;
private _informerBuildingPosition = selectRandom ([_informerBuilding] call BIS_fnc_buildingPositions);

private _grpInformer = createGroup teamPlayer;
private _informer = [_grpInformer, SDKUnarmed, _informerBuildingPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
_informer forceAddUniform (selectRandom allCivilianUniforms);
_informer allowDamage false;
[_informer,true] remoteExec ["setCaptive",0,_informer]; //will be turned off when players are close
_informer disableAI "MOVE";
_informer disableAI "AUTOTARGET";
_informer disableAI "TARGET";
_informer setUnitPos "UP";
_informer setBehaviour "CARELESS";
_informer allowFleeing 0;

removeAllWeapons _informer;
removeAllAssignedItems _informer;

[_informer,"refugee"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_informer];
_informer playMoveNow "ApanPknlMstpSnonWnonDnon_G01";

[2, "Informer has been spawned.", _fileName] call A3A_fnc_log;

////////////
//Tasks
////////////
private _text = format [
    "%1 forces sweeps %2 in search of our civilian informer with some very valuable data. He's hiding in one of the city's buildings. We have to get him out of there or he will be killed and our intel source will be exposed. He will shoot flare in the sky when we will be close to him. Bring him to our %3 HQ. Do this before %4.", _sideTitle, _destinationName, nameTeamPlayer, _displayTime];
private _taskId = "RES" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [
        _text,
        "Rescue Rebel Informer",
        _markerX
    ],
    _positionX,
    false,
    0,
    true,
    "danger",
    true
] call BIS_fnc_taskCreate;
[_taskId, "RES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


////////////
//Pursuers
////////////
_mrk = createMarkerLocal [format ["%1patrolarea", floor random 1000], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [300,300];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;

private _squads = [_side, "SQUAD"] call SCRT_fnc_unit_getGroupSet;
private _groupX = [_positionX,_side, (selectRandom _squads)] call A3A_fnc_spawnGroup;
[leader _groupX, _mrk, "AWARE", "SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
{[_x] call A3A_fnc_NATOinit} forEach units _groupX;
_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
[_dog,_groupX] spawn A3A_fnc_guardDog;
_groups pushBack _groupX;

////////////
//Burning Garbage
////////////

private _garbageCount = ceil (random [2,3,5]);
private _garbagePool = ["Land_GarbageWashingMachine_F", "Land_GarbagePallet_F", "Land_GarbageBags_F", "Land_Wreck_Van_F"];

for "_i" from 0 to _garbageCount do {
    private _garbagePosition = [
    _positionX, //center
        0, //minimal distance
        _size, //maximumDistance
        3, //object distance
        0, //water mode
        5, //maximum terrain gradient
        0, //shore mode
        [], //blacklist positions
        [_positionX, _positionX] //default position
    ] call BIS_fnc_findSafePos;

    private _garbage = createVehicle [ (selectRandom _garbagePool), _garbagePosition, [], 0, "NONE"];
    _garbage setDir (random 360);
    
    _props pushBack _garbage;

    if ((random 100) < 30) then {
        private _smokeEffect = "test_EmptyObjectForSmoke" createVehicle _garbagePosition; 
        _smokeEffect attachTo [_garbage,[0,0,0]];

        private _fireEffect = "#particlesource" createVehicle _garbagePosition;
        [_fireEffect, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffect];
        
        private _lightEffect = "#lightpoint" createVehicle _garbagePosition; 
        [_lightEffect, 0.3] remoteExec ["setLightBrightness", 0, _lightEffect];
        [_lightEffect, [0.55, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffect];
        [_lightEffect, [0.55, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffect];

        _effects append [_smokeEffect, _fireEffect, _lightEffect];
    };
};


waitUntil {
    sleep 1;
    private _players = (call BIS_fnc_listPlayers) select { side _x == teamPlayer || {side _x == civilian}};
    _players findIf {_x distance2D _informer < 40} != -1 || {!alive _informer || {dateToNumber date > _dateLimitNum}}
};

private _informerMarker = nil;

if (alive _informer) then {
    _informer allowDamage true;
    [_informer,false] remoteExec ["setCaptive",0,_informer];
    
    private _flarePosition = _informer getPos [random 10,random 360];
    _flarePosition set [2,200];
    _flareModel = selectRandom flaresPool;

    private _flare = _flareModel createVehicle _flarePosition;
    _flare setVelocity [-10 + random 20 , -10 + random 20, -5];

    playSound3D [(selectRandom flareSounds), _informer, false,  getPosASL _informer, 1.5, 1, 450, 0];

    _informerMarker = createMarker ["InformerLocationMarker", (position _informer)];
    _informerMarker setMarkerType "hd_objective";
    _informerMarker setMarkerSize [1, 1];
    _informerMarker setMarkerText "Informer Location";
    _informerMarker setMarkerColor "colorCivilian";
    _informerMarker setMarkerAlpha 1;
};

{
    private _wp = _x addWaypoint [_informer, 25];
    _wp setWaypointType "MOVE";
    _wp setWaypointSpeed "NORMAL";
    _wp setWaypointBehaviour "AWARE";
} forEach _groups;

waitUntil {
    sleep 1;
    !alive _informer || {dateToNumber date > _dateLimitNum || {(_informer distance2D (getMarkerPos "Synd_HQ") < 25)}}
};


switch(true) do {
    case (dateToNumber date > _dateLimitNum): {
        [2, "Time is out, fail.", _filename] call A3A_fnc_log;

        [_side, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
        [_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;

        [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];

        [-900, _side] remoteExec ["A3A_fnc_timingCA",2];
        [-10,theBoss] call A3A_fnc_playerScoreAdd;
    };
    case (!alive _informer): {
        [2, "Informer died, fail.", _filename] call A3A_fnc_log;

        [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];

        [_side, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
        [_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;
        
        [-900, _side] remoteExec ["A3A_fnc_timingCA",2];
        [-10,theBoss] call A3A_fnc_playerScoreAdd;
    };
    case (alive _informer && {(_informer distance2D (getMarkerPos "Synd_HQ") < 25)}): {
        [3, "Informer lived and arrived to HQ, success.", _filename] call A3A_fnc_log;
        [_taskId, "RES", "SUCCEEDED"] call A3A_fnc_taskSetState;

        [0,10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
        [1, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _side] remoteExec ["A3A_fnc_timingCA",2];
        private _intelText = ["Medium", _side] call A3A_fnc_selectIntel;
        [_intelText] remoteExec ["A3A_fnc_showIntel", [teamPlayer, civilian]];

        { [30,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
        [20, theBoss] call A3A_fnc_playerScoreAdd;
    };
    default {
        [3, "Unexpected behaviour, cancelling mission.", _filename] call A3A_fnc_log;
        [_taskId, "RES", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

deleteMarkerLocal _mrk;

if (!isNil "_informerMarker") then {
    deleteMarker _informerMarker;
};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

{
    deleteVehicle _x;
} forEach (_effects + _props + [_informer]);

[_taskId, "RES", 1200] spawn A3A_fnc_taskDelete;

[3, format ["Rescue Rebel Informer clean up complete."], _filename] call A3A_fnc_log;