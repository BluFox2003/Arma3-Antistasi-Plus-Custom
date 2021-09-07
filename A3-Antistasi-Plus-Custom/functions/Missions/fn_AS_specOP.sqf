//Mission: Assassinate a SpecOp team
if (!isServer and hasInterface) exitWith{};

_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_positionX = getMarkerPos _markerX;
_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
_timeLimit = if (_difficultX) then {60 * settingsTimeMultiplier} else {120 * settingsTimeMultiplier};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;
_naming = if (_sideX == Occupants) then {"NATO"} else {"CSAT"};
private _taskString = format ["We have spotted a %3 SpecOp team patrolling around a %1. Ambush them and we will have one less problem. Do this before %2. Be careful, they are tough boys.",_nameDest,_displayTime];
private _taskId = "AS" + str A3A_taskCount;


_specOps = if(_sideX == Occupants) then { NATOSpecOp } else { CSATSpecOp };
_groupX = [_positionX, _sideX, _specOps] call A3A_fnc_spawnGroup;
_nul = [leader _groupX, _markerX, "SAFE","SPAWNED","RANDOM","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";
[2, format ["SpecOps Group Array: %1, Group: %2", str _specOps, str _groupX], "fn_AS_specOP"] call A3A_fnc_log;


[[teamPlayer,civilian],_taskId,[_taskString,"SpecOps",_markerX],_positionX,false,0,true,"Kill",true] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
waitUntil  {
	sleep 5;
	_aliveCount = {alive _x} count units _groupX;
	[2, format ["SpecOps Group Alive: %1", str _aliveCount], "fn_AS_specOP"] call A3A_fnc_log;
	(dateToNumber date > _dateLimitNum) or (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) or (_aliveCount == 0)
};

if (dateToNumber date > _dateLimitNum) then
	{
	[_taskId, "AS", "FAILED"] call A3A_fnc_taskSetState;
	if (_difficultX) then
		{
		[10,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-1200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		[5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-600, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	}
else
	{
	[_taskId, "AS", "SUCCEEDED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[0,400] remoteExec ["A3A_fnc_resourcesFIA",2];
		[0,10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[1200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{ [35,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
		[20,theBoss] call A3A_fnc_playerScoreAdd;
	}
	else {
		[0,200] remoteExec ["A3A_fnc_resourcesFIA",2];
		[0,5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[600, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{ [20,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
		[10,theBoss] call A3A_fnc_playerScoreAdd;
	};

	[_sideX, 10, 60] remoteExec ["A3A_fnc_addAggression", 2];
	["TaskFailed", ["", format ["SpecOp Team decimated at a %1",_nameDest]]] remoteExec ["BIS_fnc_showNotification",_sideX];
};

[_taskId, "AS", 1200] spawn A3A_fnc_taskDelete;
