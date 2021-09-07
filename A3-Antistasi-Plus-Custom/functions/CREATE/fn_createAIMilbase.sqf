if (!isServer and hasInterface) exitWith{};

private _markerX = _this select 0;

//Not sure if that ever happens, but it reduces redundance
if(spawner getVariable _markerX == 2) exitWith {};

diag_log format ["[Antistasi] Spawning Military Base %1", _markerX];

private _vehiclesX = [];
private _groups = [];
private _soldiers = [];
private _props = [];

private _positionX = getMarkerPos _markerX;
private _pos = [];

private _size = [_markerX] call A3A_fnc_sizeMarker;

private _frontierX = [_markerX] call A3A_fnc_isFrontline;
private _busy = if (dateToNumber date > server getVariable _markerX) then {false} else {true};
private _nVeh = round (_size/60);

private _countX = 0;

private _sideX = sidesX getVariable [_markerX,sideUnknown];

private _radarType = if (_sideX == Occupants) then {NATOAARadar} else {CSATAARadar};
private _samType = if (_sideX == Occupants) then {NATOAASam} else {CSATAASam};
private _aaElements = [_radarType, _samType];

private _heavyVehicles = if (_sideX == Occupants) then { vehNATOAPC + vehNATOTanks + vehNATOAA } else { vehCSATAPC + vehCSATTanks + vehCSATAA };


/////////////////////////////
// SPAWNING AA ELEMENTS
////////////////////////////
_spawnParameter = [_markerX, "Sam"] call A3A_fnc_findSpawnPosition;
while {_spawnParameter isEqualType []} do {
    {
        if(_x != "") then {
            private _vehiclePosition = [_spawnParameter select 0, 0, 125, 10, 0, 0.7] call BIS_fnc_findSafePos;
            private _rotation = random 360;

            private _aaVehicleData = [_vehiclePosition, _rotation, _x, _sideX] call A3A_fnc_spawnVehicle;
            private _aaVehicle = _aaVehicleData select 0;
            private _aaVehicleCrew = _aaVehicleData select 1;
            {[_x,_markerX] call A3A_fnc_NATOinit} forEach _aaVehicleCrew;
            [_aaVehicle, _sideX] call A3A_fnc_AIVEHinit;
            _aaVehicleGroup = _aaVehicleData select 2;

            _soldiers = _soldiers + _aaVehicleCrew;
            _groups pushBack _aaVehicleGroup;
            _vehiclesX pushBack _aaVehicle;
            sleep 1;

            //radar rotation
            if(_x == _radarType) then {
                [_aaVehicle] spawn {
                    params ["_radar"];

                    while {alive _radar} do { 
                        { 
                            _radar lookAt (_radar getRelPos [100, _x]); 
                            sleep 2.45; 
                        } forEach [120, 240, 0]; 
                    };
                }; 
            };
        };
    } forEach _aaElements;
	_spawnParameter = [_markerX, "Sam"] call A3A_fnc_findSpawnPosition;
	sleep 1;
};

//Close Radius AA
private _aaVehicleType = if(_sideX == Occupants) then {selectRandom vehNATOAA} else {selectRandom vehCSATAA};
private _vehiclePosition = [_positionX, 0, 50, 8, 0, 0.5] call BIS_fnc_findSafePos;
private _aaVehicleData = [_vehiclePosition, (random 360), _aaVehicleType, _sideX] call A3A_fnc_spawnVehicle;
private _aaVehicle = _aaVehicleData select 0;
private _aaVehicleCrew = _aaVehicleData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _aaVehicleCrew;
_soldiers = _soldiers + _aaVehicleCrew;
[_aaVehicle, _sideX] call A3A_fnc_AIVEHinit;
_aaVehicleGroup = _aaVehicleData select 2;
_vehiclesX pushBack _aaVehicle;
_groups pushBack _aaVehicleGroup;
sleep 0.1;
[(gunner _aaVehicle), 300] spawn SCRT_fnc_common_scanHorizon;

/////////////////////////////
// SPAWNING PATROL VEHICLES
////////////////////////////
private _selectedVehicle = selectRandom _heavyVehicles;

