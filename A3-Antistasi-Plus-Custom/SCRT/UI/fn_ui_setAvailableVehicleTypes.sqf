disableSerialization;

private _display = findDisplay 90000;

if (str (_display) == "no display") exitWith {};

private _vehicleTypeComboBox = _display displayCtrl 1015;
private _index = lbCurSel _vehicleTypeComboBox;
private _vehicleType = _vehicleTypeComboBox lbData _index;
private _shopLookupArray = nil;

switch(_vehicleType) do {
    case("UAV"): {
        _shopLookupArray = shop_UAV;
    };
    case("AA"): {
        _shopLookupArray = shop_AA;
    };
    case("MRAP"): {
        _shopLookupArray = shop_MRAP;
    };
    case("WHEELED_APC"): {
        _shopLookupArray = shop_wheel_apc;
    };
    case("TRACKED_APC"): {
        _shopLookupArray = shop_track_apc;
    };
    case("HELI"): {
        _shopLookupArray = shop_heli;
    };
    case("TANK"): {
        _shopLookupArray = shop_tank;
    };
    case("PLANE"): {
        _shopLookupArray = shop_plane;
    };
    case ("LUV"): {
        _shopLookupArray = additionalShopLight;
    };
    case ("ATGM"): {
        _shopLookupArray = additionalShopAtgmVehicles;
    };
    case ("MANPADS"): {
        _shopLookupArray = additionalShopManpadsVehicles;
    };
    case ("ARTILLERY"): {
        _shopLookupArray = additionalShopArtillery;
    };
    default { 
        [1, format ["Bad Vehicle Type - %1 ", _vehicleType], "fn_ui_setAvailableVehicleTypes"] call A3A_fnc_log;
    };
};

if (isNil "_shopLookupArray") exitWith {
    [1, "Fatal Error - no lookup array for vehicle store, aborting.", "fn_ui_setAvailableVehicleTypes"] call A3A_fnc_log;
};


private _vehicleComboBox = _display displayCtrl 1005;
lbClear _vehicleComboBox;

private _fillCombo = {
    params ["_shopArray", "_comboBox"];

    {
        if (_forEachIndex > 0 && {tierWar < 5}) exitWith {};
        if (_forEachIndex > 1 && {tierWar < 7}) exitWith {};
        private _name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
        _comboBox lbAdd _name;
        _comboBox lbSetData [_forEachIndex, _x];
    } forEach _shopArray;
};

[_shopLookupArray, _vehicleComboBox] call _fillCombo;

_vehicleComboBox lbSetCurSel 0;