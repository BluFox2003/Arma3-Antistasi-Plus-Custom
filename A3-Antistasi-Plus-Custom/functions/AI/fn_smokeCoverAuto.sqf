private ["_veh"];

_veh = _this select 0;

if !(alive _veh) exitWith {};

if !(local _veh) exitWith {};

private _smoked = _veh getVariable ["smoked",0];

if (time < _smoked) exitWith {};

_veh setVariable ["smoked",time + 120];

if ({"SmokeLauncher" in (_veh weaponsTurret _x)} count (allTurrets _veh) > 0) then {
	[_veh,"SmokeLauncher"] call BIS_fnc_fire;
};