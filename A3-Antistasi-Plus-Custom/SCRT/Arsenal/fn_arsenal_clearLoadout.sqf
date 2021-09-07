private _loadoutKey = _this;

if (isNil "_loadoutKey" || {_loadoutKey == ""}) exitWith {};

private _loadout = rebelLoadouts get _loadoutKey;

private _title = localize "STR_antistasi_dialogs_hq_button_rebel_loadouts_menu_title_text";

if (isNil "_loadout") exitWith {
    [_title, localize "STR_antistasi_dialogs_hq_button_no_custom_loadouts", "WARNING"] call SCRT_fnc_ui_showDynamicTextMessage;
};

rebelLoadouts deleteAt _loadoutKey;
publicVariable "rebelLoadouts";

private _display = findDisplay 120000;

if (str (_display) != "no display") then {
    if !("loadouts_reb_militia_Rifleman" in rebelLoadouts) then {
        (_display displayCtrl 120001) ctrlSetText localize "STR_antistasi_dialogs_rifleman_title";
    };

    if !("loadouts_reb_militia_MachineGunner" in rebelLoadouts) then {
        (_display displayCtrl 120002) ctrlSetText localize "STR_antistasi_dialogs_autorifleman_title";
    };

    if !("loadouts_reb_militia_medic" in rebelLoadouts) then {
        (_display displayCtrl 120003) ctrlSetText localize "STR_antistasi_dialogs_medic_title";
    };

    if !("loadouts_reb_militia_Engineer" in rebelLoadouts) then {
        (_display displayCtrl 120004) ctrlSetText localize "STR_antistasi_dialogs_engineer_title";
    };

    if !("loadouts_reb_militia_Grenadier" in rebelLoadouts) then {
        (_display displayCtrl 120005) ctrlSetText localize "STR_antistasi_dialogs_grenadier_title";
    };

    if !("loadouts_reb_militia_sniper" in rebelLoadouts) then {
        (_display displayCtrl 120006) ctrlSetText localize "STR_antistasi_dialogs_marksman_title";
    };

    if !("loadouts_reb_militia_lat" in rebelLoadouts) then {
        (_display displayCtrl 120007) ctrlSetText localize "STR_antistasi_dialogs_at_title";
    };

    if !("loadouts_reb_militia_staticCrew" in rebelLoadouts) then {
        (_display displayCtrl 120008) ctrlSetText localize "STR_antistasi_dialogs_crewman_title";
    };

    if !("loadouts_reb_militia_SquadLeader" in rebelLoadouts) then {
        (_display displayCtrl 120009) ctrlSetText localize "STR_antistasi_dialogs_squad_leader_title";
    };
};

[_title, localize  "STR_antistasi_dialogs_hq_button_custom_loadout_clear", "SUCCESS"] call SCRT_fnc_ui_showDynamicTextMessage;