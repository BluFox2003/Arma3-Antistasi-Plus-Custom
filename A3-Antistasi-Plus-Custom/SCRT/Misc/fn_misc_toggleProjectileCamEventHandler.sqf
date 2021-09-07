params ["_mode"];

if (_mode == "ADD") then {
    if (isNil "projectileCamEhIndex") then {
        projectileCamEhIndex = player addEventHandler ["FiredMan", SCRT_fnc_misc_projectileCamera];
    };
} else {
    if (!isNil "projectileCamEhIndex") then {
        player removeEventHandler ["FiredMan", projectileCamEhIndex];
        projectileCamEhIndex = nil;
    };
};