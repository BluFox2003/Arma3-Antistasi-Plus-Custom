//Mission: Destroy Artillery
if (!isServer and hasInterface) exitWith{};

private _fileName = "fn_DES_Artillery";
[2, "Artillery mission init.", _fileName] call A3A_fnc_log;

private _markerX = _this select 0;
private _missionOriginPos = getMarkerPos _markerX;

private _difficult = if (random 10 < tierWar) then {true} else {false};
private _sideX = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};

private _timeLimit = 90 * settingsTimeMultiplier;
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];
private _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;

private _groups = [];
private _vehicles = [];
private _props = [];

// selecting classnames
private _artilleryClass = nil;
private _artilleryShellClass = nil;
private _mgClass = nil;
private _mgCrewClass = nil;

private _squads = [_sideX, "SQUAD"] call SCRT_fnc_unit_getGroupSet;

private _infantrySquadArray = selectRandom _squads;

if(_sideX == Occupants) then { 
    if (NATOHowitzer != "") then {
        _artilleryClass = NATOHowitzer;
        _artilleryShellClass = NATOHowitzerMagazineHE;
    } else {
        _artilleryClass = vehNATOMRLS;
        _artilleryShellClass = vehNATOMRLSMags;
    };

    _mgClass = NATOMG;
    _mgCrewClass = staticCrewOccupants call SCRT_fnc_unit_selectInfantryTier;
} 
else { 
    if (CSATHowitzer != "") then {
        _artilleryClass = CSATHowitzer;
        _artilleryShellClass = CSATHowitzerMagazineHE;
    } else {
        _artilleryClass = vehCSATMRLS;
        _artilleryShellClass = vehCSATMRLSMags;
    };

    _mgClass = CSATMG;
    _mgCrewClass = staticCrewInvaders call SCRT_fnc_unit_selectInfantryTier;
};

if (isNil "_artilleryClass" || {isNil "_artilleryShellClass"} || {isNil "_mgClass"} || {isNil "_infantrySquadArray"} || {isNil "_mgCrewClass"}) 
exitWith {
	["DES"] remoteExecCall ["A3A_fnc_missionRequest",2];
	[1, format ["Problems with unit templates, rerequesting new destroy mission."], _filename] call A3A_fnc_log;
};

[
    2, 
    format ["Artillery: %1, Artillery Shell: %2, Static: %3, Squad: %4, MG Crew: %5", _artilleryClass, _artilleryShellClass, _mgClass, str _infantrySquadArray, _mgCrewClass], 
    _fileName, 
    true
] call A3A_fnc_log;


//////////////////////
//Artillery and it's target
/////////////////////
{  
	[_x, true] remoteExec ["hideObject", 0];
} forEach nearestTerrainObjects [_missionOriginPos, [], 10, false, true];

private _artilleryData = [_missionOriginPos, 0, _artilleryClass, _sideX] call A3A_fnc_spawnVehicle;
private _artilleryVeh = _artilleryData select 0;
_artilleryVeh setDir (random 360);
_artilleryVeh allowDamage false;
[_artilleryVeh, _sideX, true] call A3A_fnc_AIVEHinit;
private _artilleryCrew = _artilleryData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _artilleryCrew;
private _artilleryGroup = _artilleryData select 2;

_groups pushBack _artilleryGroup;
_vehicles pushBack _artilleryVeh;

//selecting any close site to player
private _potentialSites = (outposts + milbases + airportsX + resourcesX + factories + seaports) select {
    private _potentialPos = getMarkerPos _x;
    sidesX getVariable [_x,sideUnknown] == teamPlayer && _missionOriginPos distance _potentialPos < 3500
};
_potentialSites = _potentialSites + ["Synd_HQ"]; //sorry, Petros

private _targetSite = selectRandom _potentialSites;
private _targetPosition = getMarkerPos _targetSite;

[2, format ["Target Outpost: %1", _targetSite], _fileName, true] call A3A_fnc_log;

//finding suitable position for artillery
private _artilleryPosition = [_missionOriginPos, 0, 800, 3, 0, 0.6] call BIS_fnc_findSafePos;
_artilleryVeh setPos _artilleryPosition;

if(!(_targetPosition inRangeOfArtillery [[_artilleryVeh], _artilleryShellClass]) && {isOnRoad _artilleryVeh}) then {
    private _radiusX = 600;
    while {true} do {
        _artilleryPosition = [_missionOriginPos, 0, _radiusX, 3, 0, 0.6] call BIS_fnc_findSafePos;
        _artilleryVeh setPos _artilleryPosition;
        if(_targetPosition inRangeOfArtillery [[_artilleryVeh], _artilleryShellClass] && {!(isOnRoad _artilleryVeh)}) exitWith {};
        _radiusX = _radiusX + 100;
    };
};

[2, format ["Artillery Position: %1", str _artilleryPosition], _fileName, true] call A3A_fnc_log;


//////////////////////
//Artillery vehicle preparations
/////////////////////
{
    private _relativePosition = [_artilleryPosition, 7, _x] call BIS_Fnc_relPos;
    private _barrier = createVehicle ["Land_HBarrier_Big_F", _relativePosition, [], 0, "CAN_COLLIDE"];
    _barrier setDir ([_barrier, _artilleryPosition] call BIS_fnc_dirTo);
    _barrier setVectorUp surfaceNormal position _barrier;
    _props pushBack _barrier;
} forEach [0, 90, 180, 270];


