//Mission: Assassinate an official
if (!isServer and hasInterface) exitWith{};

_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";

_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
_positionX = getMarkerPos _markerX;

_timeLimit = if (_difficultX) then {15 * settingsTimeMultiplier} else {30 * settingsTimeMultiplier};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;

_nameDest = [_markerX] call A3A_fnc_localizar;
_naming = if (_sideX == Occupants) then {nameOccupants} else {nameInvaders};
private _taskString = format ["A %4 officer is inspecting %1. Go there and kill him before %2:%3.",_nameDest,numberToDate [2035,_dateLimitNum] select 3,numberToDate [2035,_dateLimitNum] select 4,_naming];

private _taskId = "AS" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_taskString,"Kill the Officer",_markerX],_positionX,false,0,true,"Kill",true] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_grp = createGroup _sideX;
_typeX = if (_sideX == Occupants) then {NATOOfficer} else {CSATOfficer};
_official = [_grp, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
_typeX = if (_sideX == Occupants) then {
	(NATOGrunt call SCRT_fnc_unit_selectInfantryTier)
} else {
	(CSATGrunt call SCRT_fnc_unit_selectInfantryTier)
};
_pilot = [_grp, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
if (_difficultX) then
	{
	for "_i" from 1 to 4 do
		{
		_pilot = [_grp, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		};
	};

_grp selectLeader _official;
sleep 1;
_nul = [leader _grp, _markerX, "SAFE", "SPAWNED", "NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";

{_nul = [_x,""] call A3A_fnc_NATOinit; _x allowFleeing 0} forEach units _grp;

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (not alive _official)};

if (not alive _official) then {
	[_taskId, "AS", "SUCCEEDED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[0,600] remoteExec ["A3A_fnc_resourcesFIA",2];
		[2400, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{ [45,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		[_markerX,60] call A3A_fnc_addTimeForIdle;
	}
	else {
		[0,300] remoteExec ["A3A_fnc_resourcesFIA",2];
		[1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{ [30,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		[_markerX,30] call A3A_fnc_addTimeForIdle;
	};
	["TaskFailed", ["", format ["Officer killed at %1",[_nameDest, false] call A3A_fnc_location]]] remoteExec ["BIS_fnc_showNotification",_sideX];
}
else {
	[_taskId, "AS", "FAILED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[-1200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_playerScoreAdd;
		[_markerX,-60] call A3A_fnc_addTimeForIdle;
	}
	else {
		[-600, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		[_markerX,-30] call A3A_fnc_addTimeForIdle;
	};
};

{deleteVehicle _x} forEach units _grp;
deleteGroup _grp;

[_taskId, "AS", 1200] spawn A3A_fnc_taskDelete;
