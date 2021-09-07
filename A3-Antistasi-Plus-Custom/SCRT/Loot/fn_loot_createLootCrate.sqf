
private _fileName = "loot_createLootCrate";

vehiclePurchase_cost = round ([lootCrate] call A3A_fnc_vehiclePrice);

private _resourcesFIA = 0;

if (player != theBoss) then {
	_resourcesFIA = player getVariable "moneyX";
} else {
	private _factionMoney = server getVariable "resourcesFIA";
	if (vehiclePurchase_cost <= _factionMoney) then {
		_resourcesFIA = _factionMoney;
	} else {
		_resourcesFIA = player getVariable "moneyX";
	};
};

if (_resourcesFIA < vehiclePurchase_cost) exitWith {
    ["Loot Crate Purchase", format ["You have not enough money to make loot crate. %1 € needed.", vehiclePurchase_cost]] call SCRT_fnc_misc_showDeniedActionHint;
};

private _extraMessage = format  ["Select loot crate position.<br/>Price: %1€<br/>", vehiclePurchase_cost];

[lootCrate, "CREATELOOTCRATE", _extraMessage, "Loot Crate"] call A3A_fnc_vehPlacementBegin;