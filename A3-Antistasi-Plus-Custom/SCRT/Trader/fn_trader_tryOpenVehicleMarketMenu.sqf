private _message = nil;
private _outposts = if (count seaports > 0) then {
    _message = "Rebels need to control at least one seaport to access the black market.";
    { sidesX getVariable [_x, sideUnknown] == teamPlayer } count seaports
} else {
    _message = "Rebels need to control at least one resource to access the black market.";
    { sidesX getVariable [_x, sideUnknown] == teamPlayer } count resourcesX //some maps may not have any seaports, so this will allow to use vehicle black market on such maps
};

if(_outposts < 1) exitWith {
    ["Black Market Is Not Available", _message] call SCRT_fnc_misc_showDeniedActionHint;
};

[] call SCRT_fnc_ui_createVehicleBlackMarketMenu;