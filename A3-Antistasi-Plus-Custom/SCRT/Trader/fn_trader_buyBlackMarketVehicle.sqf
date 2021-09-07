private _fileName = "trader_buyBlackMarketVehicle";

if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {
    ["Vehicle Market", "Unable to buy vehicle, you are already placing something."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (player != player getVariable ["owner",player]) exitWith {
    ["Vehicle Market", "You cannot buy vehicles while you are controlling AI."] call SCRT_fnc_misc_showDeniedActionHint;
};

private _airports = { sidesX getVariable [_x, sideUnknown] == teamPlayer } count airportsX;
private _display = findDisplay 90000;
if (str (_display) == "no display") exitWith {};

private _comboBox = _display displayCtrl 1005;
private _index = lbCurSel _comboBox;
private _vehicleClass = _comboBox lbData _index;

private _vehicleTypeComboBox = _display displayCtrl 1015;
private _index = lbCurSel _vehicleTypeComboBox;
private _vehicleType = _vehicleTypeComboBox lbData _index;

closeDialog 0;

if((_vehicleClass isKindOf "Plane" || {_vehicleClass isKindOf "Helicopter"}) && {_airports < 1}) exitWith {
    ["Vehicle Market", "You cannot buy helicopters or planes without captured airports."] call SCRT_fnc_misc_showDeniedActionHint;
};

private _price = [_vehicleClass] call A3A_fnc_vehiclePrice;
private _shopLookupArrayIndex = nil;

switch(_vehicleType) do {
    case("AA"): {
        _shopLookupArrayIndex = shop_AA find _vehicleClass;
    };
    case("MRAP"): {
        _shopLookupArrayIndex = shop_MRAP find _vehicleClass;
    };
    case("WHEELED_APC"): {
        _shopLookupArrayIndex = shop_track_apc find _vehicleClass;
    };
    case("TRACKED_APC"): {
        _shopLookupArrayIndex = shop_track_apc find _vehicleClass;
    };
    case("HELI"): {
        _shopLookupArrayIndex = shop_heli find _vehicleClass;
    };
    case("TANK"): {
        _shopLookupArrayIndex = shop_tank find _vehicleClass;
    };
    case("PLANE"): {
        _shopLookupArrayIndex = shop_plane find _vehicleClass;
    };
    case ("LUV"): {
        _shopLookupArrayIndex = additionalShopLight find _vehicleClass;
    };
    case ("ATGM"): {
        _shopLookupArrayIndex = additionalShopAtgmVehicles find _vehicleClass;
    };
    case ("MANPADS"): {
        _shopLookupArrayIndex = additionalShopManpadsVehicles find _vehicleClass;
    };
    case ("ARTILLERY"): {
        _shopLookupArrayIndex = additionalShopArtillery find _vehicleClass;
    };
    default { 
        [1, format ["Bad Vehicle Type - %1 ", _vehicleType], _fileName] call A3A_fnc_log;
    };
};

if (!isNil "_shopLookupArrayIndex" && {_shopLookupArrayIndex != -1}) then {
    switch (true) do {
        case(_shopLookupArrayIndex == 0 && {tierWar > 6}): {
            _price = _price * 0.7;
        };
        case(_shopLookupArrayIndex == 0 && {tierWar > 4}): {
           _price = _price * 0.85;
        };
        case(_shopLookupArrayIndex == 1 && {tierWar > 6}): {
            _price = _price * 0.75;
        };
    };
};

vehiclePurchase_cost = round _price;

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
    ["Vehicle Market", format ["You do not have enough money for this vehicle: %1 € required",vehiclePurchase_cost]] call SCRT_fnc_misc_showDeniedActionHint;
};

private _extraMessage = format  ["Price: %1€<br/>", vehiclePurchase_cost];

[["UpdateState", "Buys vehicle at black market"]] call SCRT_fnc_misc_updateRichPresence;

[_vehicleClass, "BUYVEHICLEMARKET", _extraMessage] call A3A_fnc_vehPlacementBegin;