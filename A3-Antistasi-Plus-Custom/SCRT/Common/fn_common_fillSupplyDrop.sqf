#include "\A3\Ui_f\hpp\defineResinclDesign.inc"


private _box = _this;

private _fileName = "fn_common_fillSupplyDrop";

[3,"Supply crate airdrop init.",_fileName, true] call A3A_fnc_log;

["buttonInvToJNA"] call jn_fnc_arsenal;

[3,"Clearing supply crate from predefined content.",_fileName, true] call A3A_fnc_log;

clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;

[3,"Getting players.",_fileName, true] call A3A_fnc_log;

private _players = (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
private _aiUnits = (units theBoss) select { !isPlayer _x };
private _affectedEntities = _players + _aiUnits;

if(count _affectedEntities < 1) exitWith {
    [3,"No players detected, aborting filling crate.",_fileName, true] call A3A_fnc_log;
};

[3,"Getting possible crate ammo.",_fileName, true] call A3A_fnc_log;

private _possibleMagazines = [];
private _unlockedMagazines = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) select {_x select 1 == -1};
private _unlockedThrowables = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) select {_x select 1 == -1};
_unlockedMagazines = _unlockedMagazines apply {_x select 0};
_unlockedThrowables = _unlockedThrowables apply {_x select 0};

[3,"Getting possible magazine with arsenal check.",_fileName, true] call A3A_fnc_log;

{
    private _unit = _x;

    private _primaryMagazines = getArray(configfile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
    if(count _primaryMagazines > 0) then {
        _mag = _primaryMagazines select 0;
        if(_mag in _unlockedMagazines) then {
            _possibleMagazines pushBack _mag;
        };
    };

    private _secondaryMagazines = getArray(configfile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
    if(count _secondaryMagazines > 0) then {
        _mag = _secondaryMagazines select 0;
        if(_mag in _unlockedMagazines) then {
            _possibleMagazines pushBack _mag;
        };
    };

    private _handgunMagazines = getArray(configfile >> "CfgWeapons" >> handgunWeapon _unit >> "magazines");
    if(count _handgunMagazines > 0) then {
        _mag = _handgunMagazines select 0;
        if(_mag in _unlockedMagazines) then {
            _possibleMagazines pushBack _mag;
        };
    };
} forEach _affectedEntities;

[3,"Filling supply crate with ammo, grenades and first aid kits.",_fileName, true] call A3A_fnc_log;

{
    _magCount = round random [4,7,10];
   _box addMagazineCargoGlobal [_x, _magCount];
} forEach _possibleMagazines;

_firstAidCount = round random [6,10,16];
_box addItemCargoGlobal ["FirstAidKit", _firstAidCount];

if(count _unlockedThrowables > 0) then {
    private _randomThrowables = [selectRandom _unlockedThrowables, selectRandom _unlockedThrowables, selectRandom _unlockedThrowables];
    {
        _throwable = _x;
        _throwableCount = round random [4,6,8];
        _box addMagazineCargoGlobal [_throwable, _throwableCount];
    } forEach _randomThrowables;
};

[3,"Supply Drop fill function finished it's work.", _fileName, true] call A3A_fnc_log;