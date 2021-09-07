private _filename = "fn_cleanserVeh";
params ["_veh"];

private _vehpos = getpos _veh;
private _nearestMarker  = ([markersX, _vehpos] call BIS_fnc_nearestPosition);

sleep 5;

if (isNull _veh) exitWith {
	[3, format ["%1 is null on spawn", typeof _veh], _filename] call A3A_fnc_log;
};

if (!alive _veh) then
{
	[3, format ["%1 destroyed on spawn at %2, near %3", typeof _veh, _vehpos, _nearestMarker], _filename] call A3A_fnc_log;
	_veh hideObjectGlobal true;
	deleteVehicle _veh;
};
