private _fileName = "trader_removeUnlockedWeaponsFromStock";

private _trader = if (!isNil "traderX") then {
    traderX
} else { 
    nil 
};

if (isNil "_trader") exitWith {
    [3, "Trader is not spawned yet.", _fileName] call A3A_fnc_log;
};

private _stocks = _trader getVariable ["HALs_store_trader_stocks", []];

if (_stocks isEqualTo []) exitWith {
    [3, "Trader has empty stock.", _fileName, true] call A3A_fnc_log;
};

//looks like this is needed to grab weapons from arsenal
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private _weapons = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HANDGUN) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON)) select {_x select 1 == -1};
private _explosives = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT) select {_x select 1 == -1};
private _magazines = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) select {_x select 1 == -1};
private _backpacks = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BACKPACK) select {_x select 1 == -1};
private _items = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GOGGLES) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_MAP) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GPS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_COMPASS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_WATCH) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMACC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_UNIFORM)) select {_x select 1 == -1};
private _optics = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC) select {_x select 1 == -1};
private _nv = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_NVGS) select {_x select 1 == -1};
private _helmets = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR) select {_x select 1 == -1};
private _vests = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_VEST) select {_x select 1 == -1};

{
    private _item = toLower (_x select 0);
    private _stockIndex = _stocks find _item;

    if (_stockIndex != -1) then {
        _stocks deleteAt _stockIndex; //item
        _stocks deleteAt (_stockIndex + 1); //quantity
    };
} forEach _weapons + _explosives + _magazines + _backpacks + _items + _optics + _nv + _helmets + _vests;

//saving all changes
_trader setVariable ["HALs_store_trader_stocks", _stocks, true];
private _players = allPlayers select {(_x getVariable ["HALs_store_trader_current", objNull]) isEqualTo _trader} apply {owner _x};
[] remoteExecCall ["HALs_store_fnc_update", _players, false];

[3, "Stock clearance pass finished.", _fileName, true] call A3A_fnc_log;