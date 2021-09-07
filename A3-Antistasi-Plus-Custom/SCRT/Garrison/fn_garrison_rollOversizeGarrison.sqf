params ["_side", "_marker"];

private _additionalGroups = [];

private _aggression = if (_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _oversizeChance =  _aggression / 2;
if (_oversizeChance > 20) then {
	_oversizeChance = 20;
};

if ((random 100) < _oversizeChance) then {
    private _squadCount = nil;
    switch (true) do {
        case (_aggression < 50): {
            _squadCount = round (random [1,2,3]);
        };
        case (_aggression > 50): {
            _squadCount = round (random [2,3,4]);
        };
        default {
            _squadCount = round (random [1,2,3]);
        };
    };

    private _squadPool = nil;
    private _mid = [_side, "MID"] call SCRT_fnc_unit_getGroupSet;
    private _squad = [_side, "SQUAD"] call SCRT_fnc_unit_getGroupSet;
    _squadPool = _squad + _mid;

    for "_i" from 1 to _squadCount do {
        _additionalGroups pushBack (selectRandom _squadPool);
    };

    [1, format ["Oversized %1 garrison, number of additional squads: %2", str _marker, str _squadCount], "fn_garrison_rollOversizeGarrison", true] call A3A_fnc_log;
};

_additionalGroups