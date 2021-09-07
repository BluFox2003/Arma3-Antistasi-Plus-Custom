if (coverBeforeRevive) then {
    coverBeforeRevive = false; 
    ["Cover Before Revive", "AI soldiers will not take you to cover before healing, they will attempt to revive you in place."] call A3A_fnc_customHint;
} else {
    coverBeforeRevive = true; 
    ["Cover Before Revive", "AI will take you to nearby cover before attempting to revive you."] call A3A_fnc_customHint;
};