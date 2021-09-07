params ["_side", "_type"];

if (isNil "_side" || {isNil "_type"}) exitWith {
    [1, "Side or type  was not specified, aborting.", "fn_unit_getGroupSet"] call A3A_fnc_log;
};

private _return = nil;

if (_type == "SQUAD") then {
    switch (true) do {
        case (tierWar < 5): {
            if (_side == Occupants) then {
                _return = groupsNATOSquadT1;
            } else {
                 _return = groupsCSATSquadT1;
            };
        };
        case (tierWar < 8 && {tierWar > 4}): {
            if (_side == Occupants) then {
                _return = groupsNATOSquadT2;
            } else {
                 _return = groupsCSATSquadT2;
            };
        };
        case (tierWar > 7): {
            if (_side == Occupants) then {
                _return = groupsNATOSquadT3;
            } else {
                 _return = groupsCSATSquadT3;
            };
        };
    };
} else {
    private _medium = nil;
    private _aa = nil;
    private _at = nil;

    private _index = nil;
    switch (true) do {
        case (tierWar < 5): {
            _index = 0;
        };
        case (tierWar < 8 && {tierWar > 4}): {
            _index = 1;
        };
        case (tierWar > 7): {
            _index = 2;
        };
    };

    if (_side == Occupants) then {
        _medium = (groupsNATOmid select 0) select _index;
        _aa = (groupsNATOmid select 1) select _index;
        _at = (groupsNATOmid select 2) select _index;
    } else {
        _medium = (groupsCSATmid select 0) select _index;
        _aa = (groupsCSATmid select 1) select _index;
        _at = (groupsCSATmid select 2) select _index;
    };

    _return = [_medium, _aa, _at];
};

_return