if (!isNil "_selectedVehicle") then {
	private _road = nil;
    private _radiusX = 5;

	while {true} do {
		_road = _positionX nearRoads _radiusX;
		if (count _road > 0) exitWith {};
		if (_radiusX > 700) exitWith {};
		_radiusX = _radiusX + 10;
	};

	private _position = nil;
	if (!isNil "_road") then {
		private _roadcon = roadsConnectedto (_road select 0);
		private _dirveh = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
		_position = getPos (_road select 0);
	} else {
		_position = [_positionX, 10, _size, 5, 0, 0.7, 0, [], [_positionX, _positionX]] call BIS_fnc_findSafePos;
	};

	private _patrolVehicleData = [_position, 0, _selectedVehicle, _sideX] call A3A_fnc_spawnVehicle;
	private _patrolVeh = _patrolVehicleData select 0;
	private _patrolVehCrew = crew _patrolVeh;
	private _patrolVehicleGroup = _patrolVehicleData select 2;
	{[_x] call A3A_fnc_NATOinit} forEach _patrolVehCrew;
	[_patrolVeh, _sideX] call A3A_fnc_AIVEHinit;
	_soldiers = _soldiers + _patrolVehCrew;
	_groups pushBack _patrolVehicleGroup;
	_vehiclesX pushBack _patrolVeh;

	[_patrolVehicleGroup, _positionX, 450] call bis_fnc_taskPatrol;
};


/////////////////////////////
// FRONTIER REINFORCING
////////////////////////////
if (_frontierX) then {
	private _roads = _positionX nearRoads _size;
	if (count _roads != 0) then {
		private _groupX = createGroup _sideX;
		_groups pushBack _groupX;
		_dist = 0;
		_road = objNull;
		{if ((position _x) distance _positionX > _dist) then {_road = _x;_dist = position _x distance _positionX}} forEach _roads;
		private _roadscon = roadsConnectedto _road;
		private _roadcon = objNull;
		{if ((position _x) distance _positionX > _dist) then {_roadcon = _x}} forEach _roadscon;
		private _dirveh = [_roadcon, _road] call BIS_fnc_DirTo;
		_pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
		private _bunker = sandbag createVehicle _pos;
		_vehiclesX pushBack _bunker;
		_bunker setDir _dirveh;
		_pos = getPosATL _bunker;
		private _typeVehX = if (_sideX == Occupants) then {staticATOccupants} else {staticATInvaders};
		private _veh = _typeVehX createVehicle _positionX;
		_vehiclesX pushBack _veh;
		_veh setDir _dirVeh + 180;
		_veh setPos [(_pos select 0) - 1, (_pos select 1) - 1, _pos select 2];
		private _typeUnit = if (_sideX==Occupants) then {
			staticCrewOccupants call SCRT_fnc_unit_selectInfantryTier
		} else {
			staticCrewInvaders call SCRT_fnc_unit_selectInfantryTier
		};
		private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_unit,_markerX] call A3A_fnc_NATOinit;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_unit moveInGunner _veh;
		_soldiers pushBack _unit;
	};
};

