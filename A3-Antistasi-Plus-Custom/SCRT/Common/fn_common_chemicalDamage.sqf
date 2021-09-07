params ["_sourceObject"];

private _affectedEntities = ["Car","Truck","CAManBase","Air", "StaticWeapon"];
private _timeOut = time + 120;

private _affectMan = {
    params ["_man"];

    private _goggles = goggles _man;
    if (!(_goggles in gasMasks)) then {
        private _distMult = (1-((_man distance _sourceObject)/70))/2;
        private _dam = damage _man + _distMult;
        if ((_dam >= 1) && {isPlayer _man}) then {
            _man setDamage 0;
            [_man] spawn A3A_fnc_respawn;
        }
        else {
            _man setDamage _dam;
        };

        [_man] spawn {
            if (random 100 < 35) then {
                _aliveMan = _this select 0;
                sleep random 3;
                playSound3D [(selectRandom coughSounds), _aliveMan];
            };
        };
    };
};

private _damageMarker = createMarkerLocal [format ["%1damage%2", random 10000, random 10000], (position _sourceObject)];
_damageMarker setMarkerShapeLocal "ELLIPSE";
_damageMarker setMarkerSizeLocal [40,75];
_damageMarker setMarkerTypeLocal "hd_warning";
_damageMarker setMarkerAlphaLocal 0;

while {time < _timeOut} do {
    if (_sourceObject inArea _damageMarker) then {
        _damageMarker setMarkerDirLocal windDir;
        private _windPos = (getMarkerPos _damageMarker) vectorAdd wind;
        _damageMarker setMarkerPos _windPos;
    };

    private _units = nearestObjects [_sourceObject, _affectedEntities, 300];
    _units = (_units select {alive _x && !isObjectHidden _x && isDamageAllowed _x  && {(getPos _x) inArea _damageMarker}}) - [petros];

	{
        switch (true) do {
            case (_x isKindOf "CAManBase"): {
                [_x] call _affectMan;
            };

            case ((_x isKindOf "LandVehicle") || {_x isKindOf "StaticWeapon"}): {
                if !(_x isKindOf "Tank") then {
                    private _aliveCrew = (crew _x) select {alive _x};
                    {
                        [_x] call _affectMan;
                    } forEach _aliveCrew;
                };
            };

            case (_x isKindOf "Air"): {
                private _altitude = (position _x) select 2;

                if (_altitude < 20) then {
                    private _aliveCrew = (crew _x) select {alive _x};
                    {
                        [_x] call _affectMan;
                    } forEach _aliveCrew;
                };
            };
        };
	} forEach _units;
	sleep 5;
};

deleteMarkerLocal _damageMarker;