if (isMenuOpen) then {
    closeDialog 0;
    closeDialog 0;
    isMenuOpen = false;
} else {
    if(player == theBoss) then {
        closeDialog 0;
        closeDialog 0;
        createDialog "commanderMenu";
        [] call SCRT_fnc_ui_populateCommanderMenu;
        isMenuOpen = true;
        if (vehicle player == player) then {
            [] spawn SCRT_fnc_misc_orbitingCamera;
        } else {
            [] spawn SCRT_fnc_misc_followCamera;
        };
    } else {
        closeDialog 0;
        closeDialog 0;
        createDialog "playerMenu";
        [] call SCRT_fnc_ui_populatePlayerMenu;
        isMenuOpen = true;
        if (vehicle player == player) then {
            [] spawn SCRT_fnc_misc_orbitingCamera;
        } else {
            [] spawn SCRT_fnc_misc_followCamera;
        };
    }
};