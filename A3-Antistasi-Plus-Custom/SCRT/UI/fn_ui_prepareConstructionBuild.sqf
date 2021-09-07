disableSerialization;

private _display = findDisplay 80000;

if (str (_display) == "no display") exitWith {};

private _comboBox = _display displayCtrl 505;
private _index = lbCurSel _comboBox;
private _constructionType = _comboBox lbData _index;

//closing both Y menu and constructionMenu
closeDialog 0;
closeDialog 0;
[_constructionType] call SCRT_fnc_build_prepareAndStartConstruction;