/////////////////////////////
// MARKER, GARRISON
////////////////////////////
private _mrk = createMarkerLocal [format ["%1patrolarea", random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanceSPWN/2),(distanceSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
private _ang = markerDir _markerX;
_mrk setMarkerDirLocal _ang;
if (!debug) then {_mrk setMarkerAlphaLocal 0};
private _garrison = garrison getVariable [_markerX,[]];
if (count _garrison > 120) then {
	_garrison resize 120;
};

private _additionalGarrison = [_sideX, _markerX] call SCRT_fnc_garrison_rollOversizeGarrison;
if (count _additionalGarrison > 0) then {
	for "_i" from 0 to (count _additionalGarrison) - 1 do {
		private _groupTypes = _additionalGarrison select _i;
		private _group = [_positionX, _sideX, _groupTypes, false, true] call A3A_fnc_spawnGroup;
		if !(isNull _group) then {
			sleep 1;
			_nul = [leader _group, _mrk, "SAFE","SPAWNED", "RANDOM", "NOVEH2"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
			_groups pushBack _group;
			{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _group;
		};
	};
};

_garrison = _garrison call A3A_fnc_garrisonReorg;
private _radiusX = count _garrison;
private _patrol = true;
if (_radiusX < ([_markerX] call A3A_fnc_garrisonSize)) then {
	_patrol = false;
}
else {
	//No patrol if patrol area overlaps with an enemy site
	_patrol = ((markersX findIf {(getMarkerPos _x inArea _mrk) && {sidesX getVariable [_x, sideUnknown] != _sideX}}) == -1);
};
if (_patrol) then {
	_countX = 0;
	while {_countX < 4} do {
		_arraygroups = if (_sideX == Occupants) then {
			[(groupsNATOSentry call SCRT_fnc_unit_selectInfantryTier), (groupsNATOSniper call SCRT_fnc_unit_selectInfantryTier)]
		}
		else {
			[(groupsCSATSentry call SCRT_fnc_unit_selectInfantryTier), (groupsCSATSniper call SCRT_fnc_unit_selectInfantryTier)]
		};
		
		if ([_markerX,false] call A3A_fnc_fogCheck < 0.3) then {_arraygroups = _arraygroups - sniperGroups};
		_typeGroup = selectRandom _arraygroups;
		_groupX = [_positionX, _sideX, _typeGroup, false, true] call A3A_fnc_spawnGroup;
		if !(isNull _groupX) then {
			sleep 1;
			if ((random 10 < 2.5) and (not(_typeGroup in sniperGroups))) then {
				_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
				[_dog] spawn A3A_fnc_guardDog;
				sleep 1;
			};
			_nul = [leader _groupX, _mrk, "SAFE","SPAWNED", "RANDOM", "NOVEH2"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
			_groups pushBack _groupX;
			{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
		};
		_countX = _countX +1;
	};
};
_countX = 0;

private _groupX = createGroup _sideX;
_groups pushBack _groupX;
private _typeUnit = if (_sideX == Occupants) then {
	staticCrewOccupants call SCRT_fnc_unit_selectInfantryTier
} else {
	staticCrewInvaders call SCRT_fnc_unit_selectInfantryTier
};
private _typeVehX = if (_sideX == Occupants) then {
 	if (NATOHowitzer != "") then {NATOHowitzer} else {NATOMortar}
} else {
	if (CSATHowitzer != "") then {CSATHowitzer} else {CSATMortar}
};

_spawnParameter = [_markerX, "Mortar"] call A3A_fnc_findSpawnPosition;
while {_spawnParameter isEqualType []} do
{
	_mortarPos = _spawnParameter select 0;
	_veh = _typeVehX createVehicle (_mortarPos);
	_veh setDir (_spawnParameter select 1);
	//_veh setPosATL (_spawnParameter select 0);
	_nul=[_veh] execVM "scripts\UPSMON\MON_artillery_add.sqf";//TODO need delete UPSMON link
	_unit = [_groupX, _typeUnit, _positionX, [], 0, "CAN_COLLIDE"] call A3A_fnc_createUnit;
	[_unit,_markerX] call A3A_fnc_NATOinit;
	_unit moveInGunner _veh;
	_soldiers pushBack _unit;
	_vehiclesX pushBack _veh;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	_spawnParameter = [_markerX, "Mortar"] call A3A_fnc_findSpawnPosition;
	sleep 1;

	{
		private _relativePosition = [_mortarPos, 4, _x] call BIS_Fnc_relPos;
		private _sandbag = createVehicle ["Land_BagFence_Round_F", _relativePosition, [], 0, "CAN_COLLIDE"];
		_sandbag setDir ([_sandbag, _mortarPos] call BIS_fnc_dirTo);
		_sandbag setVectorUp surfaceNormal position _sandbag;
		_props pushBack _sandbag;
	} forEach [0, 90, 180, 270];
};

private _ret = [_markerX,_size,_sideX,_frontierX] call A3A_fnc_milBuildings;
_groups pushBack (_ret select 0);
_vehiclesX append (_ret select 1);
_soldiers append (_ret select 2);
{[_x, _sideX] call A3A_fnc_AIVEHinit} forEach (_ret select 1);

if(random 100 < (50 + tierWar * 3)) then
{
	_large = (random 100 < (40 + tierWar * 2));
	[_markerX, _large] spawn A3A_fnc_placeIntel;
};

_typeVehX = if (_sideX == Occupants) then {NATOFlag} else {CSATFlag};
private _flagX = createVehicle [_typeVehX, _positionX, [],0, "NONE"];
_flagX allowDamage false;
[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
_vehiclesX pushBack _flagX;

private _ammoBoxType = if (_sideX == Occupants) then {NATOAmmoBox} else {CSATAmmoBox};

// Only create ammoboxes if it's been recharged (see reinforcementsAI)
private _ammoBox1 = if (garrison getVariable [_markerX + "_lootCD", 0] == 0) then {
	private _ammoBox1 = _ammoBoxType createVehicle _positionX;
	_ammoBox1 addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
	[_ammoBox1] spawn A3A_fnc_fillLootCrate;
	[_ammoBox1] call A3A_fnc_logistics_addLoadAction;
	_ammoBox1;
};

private _ammoBox2 = if (garrison getVariable [_markerX + "_lootCD", 0] == 0) then {
	private _ammoBox2 = _ammoBoxType createVehicle _positionX;
	_ammoBox2 addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
	[_ammoBox2] spawn A3A_fnc_fillLootCrate;
	[_ammoBox2] call A3A_fnc_logistics_addLoadAction;
	_ammoBox2;
};

if (!_busy) then {
	for "_i" from 1 to (round (random 2)) do {
		_arrayVehAAF = _heavyVehicles select {[_x] call A3A_fnc_vehAvailable};
		_spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
		if (count _arrayVehAAF > 0 && {_spawnParameter isEqualType []}) then {
			_veh = createVehicle [selectRandom _arrayVehAAF, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
			_veh setDir (_spawnParameter select 1);
			_vehiclesX pushBack _veh;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			_nVeh = _nVeh -1;
			sleep 1;
		};
	};
};

_arrayVehAAF = if (_sideX == Occupants) then {vehNATONormal} else {vehCSATNormal};
_countX = 0;

while {_countX < _nVeh && {_countX < 3}} do {
	_typeVehX = selectRandom _arrayVehAAF;
	_spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
	if(_spawnParameter isEqualType []) then {
		_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "NONE"];
		_veh setDir (_spawnParameter select 1);
		_vehiclesX pushBack _veh;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		sleep 1;
		_countX = _countX + 1;
	}
	else {
		//No further spaces to spawn vehicle
		_countX = _nVeh;
	};
};

{ _x setVariable ["originalPos", getPos _x] } forEach _vehiclesX;

_array = [];
_subArray = [];
_countX = 0;
_radiusX = _radiusX -1;
while {_countX <= _radiusX} do {
	_array pushBack (_garrison select [_countX,7]);
	_countX = _countX + 8;
};
for "_i" from 0 to (count _array - 1) do {
	_groupX = if (_i == 0) then {[_positionX,_sideX, (_array select _i),true,false] call A3A_fnc_spawnGroup} else {[_positionX,_sideX, (_array select _i),false,true] call A3A_fnc_spawnGroup};
	_groups pushBack _groupX;
	{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
	if (_i == 0) then {_nul = [leader _groupX, _markerX, "SAFE", "RANDOMUP","SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf"} else {_nul = [leader _groupX, _markerX, "SAFE","SPAWNED", "RANDOM","NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf"};
};//TODO need delete UPSMON link

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

[_markerX] call A3A_fnc_freeSpawnPositions;

deleteMarker _mrk;
{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteGroup _x } forEach _groups;

{
	// delete all vehicles that haven't been stolen
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;

{
	deleteVehicle _x;
} forEach _props;

// If loot crate was stolen, set the cooldown
if (!isNil "_ammoBox1") then {
	if ((alive _ammoBox1) and (_ammoBox1 distance2d _positionX < 100)) exitWith { deleteVehicle _ammoBox1 };
	if (alive _ammoBox1) then { [_ammoBox1] spawn A3A_fnc_VEHdespawner };
	private _lootCD = 120*16 / ([_markerX] call A3A_fnc_garrisonSize);
	garrison setVariable [_markerX + "_lootCD", _lootCD, true];
};

if (!isNil "_ammoBox2") then {
	if ((alive _ammoBox2) and (_ammoBox2 distance2d _positionX < 100)) exitWith { deleteVehicle _ammoBox2 };
	if (alive _ammoBox2) then { [_ammoBox2] spawn A3A_fnc_VEHdespawner };
	private _lootCD = 120*16 / ([_markerX] call A3A_fnc_garrisonSize);
	garrison setVariable [_markerX + "_lootCD", _lootCD, true];
};
