//Mission: Conquer the outpost
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getMarkerPos _markerX;
_timeLimit = if (_difficultX) then {30 * settingsTimeMultiplier} else {90 * settingsTimeMultiplier};//120
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

private _markerSide = sidesX getVariable [_markerX, sideUnknown];

_nameDest = [_markerX] call A3A_fnc_localizar;
_textX = "";
_taskName = "";
if (_markerX in resourcesX) then
	{
	_textX = format ["A %1 would be a fine addition to our cause. Go there and capture it before %2.",_nameDest,_displayTime];
	_taskName = "Resource Acquisition";
	}
else
	{
	_textX = format ["A %1 is disturbing our operations in the area. Go there and capture it before %2.",_nameDest,_displayTime];
	_taskName = "Take the Outpost";
	};

private _taskId = "CON" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_textX,_taskName,_markerX],_positionX,false,0,true,"Target",true] call BIS_fnc_taskCreate;
[_taskId, "CON", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (sidesX getVariable [_markerX,sideUnknown] == teamPlayer)};

if (dateToNumber date > _dateLimitNum) then
	{
	[_taskId, "CON", "FAILED"] call A3A_fnc_taskSetState;
	if (_difficultX) then
		{
		[10,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-1200, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		[5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-600, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	}
else
	{
	sleep 10;
	[_taskId, "CON", "SUCCEEDED"] call A3A_fnc_taskSetState;
	if (_difficultX) then
		{
		[0,400] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-10,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[1200, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		{[45,_x] call A3A_fnc_playerScoreAdd} forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
		[20,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		[0,200] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[600, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		{[25,_x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};

[_taskId, "CON", 1200] spawn A3A_fnc_taskDelete;
