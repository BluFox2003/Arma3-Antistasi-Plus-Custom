private _positionOrigin = getMarkerPos supportMarkerOrigin;
private _flareCount = round random [4,5,7];

if(!isNil "petros" && {alive petros}) then {
    petros sideChat "Starting flare barrage. ETA 30 seconds.";
};

private _timeOut = time + 30;
waitUntil {sleep 1; time > _timeOut };

private _text = format ["<t size='0.6'>Rebel mortar sends some <t size='0.6' color='#808080'>flares</t> to illuminate the battlefield near your position.</t>"];

{
    [petros, "support", _text] remoteExec ["A3A_fnc_commsMP", _x];
} forEach ([1000, _positionOrigin, teamPlayer] call SCRT_fnc_common_getNearPlayers);

for "_i" from 1 to _flareCount do {
    private _flareModel = selectRandom flaresPool;
    private _randomizedPosition = [(_positionOrigin select 0) + random 50, (_positionOrigin select 1) + random 50, 150];

    private _flare = _flareModel createVehicle _randomizedPosition;
    _flare setVelocity [-10 + random 20, -10 + random 20, -5];

    sleep 2;
    
    playSound3D [(selectRandom flareSounds), _flare, false,  getPosASL _flare, 1.5, 1, 450, 0];

    sleep 5;
};

isSupportMarkerPlacingLocked = false;
publicVariable "isSupportMarkerPlacingLocked";