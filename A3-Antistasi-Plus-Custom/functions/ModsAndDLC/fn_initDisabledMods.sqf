scriptName "fn_initDisabledMods.sqf";
private _fileName = "fn_initDisabledMods.sqf";
private _disabledMods = [];

_disabledMods pushBack "kart";
_disabledMods pushBack "orange";
_disabledMods pushBack "aow";

if (!allowDLCVN) then {_disabledMods pushBack "vn"};
if (!allowDLCGlobMob) then {_disabledMods pushBack "gm"};

[2,format ["Disabled DLCs: %1",_disabledMods],_fileName] call A3A_fnc_log;

_disabledMods;
