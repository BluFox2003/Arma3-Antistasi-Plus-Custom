disableSerialization;

createDialog "buyVehicleMenu";

private _display = findDisplay 110000;

if (str (_display) == "no display") exitWith {};

private _comboBox = _display displayCtrl 715;

_comboBox lbAdd (localize "STR_antistasi_dialogs_vehicle_purchase_civie_text");
_comboBox lbSetData [0, "CIV"];

_comboBox lbAdd (localize "STR_antistasi_dialogs_vehicle_purchase_military_text");
_comboBox lbSetData [1, "MIL"];

if (A3A_hasCup && {tierWar > 2}) then {
    _comboBox lbAdd (localize "STR_trader_technicals_title");
    _comboBox lbSetData [2, "TECH"];
};

_comboBox lbSetCurSel 0;