params ["_typeX", "_position"];

private _moneyCost = minefieldCost select 0;
private _hrCost = minefieldCost select 1;
private _quantity = minefieldCost select 2;
private _mine = minefieldCost select 3;

if (_typeX == "delete") then {
	_moneyCost = _moneyCost - (server getVariable SDKExp);
	_hrCost = 1;
};

[-_hrCost,-_moneyCost] remoteExec ["A3A_fnc_resourcesFIA",2];

if (_typeX == "delete") exitWith {
	closeDialog 0;
	closeDialog 0;
	["Minefields", "An Explosive Specialist is available on your High Command bar.<br/><br/>Send him anywhere on the map to deactivate mines. He will load his truck with mines he found.<br/><br/>Upon returning back to HQ he will unload mines stored in his vehicle."] call A3A_fnc_customHint;
	[[],"A3A_fnc_mineSweep"] remoteExec ["A3A_fnc_scheduler",2];
};

private _quantityMax = 40;
if (_typeX == "ATMine") then {
	_quantityMax = 20;
};

if (_quantity > _quantityMax) then {
	_quantity = _quantityMax;
};

[[_typeX,_position,_quantity,_mine],"A3A_fnc_buildMinefield"] remoteExec ["A3A_fnc_scheduler",2];

closeDialog 0;
closeDialog 0;