//TODO: remove A3A_fnc_log calls after testing
params ["_unit", "_enemy"];

private _funcName = "fn_useFlares";
[2, format["%1 decided to use flares.", typeOf _unit], _funcName] call A3A_fnc_log;

// wait a little bit
sleep random 5;

if (time < _unit getVariable ["smokeUsed",time - 1]) exitWith {
	[2, "Smoke/Flare already has been used, exiting function.", _funcName] call A3A_fnc_log;
};
if (vehicle _unit != _unit) exitWith {
	[2, "Unit inside the vehicle, exiting function.", _funcName] call A3A_fnc_log;
};

private _flares = _unit getVariable ["remainingFlares", 2];
if (_flares <= 0) exitWith {};

if (!isNil "_enemy" && {_enemy distance _unit > 450}) exitWith {
	[2, "Enemy's distance is higher than 450m, exiting function.", _funcName] call A3A_fnc_log;
};

_unit setVariable ["smokeUsed", time + 60];
_unit setVariable ["remainingFlares", _flares - 1];

_initialFlarePosition = if !(isNil "_enemy") then { 
	_enemy getPos [random 20,random 360] 
} else { 
	_unit getPos [100,random 360] 
};

_initialFlarePosition set [2,150];

_flareModel = selectRandom flaresPool;

_flare = _flareModel createVehicle _initialFlarePosition;
_flare setVelocity [-10+random 20, -10+random 20, -5];

playSound3D [(selectRandom flareSounds), _unit, false,  getPosASL _unit, 1.5, 1, 450, 0];
