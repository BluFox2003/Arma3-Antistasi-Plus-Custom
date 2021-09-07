private _display = findDisplay 110000;
if (str (_display) == "no display") exitWith {};

private _comboBox = _display displayCtrl 705;
private _index = lbCurSel _comboBox;
private _vehicleType = _comboBox lbData _index;
closeDialog 0;

[_vehicleType] spawn A3A_fnc_addFIAveh;