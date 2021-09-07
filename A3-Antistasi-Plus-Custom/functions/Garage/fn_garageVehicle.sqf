#include "defineGarage.inc"

private ["_pool","_veh","_typeVehX"];
_pool = false;
if (_this select 0 || !isMultiplayer) then {_pool = true};

if (side player != teamPlayer) exitWith {["Garage", "Only rebels can add vehicles to the garage."] call A3A_fnc_customHint;};
if (!(player call A3A_fnc_isMember)) exitWith {["Garage", "Only server members have the garage feature enabled"] call A3A_fnc_customHint;};

_veh = cursorTarget;

if (isNull _veh) exitWith {["Garage", "You are not looking at a vehicle"] call A3A_fnc_customHint;};

if !((_veh getVariable "SA_Tow_Ropes") isEqualTo objNull) exitWith {["Garage", "You can't garage a Vehicle with your Tow Rope out or a Vehicle attached"] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {["Garage", "You can't add destroyed vehicles to your garage"] call A3A_fnc_customHint;};
_closeX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
_closeX = _closeX select {(player inArea _x) and (_veh inArea _x)};


if (_closeX isEqualTo []) exitWith {["Garage", format ["You and the vehicle need to be in a %1 garrison surrounding in order to garage a it",nameTeamPlayer]] call A3A_fnc_customHint;};

if ({alive _x} count (crew vehicle _veh) > 0) exitWith {["Garage", "In order to store a vehicle, its crew must disembark."] call A3A_fnc_customHint;};

_typeVehX = typeOf _veh;

if (_veh isKindOf "Man") exitWith {["Garage", format ["Sorry you can't Garage %1.",name _veh]] call A3A_fnc_customHint;};

if ((typeOf _veh) in [NATOSurrenderCrate, CSATSurrenderCrate]) exitWith {
	_veh addMagazineCargoGlobal [unlockedMagazines#0,1];// so fnc_empty will delete the crate
	_transferLoot = [_veh] spawn A3A_fnc_empty;
	[10] call A3A_fnc_resourcesPlayer;
	["Garage", "Loot crate stored"] call A3A_fnc_customHint;
};
if !(_veh isKindOf "AllVehicles") exitWith {["Garage", "The vehicle you are looking can't be stored in our Garage"] call A3A_fnc_customHint;};

_units = (player nearEntities ["Man",300]) select {([_x] call A3A_fnc_CanFight) && (side _x isEqualTo Occupants || side _x isEqualTo Invaders)};
if (_units findIf {_unit = _x; _players = allPlayers select {(side _x isEqualTo teamPlayer) && (player distance _x < 300)}; _players findIf {_x in (_unit targets [true, 300])} != -1} != -1) exitWith {["Garage", "You can't garage vehicles while enemies are engaging you"] call A3A_fnc_customHint};
if (_units findIf{player distance _x < 100} != -1) exitWith {["Garage", "You can't garage vehicles while enemies are near you"] call A3A_fnc_customHint};

if (player distance _veh > 25) exitWith {["Garage", "You can't garage vehicles that are more than 25m away from you"] call A3A_fnc_customHint};

if (_pool and (count vehInGarage >= (tierWar *5))) exitWith {["Garage", "You can't garage more vehicles at your current War Level"] call A3A_fnc_customHint;};
private _personalGarage = player getVariable ["personalGarage", []];
if (!((count _personalGarage < personalGarageMax) or (personalGarageMax isEqualTo 0)) and !_pool) exitWith {["Garage", "Personal garage is full, you can't add more vehicles to it"] call A3A_fnc_customHint};


_exit = false;
if (!_pool) then
	{
	_owner = _veh getVariable "ownerX";
	if (!isNil "_owner") then
		{
		if (_owner isEqualType "") then
			{
			if (getPlayerUID player != _owner) then {_exit = true};
			};
		};
	};

if (_exit) exitWith {["Garage", "You are not the owner of this vehicle. Therefore, you can't garage it."] call A3A_fnc_customHint;};

if (_veh in staticsToSave) then {staticsToSave = staticsToSave - [_veh]; publicVariable "staticsToSave"};

[_veh,true] call A3A_fnc_empty;
if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};
if (_veh isKindOf "StaticWeapon") then {deleteVehicle _veh};
if (_pool) then
	{
	vehInGarage = vehInGarage + [_typeVehX];
	publicVariable "vehInGarage";
	["Garage", format ["Vehicle added to %1 Garage",nameTeamPlayer]] call A3A_fnc_customHint;
	}
else
	{
		[_typeVehX] call A3A_fnc_addToPersonalGarageLocal;
		["Garage", "Vehicle added to Personal Garage"] call A3A_fnc_customHint;
	};
