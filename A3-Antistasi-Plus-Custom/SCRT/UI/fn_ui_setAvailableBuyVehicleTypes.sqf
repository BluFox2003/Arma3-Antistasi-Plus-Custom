disableSerialization;

private _display = findDisplay 110000;

if (str (_display) == "no display") exitWith {};

private _vehicleTypeComboBox = _display displayCtrl 715;
private _index = lbCurSel _vehicleTypeComboBox;
private _vehicleType = _vehicleTypeComboBox lbData _index;
private _shopLookupArray = [];

switch(_vehicleType) do {
    case("CIV"): {
        _shopLookupArray = [civCar, civTruck, civHeli, civBoat];
    };
    case("MIL"): {
        _shopLookupArray = [vehSDKBike, vehSDKTruck, vehSDKLightUnarmed];
        if (tierWar > 2) then {
            _shopLookupArray append [vehSDKLightArmed, SDKMGStatic];
        };

        if (tierWar > 3) then {
            _shopLookupArray append [vehSDKAT, staticATteamPlayer, staticAAteamPlayer];
            if (A3A_hasCup || A3A_hasRhs || A3A_has3CBFactions) then {
                _shopLookupArray pushBack vehSDKAA;
            };
        };

        if (tierWar > 4) then {
            _shopLookupArray pushBack SDKMortar;
        };

        if ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count resourcesX > 4) then {
            _shopLookupArray pushBack vehSDKFuel;
        };

        if ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count factories > 4) then {
            _shopLookupArray pushBack vehSDKRepair;
        };

        if ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX > 0) then {
            _shopLookupArray pushBack vehSDKPlane;
        };
    };
    case("TECH"): {
        if (tierWar > 2) then {
            _shopLookupArray pushBack vehSDKLightUnarmedArmored;
        };

        if (tierWar > 4) then {
            _shopLookupArray append [technicalArmoredBtr, technicalArmoredAa, technicalArmoredSpg, technicalArmoredMg];
        };
    };
    default { 
        [1, format ["Bad Vehicle Type - %1 ", _vehicleType], "fn_ui_setAvailableBuyVehicleTypes"] call A3A_fnc_log;
    };
};

if (isNil "_shopLookupArray") exitWith {
    [1, "Fatal Error - no lookup array for vehicle store, aborting.", "fn_ui_setAvailableBuyVehicleTypes"] call A3A_fnc_log;
};


private _vehicleComboBox = _display displayCtrl 705;
lbClear _vehicleComboBox;

private _fillCombo = {
    params ["_shopArray", "_comboBox"];

    {
        private _name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
        _comboBox lbAdd _name;
        _comboBox lbSetData [_forEachIndex, _x];
    } forEach _shopArray;
};

[_shopLookupArray, _vehicleComboBox] call _fillCombo;

_vehicleComboBox lbSetCurSel 0;