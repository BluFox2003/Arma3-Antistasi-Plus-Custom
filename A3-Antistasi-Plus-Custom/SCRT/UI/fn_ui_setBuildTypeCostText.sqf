disableSerialization;

private _display = findDisplay 80000;

if (str (_display) == "no display") exitWith {};

private _costLocalized = localize "STR_antistasi_dialogs_price";

private _costTextBox = _display displayCtrl 510;
private _comboBox = _display displayCtrl 505;
private _index = lbCurSel _comboBox;
private _buildType = _comboBox lbData _index;

switch (_buildType) do {
    case ("TRENCH"): {
        _costTextBox ctrlSetText format ["%1: 50€", _costLocalized];
    };
    case ("OBSTACLE"): {
        _costTextBox ctrlSetText format ["%1: 50€", _costLocalized];
    };
    case ("SANDBAG_BUNKER"): {
        _costTextBox ctrlSetText format ["%1: 250€", _costLocalized];
    };
    case ("CONCRETE_BUNKER"): {
        _costTextBox ctrlSetText format ["%1: 500€", _costLocalized];
    };
    case ("MISC"): {
        _costTextBox ctrlSetText format ["%1: 10€", _costLocalized];
    };
    default {
        [2,"Bad build type.", "fn_setBuildTypeCostText"] call A3A_fnc_log;
    };
};