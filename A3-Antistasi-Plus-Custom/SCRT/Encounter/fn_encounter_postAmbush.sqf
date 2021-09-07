private _fileName = "fn_encounter_postAmbush";
[2, "Post Ambush Vehicle Event Init.", _filename] call A3A_fnc_log;

private _vehicles = [];
private _effects = [];

private _allPlayers = (call BIS_fnc_listPlayers) select {side _x == teamPlayer};
private _player = selectRandom _allPlayers;
private _originPosition = position _player;

private _spawnPosition = [_originPosition, 900, distanceSPWN, 0, 0] call BIS_fnc_findSafePos;
private _road = objNull;
private _radiusX = 5;

while {true} do {
    _road = _spawnPosition nearRoads _radiusX;
    if (count _road > 0 && {_road findIf {(position _x) distance2D _originPosition > 500} != -1}) exitWith {};
    _radiusX = _radiusX + 5;
};

private _roadcon = roadsConnectedto ((_road select {(position _x) distance2D _originPosition > 500}) select 0); //guaranteed due to top condition on road search
private _dirveh = if (count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPosition = getPos (_road select 0);

private _crater = createVehicle ["CraterLong", _roadPosition, [], 0, "CAN_COLLIDE"];
_crater setDir _dirveh;
_crater setVectorUp surfaceNormal getPos _crater;
_vehicles pushBack _crater;

private _side = selectRandom [Occupants, Invaders];

private _vehicleClass = nil;
private _crewClass = nil;
private _isFia = if (random 10 > (tierWar + difficultyCoef)) then {true} else {false};

if (_side == Occupants) then {
    _crewClass = NATOCrew;
    if (_isFia) then {
       _vehicleClass = selectRandom (vehFIAAPC + vehFIATanks);
    } else {
        _vehicleClass = selectRandom vehNATOAttack;
    };
} else {
    _crewClass = CSATCrew;
    if (_isFia) then {
        _vehicleClass = selectRandom (vehWAMAPC + vehWAMTanks);
    } else {
        _vehicleClass = selectRandom vehCSATAttack;
    };
};

if (_vehicleClass == "" || {_vehicleClass == "not_supported"}) exitWith {
    [2, "No vehicle class, aborting Post Ambush Vehicle Event.", _filename] call A3A_fnc_log;
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _crashedVehicle = createVehicle [_vehicleClass, [_roadPosition select 0, _roadPosition select 1, 0.9], [], 0, "CAN_COLLIDE"];
_crashedVehicle setDir _dirveh;
_crashedVehicle setDamage 0.7;
_crashedVehicle setHit ["wheel_2_1_steering", 1];
_crashedVehicle setHit ["wheel_1_1_steering", 1];
_crashedVehicle setFuel 0;
[_crashedVehicle, _side] call A3A_fnc_AIVEHinit;

for "_i" from 0 to (random [3,5,6]) do {
    _firePosition = [
        _roadPosition, 
        2,
        25,
        2
    ] call BIS_fnc_findSafePos;

    [_firePosition, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0, _crashedVehicle];

    private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
    [_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

    private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
    [_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

    _effects append [_fireEffectEmitter, _lightEffectEmitter];
};

private _groupCrew = createGroup _side;
for "_i" from 1 to 3 do {
    private _crew = [_groupCrew, _crewClass, _roadPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_crew] call A3A_fnc_NATOinit;

    if ((random 100) > 20) then {
        sleep 0.5;
        _crew setDamage 1;
        private _dir = [_crew,_crashedVehicle] call BIS_fnc_dirTo;
        _crew setDir (_dir - 180);
    } else {
        _crew removeItems "FirstAidKit";
        sleep 0.1;
        _crew setDamage 0.8;
    };
};

private _timeOut = time + 1800;
waitUntil { sleep 5; (time > _timeOut) || isNull _crashedVehicle || {_allPlayers findIf {_x distance2D (position _crashedVehicle) < distanceSPWN} == -1}};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;

{
    deleteVehicle _x;
} forEach _effects;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

[3, format ["Post Ambush Vehicle Event clean up complete."], _filename] call A3A_fnc_log;