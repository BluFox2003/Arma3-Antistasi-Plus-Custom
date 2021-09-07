params ["_typeX"];

private _costs = server getVariable _typeX;

if (isNil "_costs") then {
	diag_log format ["%1: [Antistasi] | ERROR | vehiclePrice.sqf | Invalid vehicle price :%2.",servertime,_typeX];
	_costs = 0;
} else {
	private _multiplier = if (count seaports > 0) then {
		{sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports;
	} else {
		{sidesX getVariable [_x,sideUnknown] == teamPlayer} count resourcesX;
	};
	_costs = round (_costs - (_costs * (0.1 * _multiplier)));
};

_costs