params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

if !(isProjectileCamEnabled) exitWith {};

private _magnification = 0.75 / (getObjectFOV _unit); //base FOV / current scoped FOV
private _isLauncher = _weapon isKindOf ["Launcher", configFile >> "CfgWeapons"];
private _isRifle = _weapon isKindOf ["Rifle", configFile >> "CfgWeapons"];

if !(_isLauncher || {(_isRifle && _magnification > 10)}) exitWith {};

_this spawn {
    isProjectileLaunched = true;
    isProjectileInterrupted = false;

    private _projectile = _this select 6;

    private _cam = "camera" camCreate (position player);
    _cam cameraEffect ["External", "Back"];

    private _timeOut = time + 5;
    private _lastPosition = nil;

    while {true} do { 
        if (isProjectileInterrupted || {time > _timeOut}) exitWith {
            true;
        };

        private _position = getPos _projectile;

        if (isNull _projectile) exitWith {
            if ((position _cam) isEqualTo [0,0,0] || {_position isEqualTo [0,0,0]}) then {
                _cam camSetTarget _lastPosition;
                _cam camSetRelPos [1,-3,0];
                _cam camCommit 0;
            }; 
            sleep 1.6;
            true;
        };

        if !(_position isEqualTo [0,0,0]) then {
            _lastPosition = _position;
            _cam camSetTarget _projectile;
            _cam camSetRelPos [1,-3,0];
            _cam camSetDir (vectorDir _projectile);
            _cam camCommit 0;
        };
    };

    _cam cameraEffect ["Terminate", "Back"];
    camDestroy _cam;
};