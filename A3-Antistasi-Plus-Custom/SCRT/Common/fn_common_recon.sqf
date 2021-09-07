params ["_position", "_radius", "_revealTime", ["_isInterrogation", false]];

private _affectedEntities = ["Car","Truck","CAManBase", "StaticWeapon"];
private _timeOut = time + _revealTime;

private _enemyUnits = (nearestObjects [_position, _affectedEntities, _radius, true]) select { alive _x && {side _x == Occupants || {side _x == Invaders}}};
private _markers = [];

private _revealText = nil;

if (!isNil "_enemyUnits" && {count _enemyUnits > 0}) then {
    {
        private _entityPosition = position _x;
        _entityPosition = [(_entityPosition select 0) + random 10, (_entityPosition select 1) + random 10, _entityPosition select 2];
        private _revealMarker = createMarker [format ["%1revealedEntity%2", random 10000, random 10000], _entityPosition];
        _revealMarker setMarkerShape "ELLIPSE";
        _revealMarker setMarkerAlpha 0.9;
        _revealMarker setMarkerSize [10, 10];
        _revealMarker setMarkerColor "ColorRed";

        _markers pushBack _revealMarker;
    } forEach _enemyUnits;

    private _friendlyUnits = allUnits select {
        side (group _x) == teamPlayer && {_x distance2D _position < 500 && {[_x] call A3A_fnc_canFight}} 
    };

    {
        private _friendlyUnit = _x;
        {
            private _enemyUnit = _x;
            _friendlyUnit reveal [_enemyUnit, 2.5];
        } forEach _enemyUnits;
    } forEach _friendlyUnits;

    if (_isInterrogation) then {
        _revealText = format ["<t size='0.6'><t size='0.6' color='#988df7'>Interrogated combatant</t> shares approximate enemy positions.</t>"];
    } else {
        _revealText = format ["<t size='0.6'><t size='0.6' color='#D96600'>Reconnaissance</t> shares approximate enemy positions with rebel ground forces.</t>"];
    };
} else {
    if (_isInterrogation) then {
        _revealText = format ["<t size='0.6'><t size='0.6' color='#988df7'>Interrogated combatant</t> does not know anything.</t>"];
    } else {
        _revealText = format ["<t size='0.6'><t size='0.6' color='#D96600'>Reconnaissance</t> has not detected any enemy activity.</t>"];
    };
};

{
    [petros, "support", _revealText] remoteExec ["A3A_fnc_commsMP", _x];
} forEach ([500, _position, teamPlayer] call SCRT_fnc_common_getNearPlayers);

waitUntil {sleep 1; time > _timeOut};

{
    deleteMarker _x;
} forEach _markers;