private _aiUnits = (units (group player)) select {!isPlayer _x && {alive _x} && {_x != petros}};

if (theBoss isEqualTo objNull) exitWith {
    ["High Command Transfer", "You need to have a commander to perform this action."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (!([theBoss] call A3A_fnc_hasRadio)) exitWith {
    ["High Command Transfer", "Your commander need to have a radio to perform this action."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (!([player] call A3A_fnc_hasRadio)) exitWith {
    ["High Command Transfer", "You need to have a radio to perform this action."] call SCRT_fnc_misc_showDeniedActionHint;
};


if !([player] call A3A_fnc_canFight) exitWith {
    ["High Command Transfer", "You have to be combat-ready to perform this action."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (count _aiUnits < 1) exitWith {
    ["High Command Transfer", "You have no active AI squadmates."] call SCRT_fnc_misc_showDeniedActionHint;
};


private _transferGroup = createGroup teamPlayer;
_transferGroup setGroupIdGlobal [format ["SqMilitia-%1",{side (leader _x) == teamPlayer} count allGroups]];

_aiUnits joinSilent _transferGroup;

theBoss hcSetGroup [_transferGroup];

private _text = format ["Group %1 has been transfered to be under your command.<br/><br/>Groups are managed from the High Command bar (Default: CTRL+SPACE)<br/><br/>", groupID _transferGroup];
[petros, "hint", _text] remoteExec ["A3A_fnc_commsMP",theBoss];
petros directSay "SentGenReinforcementsArrived";