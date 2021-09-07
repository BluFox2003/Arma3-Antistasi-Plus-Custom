createDialog 'rebelLoadoutMenu';

private _addLoadoutMark = {
    params ["_control"];
    private _oldText = ctrlText _control;
    _control ctrlSetText format ["%1 %2", _oldText, "[x]"];
};

private _display = findDisplay 120000;

if (str (_display) != "no display") then {
    if ("loadouts_reb_militia_Rifleman" in rebelLoadouts) then {
        [(_display displayCtrl 120001)] call _addLoadoutMark;
    };

    if ("loadouts_reb_militia_MachineGunner" in rebelLoadouts) then {
        [(_display displayCtrl 120002)] call _addLoadoutMark;
    };

    if ("loadouts_reb_militia_medic" in rebelLoadouts) then {
       [(_display displayCtrl 120003)] call _addLoadoutMark;
    };

    if ("loadouts_reb_militia_Engineer" in rebelLoadouts) then {
        [(_display displayCtrl 120004)] call _addLoadoutMark;
    };

    if ("loadouts_reb_militia_Grenadier" in rebelLoadouts) then {
        [(_display displayCtrl 120005)] call _addLoadoutMark;
    };

    if ("loadouts_reb_militia_sniper" in rebelLoadouts) then {
        [(_display displayCtrl 120006)] call _addLoadoutMark;
    };

    if ("loadouts_reb_militia_lat" in rebelLoadouts) then {
        [(_display displayCtrl 120007)] call _addLoadoutMark;
    };

    if ("loadouts_reb_militia_staticCrew" in rebelLoadouts) then {
        [(_display displayCtrl 120008)] call _addLoadoutMark;
    };

    if ("loadouts_reb_militia_SquadLeader" in rebelLoadouts) then {
        [(_display displayCtrl 120009)] call _addLoadoutMark;
    };
};