private ["_hr","_resourcesFIA","_typeX","_costs","_markerX","_garrison","_positionX","_unit","_groupX","_veh","_pos"];

_hr = server getVariable "hr";

if (_hr < 1) exitWith {
	["Garrison", "You lack of HR to make a new recruitment.", "FAIL"] call SCRT_fnc_ui_showDynamicTextMessage;
};

_resourcesFIA = server getVariable "resourcesFIA";

_typeX = _this select 0;

private _costs = server getVariable _typeX;

if (_costs > _resourcesFIA) exitWith {
	["Garrison",  format ["You do not have enough money for this kind of unit (%1 € needed).", _costs], "FAIL"] call SCRT_fnc_ui_showDynamicTextMessage;
};

_markerX = positionXGarr;

if (_typeX == staticCrewTeamPlayer && _markerX in (watchpostsFIA + roadblocksFIA + aapostsFIA + atpostsFIA + mortarpostsFIA + hmgpostsFIA)) exitWith {
	["Garrison", "You cannot add mortars to a Roadblock, Watchpost, AA, AT, Mortar, HMG emplacement garrisons.", "FAIL"] call SCRT_fnc_ui_showDynamicTextMessage;
};

_positionX = getMarkerPos _markerX;

if (surfaceIsWater _positionX) exitWith {
	["Garrison", "This Garrison is still updating, please try again in a few seconds.", "FAIL"] call SCRT_fnc_ui_showDynamicTextMessage;
};

if ([_positionX, 500] call A3A_fnc_enemyNearCheck) exitWith {
	["Garrison", "You cannot recruit with enemies near the zone.", "FAIL"] call SCRT_fnc_ui_showDynamicTextMessage;
};

private _exit = false;
{
	if (_x == _typeX) then {
		_exit = true;
	};
} forEach [SDKMG, SDKGL, SDKSniper];

if (_exit && {tierWar < 2}) exitWith {
	["Garrison", "You can not recruit this type of unit at war level 1.", "FAIL"] call SCRT_fnc_ui_showDynamicTextMessage;
};

if (_typeX == SDKATman && {tierWar < 4}) exitWith {
	["Garrison", "You can not recruit this type of unit at war level 3 or less.", "FAIL"] call SCRT_fnc_ui_showDynamicTextMessage;
};

if (_typeX == staticCrewTeamPlayer && {tierWar < 5}) exitWith {
	["Garrison", "You can not recruit this type of unit at war level 4 or less.", "FAIL"] call SCRT_fnc_ui_showDynamicTextMessage;
};

[-1,-_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

_countX = count (garrison getVariable [_markerX,[]]);
[_typeX,teamPlayer,_markerX,1] remoteExec ["A3A_fnc_garrisonUpdate",2];
waitUntil {(_countX < count (garrison getVariable [_markerX, []])) or (sidesX getVariable [_markerX,sideUnknown] != teamPlayer)};

if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then {
	private _garrisonInfo = format ["Soldier has been recruited.%1", [_markerX] call A3A_fnc_garrisonInfo];
	["Garrison", _garrisonInfo] call SCRT_fnc_ui_showDynamicTextMessage;

	if (spawner getVariable _markerX != 2) then {
		[_markerX,_typeX] remoteExec ["A3A_fnc_createSDKGarrisonsTemp",2];
	};
};