(_artilleryVeh call BIS_fnc_getPitchBank) params ["_vx","_vy"];
if (([_vx,_vy] findIf {_x > 80 || _x < -80}) != -1) then {	
	[_artilleryVeh] spawn {
        params ["_unflippableVehicle"];
        _unflippableVehicle allowDamage false;
        _unflippableVehicle setVectorUp [0,0,1];
        _unflippableVehicle setPosATL [(getPosATL _unflippableVehicle) select 0, (getPosATL _unflippableVehicle) select 1, 0];
        sleep 1;
        _unflippableVehicle allowDamage true;
	};
};

{  
	[_x, true] remoteExec ["hideObject", 0, _artilleryVeh];
} forEach nearestTerrainObjects [_artilleryPosition, [], 50, false, true];

_artilleryVeh allowDamage true;

if !(_artilleryClass in [NATOHowitzer, CSATHowitzer]) then {
    _artilleryVeh lock 2;
};

//////////////////////
//Artillery fake fire
/////////////////////
_artilleryVeh addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    deleteVehicle _projectile;

    if (!local _unit) then {
        private _clientId = owner _unit;
        [_unit, 1] remoteExec ["setVehicleAmmo", _clientId];
    } else {
        _unit setVehicleAmmo 1;
    };
}];

[_artilleryVeh, _targetPosition, _artilleryShellClass] spawn {
    params ["_veh", "_targetPos", "_shell"];
    while {alive _veh} do {
        sleep 60;
        _veh doArtilleryFire [_targetPos, _shell, 2];
    };
    [2, "Exited artillery firing loop...", "fn_DES_Artillery", true] call A3A_fnc_log;
};

//////////////////////
//Task
/////////////////////
private _nameDest = [_markerX] call A3A_fnc_localizar;
private _taskText = format ["Artillery is firing at our positions from %1. We must destroy it or kill it's crew. Do this before %2, or they will destroy something valuable.", _nameDest, _displayTime];
private _taskId = "DES" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [
        _taskText,
        "Destroy Artillery",
        _markerX
    ],
    _artilleryPosition,
    false,
    0,
    true,
    "destroy",
    true
] call BIS_fnc_taskCreate;
[_taskId, "DES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

//////////////
//Infantry and MG
/////////////
private _mgPosition = [_artilleryPosition, 0, 200, 2, 0, 0.6] call BIS_fnc_findSafePos;
private _camonet = createVehicle ["CamoNet_BLUFOR_open_F", _mgPosition, [], 0, "CAN_COLLIDE"];
_props pushBack _camonet;

private _mgGroup = createGroup _sideX; 
private _staticVeh = createVehicle [_mgClass, _mgPosition, [], 0, "CAN_COLLIDE"];
[_staticVeh, _sideX] call A3A_fnc_AIVEHinit;
private _mgCrew = [_mgGroup, _mgCrewClass, _mgPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
[_mgCrew] call A3A_fnc_NATOinit;
_mgCrew moveInGunner _staticVeh;

_vehicles pushBack _staticVeh;
_groups pushBack _mgGroup;

{
    private _relativePosition = [_mgPosition, 4, _x] call BIS_Fnc_relPos;
    private _sandbag = createVehicle ["Land_BagFence_Round_F", _relativePosition, [], 0, "CAN_COLLIDE"];
    _sandbag setDir ([_sandbag, _mgPosition] call BIS_fnc_dirTo);
    _sandbag setVectorUp surfaceNormal position _sandbag;
    _props pushBack _sandbag;
} forEach [0, 90, 180, 270];


private _patrolGroup1 = [_mgPosition, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{ 
    [_x] call A3A_fnc_NATOinit;
} forEach units _patrolGroup1;
_groups pushBack _patrolGroup1;

[_patrolGroup1, _artilleryPosition, 50] call bis_fnc_taskPatrol;

private _patrolGroup2 = [_mgPosition, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{ 
    [_x] call A3A_fnc_NATOinit;
} forEach units _patrolGroup2;
_groups pushBack _patrolGroup2;

[_patrolGroup2, _artilleryPosition, 200] call bis_fnc_taskPatrol;

waitUntil {
	sleep 1;
	dateToNumber date > _dateLimitNum || !(alive _artilleryVeh) || _artilleryCrew findIf {alive _x} == -1
};

switch (true) do {
    case (alive _artilleryVeh && _artilleryCrew findIf {alive _x} != -1): {
        [2, "Artillery will fire at rebel position for some time, fail.", _fileName, true] call A3A_fnc_log;
        [_taskId, "DES", "FAILED"] call A3A_fnc_taskSetState;
        [-900, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        [-15,theBoss] call A3A_fnc_playerScoreAdd;

        _artilleryVeh removeAllEventHandlers "Fired"; //shells will be no longer fake
        _shellCount = round(random [2,4,7]);
        sleep 1;
        _artilleryVeh doArtilleryFire [_targetPosition, _artilleryShellClass, _shellCount];
        sleep 60; //shelling...
    };
    case (!(alive _artilleryVeh) || _artilleryCrew findIf {alive _x} == -1): {
        [2, "Artillery is destroyed, success.", _fileName, true] call A3A_fnc_log;
        [_taskId, "DES", "SUCCEEDED"] call A3A_fnc_taskSetState;

        [0, 400] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        { [30,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
        [15, theBoss] call A3A_fnc_playerScoreAdd;
    };
    default {
        [3, "Unexpected behaviour, cancelling mission.", _filename] call A3A_fnc_log;
        [_taskId, "DES", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

sleep 30;

[_taskId, "DES", 1200] spawn A3A_fnc_taskDelete;

_artilleryVeh removeAllEventHandlers "Fired";

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
{deleteVehicle _x} forEach _props;
[3, format ["Destroy Artillery clean up complete."], _filename] call A3A_fnc_log;