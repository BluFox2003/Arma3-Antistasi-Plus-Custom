params ["_displayId"];

disableSerialization;

private _display = findDisplay _displayId;

if (str (_display) == "no display") exitWith {};

private _controlIds = [_displayId] call SCRT_fnc_ui_getMarketLookup;
private _textBoxId = _controlIds select 0;
private _comboboxId = _controlIds select 1;

private _costTextBox = _display displayCtrl _textBoxId;
private _comboBox = _display displayCtrl _comboboxId;
private _index = lbCurSel _comboBox;
private _vehicleClass = _comboBox lbData _index;

private _price = [_vehicleClass] call A3A_fnc_vehiclePrice;

if(_displayId == 90000) then {
    private _vehicleTypeComboBox = _display displayCtrl 1015;
    private _vehicleTypeIndex = lbCurSel _vehicleTypeComboBox;
    private _vehicleType = _vehicleTypeComboBox lbData _vehicleTypeIndex;

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
};

private _costLocalized = localize "STR_antistasi_dialogs_price";
_costTextBox ctrlSetText format ["%1: %2€", _costLocalized, _price];