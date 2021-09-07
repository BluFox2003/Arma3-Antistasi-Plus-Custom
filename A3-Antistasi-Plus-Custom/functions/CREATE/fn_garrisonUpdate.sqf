if (!isServer) exitWith {};
private ["_typeX","_sideX","_markerX","_modeX","_garrison","_subType"];
_typeX = _this select 0;
if (_typeX isEqualType []) then
	{
	if ((_typeX select 0) isEqualType objNull) then
		{
		_subType = [];
		{
		_subType pushBack (_x getVariable "unitType");
		} forEach _typeX;
		_typeX = _subType;
		};
	}
else
	{
	if (_typeX isEqualType objNull) then {_typeX = _typeX getVariable "unitType"};
	};
_sideX = _this select 1;
_markerX = _this select 2;
if !(_markerX isEqualType "") exitWith {
		diag_log format ["%1: [Antistasi] | ERROR | garrisonUpdate.sqf | Failed to update Garrison at Position:%2",servertime,_this];
		};
_modeX = _this select 3;//-1 to remove 1 unbit (killed EHs etc). 1 add 1 single classname / object. 2 adds a hole array and admits classnames or objects
_exit = false;
{if (isNil _x) exitWith {_exit = true}} forEach ["_typeX","_sideX","_markerX","_modeX"];
if (_exit) exitWith {
	diag_log format ["%1: [Antistasi] | ERROR | garrisonUpdate.sqf | Failed to update Garrison with params:%2,%3,%4,%5",servertime,_typeX,_sideX,_markerX,_modeX];
	};
waitUntil {!garrisonIsChanging};
{if (isNil _x) exitWith {_exit = true}} forEach ["_typeX","_sideX","_markerX","_modeX"];
if (_exit) exitWith {
	diag_log format ["%1: [Antistasi] | ERROR | garrisonUpdate.sqf | Failed to update Garrison with params:%2,%3,%4,%5",servertime,_typeX,_sideX,_markerX,_modeX];
	};
garrisonIsChanging = true;
if ((_sideX == Occupants) and (!(sidesX getVariable [_markerX,sideUnknown] == Occupants))) exitWith {garrisonIsChanging = false};
if ((_sideX == Invaders) and (!(sidesX getVariable [_markerX,sideUnknown] == Invaders))) exitWith {garrisonIsChanging = false};
if ((_sideX == teamPlayer) and (!(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))) exitWith {garrisonIsChanging = false};

private _previousGarrison = garrison getVariable [_markerX,[]];

[2, format ["Garrison before update: %1", str _previousGarrison], "garrisonUpdate.sqf"] call A3A_fnc_log;

_garrison = [];
_garrison = _garrison + _previousGarrison;

if (_modeX == -1) then
	{
	for "_i" from 0 to (count _garrison -1) do
		{
		if (_typeX == (_garrison select _i)) exitWith {_garrison deleteAt _i};
		};
	}
else
	{
	if (_modeX == 1) then {_garrison pushBack _typeX} else {_garrison append _typeX};
	};
if (isNil "_garrison") exitWith {garrisonIsChanging = false};
[2, format ["Garrison after update: %1", str _garrison], "garrisonUpdate.sqf"] call A3A_fnc_log;
garrison setVariable [_markerX,_garrison,true];
if (_sideX == teamPlayer) then {[_markerX] call A3A_fnc_mrkUpdate};
garrisonIsChanging = false;
