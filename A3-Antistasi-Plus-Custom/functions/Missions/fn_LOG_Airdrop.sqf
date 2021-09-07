//Mission: Catch airdrop
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

private ["_unit","_countX"];

private _fileName = "fn_LOG_Airdrop";
[2, "Airdrop mission init.", _fileName] call A3A_fnc_log;

private _vehicles = [];
private _groups = [];
private _boxes = [];

private _sideX = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _positionX = getMarkerPos _markerX;

//////////////////////
//Mission position
/////////////////////

_airdropZoneMarker = createMarker ["AirdropZoneMarker", _positionX];
_airdropZoneMarker setMarkerSize [200, 200];
_airdropZoneMarker setMarkerColor "ColorUNKNOWN";
_airdropZoneMarker setMarkerShape "RECTANGLE";
_airdropZoneMarker setMarkerAlpha 0;

//////////////////////
//Task
/////////////////////
private _timeLimit = if (_difficultX) then {45 * settingsTimeMultiplier} else {60 * settingsTimeMultiplier};
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];
private _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;

private _nameDest = [_markerX] call A3A_fnc_localizar;

private _taskId = "LOG" + str A3A_taskCount;
private _taskText = format ["Our plane will drop some cargo at %1. Go there and throw any smoke grenade on ground, the pilot will notice the signal. Bring cargo to HQ. Do this before %2.", _nameDest, _displayTime];

