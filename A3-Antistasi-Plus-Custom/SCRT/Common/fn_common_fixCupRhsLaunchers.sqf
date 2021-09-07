if (!A3A_hasRhs && !A3A_hasCup) exitWith {};

private _fileName = "common_fixCupRhsLaunchers";

//looks like this is needed to grab weapons from arsenal
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private _brokenLaunchers = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON) select {
    private _weaponClass = toLower (_x select 0);
    "_loaded" in _weaponClass || {"_used" in _weaponClass}
};

[2, format ["Broken launchers to remove: %1", str _brokenLaunchers], _fileName, true] call A3A_fnc_log;

{
    private _item = _x select 0;
    private _arsenalTab = [_item] call jn_fnc_arsenal_itemType;
    [_arsenalTab, _item, -1] call jn_fnc_arsenal_removeItem;
} forEach _brokenLaunchers;

[2, "Broken launchers clearance pass finished.", _fileName, true] call A3A_fnc_log;