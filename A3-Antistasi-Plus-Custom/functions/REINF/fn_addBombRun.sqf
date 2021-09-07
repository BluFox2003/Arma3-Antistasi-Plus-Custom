_veh = cursortarget;

if (isNull _veh) exitWith {["Airstrike", "You are not looking at vehicle."] call SCRT_fnc_misc_showDeniedActionHint;};

private _units = (player nearEntities ["Man",300]) select {([_x] call A3A_fnc_CanFight) && (side _x isEqualTo Occupants || side _x isEqualTo Invaders)};
if (_units findIf {_unit = _x; _players = allPlayers select {(side _x isEqualTo teamPlayer) && (player distance _x < 300)}; _players findIf {_x in (_unit targets [true, 300])} != -1} != -1) exitWith {["Airstrike", "You can't convert Airstrikes while enemies are near you."] call SCRT_fnc_misc_showDeniedActionHint};
if (_units findIf{player distance _x < 100} != -1) exitWith {["Airstrike", "You can't convert Airstrikes while enemies are near you."] call SCRT_fnc_misc_showDeniedActionHint};

private _near = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] isEqualTo teamplayer};
_near = _near select {(player inArea _x) && (_veh inArea _x)};

if (_near isEqualTo []) exitWith {["Airstrike", format ["You and the Air vehicle need to be in the Area of an %1 Airport or HQ in order to convert it to Airstrikes",nameTeamPlayer]] call SCRT_fnc_misc_showDeniedActionHint;};

if ((typeOf _veh) in [vehSDKPlane,vehSDKPayloadPlane]) exitWith {
	["Airstrike", format ["%1 have plenty of these planes, they cannot be used to increase Airstrike points.",nameTeamPlayer]] call SCRT_fnc_misc_showDeniedActionHint;
};

if ({isPlayer _x} count crew _veh > 0) exitWith {
	["Airstrike", "In order to convert, Vehicle must be empty."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (bombRuns > 4) exitWith {
	["Airstrike", "There can be no more than 5 available airstrikes."] call SCRT_fnc_misc_showDeniedActionHint;
};

_owner = _veh getVariable "ownerX";
_exit = false;
if (!isNil "_owner") then
	{
	if (_owner isEqualType "") then
		{
		if (getPlayerUID player != _owner) then {_exit = true};
		};
	};

if (_exit) exitWith {
    ["Airstrike", "You are not the owner of this vehicle. Therefore, you can't convert it."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (!(_veh isKindOf "Air")) exitWith {
	["Airstrike", "Only Air Vehicles can be used to increase Airstrike points."] call SCRT_fnc_misc_showDeniedActionHint;
};

_typeX = typeOf _veh;

if (isClass (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo")) then {
	if (count getArray (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo" >> "dissasembleTo") > 0) then {
		_exit = true;
	};
};
if (_exit) exitWith {
    ["Airstrike", "Backpack drones can't be used to increase Airstrike points"] call SCRT_fnc_misc_showDeniedActionHint;
};

private _pointsX = 1;

if (_typeX in vehAttackHelis) then {_pointsX = 5};
if ((_typeX in vehCSATPlanes) or (_typeX in vehNATOPlanes)) then {_pointsX = 10};
deleteVehicle _veh;

private _newBombRuns = bombRuns + _pointsX;
if (_newBombRuns > 5) then {
	_newBombRuns = 5;
};

["Airstrike", "Air Support points has been increased."] call A3A_fnc_customHint;
bombRuns = _newBombRuns;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics", theBoss];