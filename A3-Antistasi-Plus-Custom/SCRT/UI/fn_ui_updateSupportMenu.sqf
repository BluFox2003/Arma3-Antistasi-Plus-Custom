disableSerialization;

private _display = findDisplay 60000;
if (str (_display) != "no display") then {
    private _supportControl = _display displayCtrl 1702;
	_supportControl ctrlSetText format ["Available Support: %1", supportPoints];

    if (supportPoints < 1) then {
        _supportControl ctrlSetTextColor [1, 0, 0, 1];
    };

    private _airstrikesControl = _display displayCtrl 1703;
	_airstrikesControl ctrlSetText format ["Available Airstrikes: %1", (floor bombRuns)];

    if (bombRuns < 1) then {
        _airstrikesControl ctrlSetTextColor [1, 0, 0, 1];
    };

    private _airportsControl = _display displayCtrl 1704;
    private _airports = { sidesX getVariable [_x, sideUnknown] == teamPlayer } count airportsX;
	_airportsControl ctrlSetText format ["Captured Airports: %1", _airports];

    if (_airports < 1) then {
        _airportsControl ctrlSetTextColor [1, 0, 0, 1];
    };
};