[
    [teamPlayer,civilian],
    _taskId,
    [
        _taskText,
        "Catch Airdrop",
        _markerX
    ],
    _positionX,
    false,
    0,
    true,
    "plane",
    true
] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {
    sleep 5;
    private _players = (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
    private _isInArea = false;
    {
        if(_x inArea _airdropZoneMarker) exitWith {
            _isInArea = true;
        };
    } forEach _players;
    _isInArea or (dateToNumber date > _dateLimitNum)
};

[2, "Setting things in motion...", _fileName, true] call A3A_fnc_log; 

private _squads = [_sideX, "SQUAD"] call SCRT_fnc_unit_getGroupSet;

private _escortClass = nil;
private _infantrySquadArray = selectRandom _squads;

if(_sideX == Occupants) then { 
    _escortClass = if(_difficultX) then { selectRandom vehNATOAPC; } else { selectRandom vehNATOLightArmed; };
} 
else { 
    _escortClass = if(_difficultX) then { selectRandom vehCSATAPC; } else { selectRandom vehCSATLightArmed; };
};

if (isNil "_escortClass" || {isNil "_infantrySquadArray"}) exitWith {
	["LOG"] remoteExecCall ["A3A_fnc_missionRequest",2];
	[1, format ["Problems with unit templates, rerequesting new logistics mission."], _filename] call A3A_fnc_log;
};

[
    2, 
    format ["APC: %1, infantry array: %2", _escortClass, str _infantrySquadArray], 
    "LOG_Airdrop", 
    true
] call A3A_fnc_log;


private _squad1Position = [
    _positionX,
    800,
    1200,
    3,
    0,
    0.7,
    0,
    [],
    [_positionX, _positionX]
] call BIS_fnc_findSafePos;

//spawning airdrop interceptors
private _escortVehicleData = [_squad1Position, 0, _escortClass, _sideX] call A3A_fnc_spawnVehicle;
private _escortVeh = _escortVehicleData select 0;
private _vehCrew = crew _escortVeh;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
[_escortVeh, _sideX] call A3A_fnc_AIVEHinit;
private _escortVehicleGroup = _escortVehicleData select 2;
_groups pushBack _escortVehicleGroup;
_vehicles pushBack _escortVeh;

//spawning airdrop interceptor inf
private _typeGroup = if (_sideX == Occupants) then {
    groupsNATOSentry call SCRT_fnc_unit_selectInfantryTier
} else {
    groupsCSATSentry call SCRT_fnc_unit_selectInfantryTier
};
private _groupX = [_squad1Position, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
{
    _x assignAsCargo _escortVeh; 
    _x moveInCargo _escortVeh; 
    [_x] join _escortVehicleGroup; 
    [_x] call A3A_fnc_NATOinit;
} forEach units _groupX;
deleteGroup _groupX;

_infGroup1 = [_squad1Position, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{
    [_x] call A3A_fnc_NATOinit;
} forEach units _infGroup1;
_groups pushBack _infGroup1;

if(_difficultX) then {
    private _squad2Position = [
        _positionX,
        800,
        1200,
        3,
        0,
        0.7,
        0,
        [],
        [_positionX, _positionX]
    ] call BIS_fnc_findSafePos;

    _infGroup2 = [_squad2Position, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
    {
        [_x] call A3A_fnc_NATOinit;
    } forEach units _infGroup2;
    _groups pushBack _infGroup2;

    _infGroup2Wp = _infGroup2 addWaypoint [_positionX, 1];
    _infGroup2Wp setWaypointType "MOVE";
    _infGroup2Wp setWaypointBehaviour "AWARE";
    _infGroup2Wp setWaypointSpeed "FULL";
    [3, format ["Additional Group: %1", _infGroup2], _filename] call A3A_fnc_log;

};

//moving to airdrop location
private _escortWP = _escortVehicleGroup addWaypoint [_positionX, 50];
_escortWP setWaypointType "MOVE";
_escortWP setWaypointBehaviour "AWARE";
_escortWP setWaypointSpeed "FULL";
[2, format ["Placed Group: %1 in Lite Vehicle and set waypoint %2", _typeGroup, _positionX], _filename] call A3A_fnc_log;


_infGroup1Wp = _infGroup1 addWaypoint [_positionX, 1];
_infGroup1Wp setWaypointType "MOVE";
_infGroup1Wp setWaypointBehaviour "AWARE";
_infGroup1Wp setWaypointSpeed "FULL";
[3, format ["Group: %1", _infGroup1], _filename] call A3A_fnc_log;

waitUntil {
    sleep 1;
    private _smokes = _positionX nearObjects ["SmokeShell", 200];
    count _smokes > 0 || (dateToNumber date > _dateLimitNum)
};

[2, "Players inside, looking for smoke grenades.", _fileName, true] call A3A_fnc_log;

private _smokes = _positionX nearObjects ["SmokeShell", 200];
private _planeVeh = objNull;


if(count _smokes > 0) then {
    [2, "Smoke detected, spawning airplane.", _fileName, true] call A3A_fnc_log;
    
    private _initialPlanePosition = [
        _positionX,
        1500,
        2000,
        0,
        0,
        1,
        0,
        [],
        [_positionX, _positionX]
    ] call BIS_fnc_findSafePos;
    private _height = random [500, 1000, 1300];
    private _direction = [_initialPlanePosition, _positionX] call BIS_fnc_DirTo;

    _planeData = [[_initialPlanePosition select 0, _initialPlanePosition select 1, _height], _direction, vehSDKPayloadPlane, teamPlayer] call A3A_fnc_spawnVehicle;
    _planeVeh = _planeData select 0;
    _planeVeh setPosATL [getPosATL _planeVeh select 0, getPosATL _planeVeh select 1, _height];
    _planeVeh disableAI "TARGET";
    _planeVeh disableAI "AUTOTARGET";
    _planeVeh flyInHeight 105;

    private _minAltASL = ATLToASL [_positionX select 0, _positionX select 1, 0];
    _planeVeh flyInHeightASL [(_minAltASL select 2) +100, (_minAltASL select 2) +100, (_minAltASL select 2) +100];

    _planeGroup = _planeData select 2;
    _groups pushBack _planeGroup;

    driver _planeVeh setCaptive true;

    private _smokes = _positionX nearObjects ["SmokeShell", 200];
    private _dropPosition = _positionX;

    if(count _smokes > 0) then {
        private _smoke = _smokes select 0;
        _dropPosition = position _smoke;
    };

    _wp1 = group _planeVeh addWaypoint [_dropPosition, 0];
    _wp1 setWaypointType "MOVE";
    _wp1 setWaypointSpeed "LIMITED";
    _wp1 setWaypointBehaviour "CARELESS";

    sleep 2;
    private _textX = format ["This is the pilot. I see your smoke in the drop zone. I'm about to paradrop my cargo on %1 position, please wait.", mapGridPosition _positionX];
    [driver _planeVeh,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];   
};

waitUntil {
    sleep 1;
    (!(isNull _planeVeh) && {_planeVeh inArea _airdropZoneMarker}) || (dateToNumber date > _dateLimitNum) || !(alive _planeVeh)
};

private _airDropHappened = false;

if(alive _planeVeh) then {
    [2, "Airdropping cargo.", _fileName] call A3A_fnc_log;
    private _textX = format ["Dropping cargo."];
    [driver _planeVeh,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];

    _planeVeh allowDamage false;
    sleep 2;
    private _box1 = [
        "CargoNet_01_barrels_F",
        position _planeVeh
    ] call SCRT_fnc_common_airdropCargo;
    _box1 enableRopeAttach true;
    _box1 allowDamage false;
    [_box1] call A3A_fnc_logistics_addLoadAction;
    [_box1, teamPlayer] call A3A_fnc_AIVEHinit;
    
    //at least one dropped box counts as successful airdrop
    _airDropHappened = true;

    sleep 2;
    private _box2 = [
        "Land_FoodSacks_01_cargo_brown_F",
        position _planeVeh
    ] call SCRT_fnc_common_airdropCargo;
    _box2 enableRopeAttach true;
    _box2 allowDamage false;
    [_box2] call A3A_fnc_logistics_addLoadAction;
    [_box2, teamPlayer] call A3A_fnc_AIVEHinit;

    _boxes append [_box1, _box2];

    if(sunOrMoon < 1) then {
        [_box1, [0, 0, 1]] remoteExec ["SCRT_fnc_common_attachLightSource", 0, _box1];
        [_box2, [0, 0, 1]] remoteExec ["SCRT_fnc_common_attachLightSource", 0, _box2];
    };

    if(_difficultX) then {
        sleep 2;    
        private _ammoBox = [
            NATOAmmoBox,
            position _planeVeh
        ] call SCRT_fnc_common_airdropCargo;
        [_ammoBox] spawn A3A_fnc_fillLootCrate;
        [_ammoBox] call A3A_fnc_logistics_addLoadAction;
    };

    sleep 10;
    private _finalPosition = [_positionX, 3000, random 360] call BIS_fnc_relPos;
    _wp2 = group _planeVeh addWaypoint [_finalPosition, 1];
    _wp2 setWaypointSpeed "FULL";
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointStatements ["true","deleteVehicle this"];

    driver _planeVeh setCaptive false;
    _planeVeh allowDamage true;
};

waitUntil {
    sleep 1; 
    private _isInArea = false;
    {
        if(_x distance (getMarkerPos respawnTeamPlayer) < 25) exitWith {
            _isInArea = true;
        };
    } forEach _boxes;
    _isInArea || (dateToNumber date > _dateLimitNum) || !(_airDropHappened)
};

private _boxesOnRebelHq = false;
{
    if(_x distance (getMarkerPos respawnTeamPlayer) < 25) exitWith {
        _boxesOnRebelHq = true;
    };
} forEach _boxes;


switch(true) do {
    case (_boxesOnRebelHq): {
        [2, "Success, Boxes on HQ.", _fileName, true] call A3A_fnc_log;
        //make sure that all boxes will be counted, so let's wait a little
        sleep 5;

        private _boxesCount = { _x distance (getMarkerPos respawnTeamPlayer) < 25 } count _boxes;

        [0, 40 * _boxesCount] remoteExec ["A3A_fnc_resourcesFIA",2];
        { 
            [40 * _boxesCount, _x] call A3A_fnc_playerScoreAdd;
        } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
        [20, theBoss] call A3A_fnc_playerScoreAdd;

        [_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
    };
    case (dateToNumber date > _dateLimitNum): {
        [2, "Fail, mission Expired.", _fileName, true] call A3A_fnc_log;
        [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
        [-10,theBoss] call A3A_fnc_playerScoreAdd;
    }; 
    //if plane crashed before, then mission failed, but it's not our fault
    case (!(_airDropHappened)): {
        [2, "Fail, plane was shot down.", _fileName, true] call A3A_fnc_log;
        [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
    };
    default {
        [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

sleep 30;

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;

{
    deleteVehicle _x;
} forEach _boxes;

deleteMarker _airdropZoneMarker;

{
    [_x] spawn A3A_fnc_vehDespawner
} forEach _vehicles;

{
    [_x] spawn A3A_fnc_groupDespawner
} forEach _groups;

if(!isNil "_planeVeh" || !isNull _planeVeh) then {
    deleteVehicle _planeVeh;
};

[3, format ["Airdrop cleanup complete."], _filename] call A3A_fnc_log;

