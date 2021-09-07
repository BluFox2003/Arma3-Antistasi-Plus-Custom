if (!isServer and hasInterface) exitWith {};

private _markerX = _this select 0;
private _positionX = getMarkerPos _markerX;

private _radiusX = 1;
private _garrison = garrison getVariable [_markerX, []];
private _veh = objNull;
private _road = objNull;


if (isNil "_garrison") then {//this is for backward compatibility, remove after v12
    _garrison = [SDKMil] + groupsSDKSquad;
    garrison setVariable [_markerX,_garrison,true];
};

while {true} do {
    _road = _positionX nearRoads _radiusX;
    if (count _road > 0) exitWith {};
    _radiusX = _radiusX + 5;
};

private _roadcon = roadsConnectedto (_road select 0);
private _dirveh = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_DirTo} else {random 360};
private _roadPosition = getPos (_road select 0);

private _barricadePosition = if(count _roadcon > 0) then { getPos (_roadcon select 0); } else {[(_roadPosition select 0) - 2, (_roadPosition select 1) + 2, 0]};
private _barricade = "Land_Barricade_01_10m_F" createVehicle _barricadePosition;
_barricade setDir _dirveh;
_barricade setVectorUp surfaceNormal position _barricade;

if (SDKMil in _garrison) then {
    _veh = vehSDKLightArmed createVehicle getPos (_road select 0);
    _veh setDir _dirveh + 90;
    _veh lock 3;
    [_veh, teamPlayer] call A3A_fnc_AIVEHinit;
};

_groupX = [_positionX, teamPlayer, _garrison,true,false] call A3A_fnc_spawnGroup;
private _groupXUnits = units _groupX;

{
    [_x,_markerX] spawn A3A_fnc_FIAinitBases; 
} forEach _groupXUnits;

private _crewManIndex = _groupXUnits findIf {(_x getVariable "unitType") == "loadouts_reb_militia_Rifleman"};
if (_crewManIndex != -1) then {
    private _crewMan = _groupXUnits select _crewManIndex;
    _crewMan moveInGunner _veh;
    sleep 1;
    _crewMan lookAt (_crewMan getRelPos [100, _dirveh]);
};



waitUntil {
	sleep 1; 
	((spawner getVariable _markerX == 2)) or 
	({alive _x} count units _groupX == 0) or (!(_markerX in roadblocksFIA))
};

if ({alive _x} count units _groupX == 0) then {
	roadblocksFIA = roadblocksFIA - [_markerX]; publicVariable "roadblocksFIA";
	markersX = markersX - [_markerX]; publicVariable "markersX";
	sidesX setVariable [_markerX,nil,true];
	_nul = [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	deleteMarker _markerX;
	["TaskFailed", ["", "Roadblock Lost"]] remoteExec ["BIS_fnc_showNotification", 0];
};

waitUntil {sleep 1; (spawner getVariable _markerX == 2) or (!(_markerX in roadblocksFIA))};

deleteVehicle _barricade;

if (!isNull _veh) then { 
    deleteVehicle _veh;
};

{ 
    deleteVehicle _x 
} forEach units _groupX;
deleteGroup _groupX;