private _fileName = "fn_unit_selectInfantryTier";

private _infantry = _this;

switch (true) do {
    case (tierWar < 5):
    {
        _infantry select 0
    };
    case (tierWar < 8 && {tierWar > 4}):
    {
        _infantry select 1
    };
    case (tierWar > 7):
    {
        _infantry select 2
    };
    default {
        [1, "Something went wrong.", _fileName] call A3A_fnc_log;
    }
};