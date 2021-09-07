params ["_lootCrate"];

[_lootCrate] remoteExec ["SCRT_fnc_loot_addActionLoot", 0, _lootCrate];
[_lootCrate] remoteExec ["SCRT_fnc_common_addActionMove", 0, _lootCrate];
[_lootCrate] call A3A_fnc_logistics_addLoadAction;