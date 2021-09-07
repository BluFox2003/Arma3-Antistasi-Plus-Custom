
private _fileName = "fn_civilian_removeCivilianPresence";

if (civPedestrians == 0) exitWith {};

private _marker = _this;
private _position = getMarkerPos _marker;

[2, format ["Removing Civ Presence Modules for %1", _marker], _fileName] call A3A_fnc_log;

private _cities = ["NameCityCapital","NameCity"] call SCRT_fnc_misc_getWorldPlaces;
private _isCity = _cities findIf {(_x select 1) distance2D _position <= 250} == 0;
private _size = if (_isCity) then {550} else {300}; 
private _presenceModules = nearestObjects [_position, ["ModuleCivilianPresenceSafeSpot_F", "ModuleCivilianPresenceUnit_F", "ModuleCivilianPresence_F"], _size, true];
{
	deleteVehicle _x;
} forEach _presenceModules;

[2, format ["Removed Civ Presence Modules for %1, waiting 30 sec before deleting remaining agents.", _marker], _fileName] call A3A_fnc_log;

sleep 30;
[2, format ["Removing leftover agents.", _marker], _fileName] call A3A_fnc_log;

private _remainingAgents = agents select {private _agent = agent _x; _agent isKindOf "CAManBase" && {_agent inArea [_position,_size,_size,0,true,-1]}};
{
	deleteVehicle (agent _x);
} forEach _remainingAgents;

[2, format ["Civ Presence Removed, job has been completed.", _marker], _fileName] call A3A_fnc_log;