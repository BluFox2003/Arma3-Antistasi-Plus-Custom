/*
	author: Socrates
	description: Adds auto looter action to vehicle.
	returns: nothing
*/
params ["_vehicle"];

diag_log format ["%1: [Antistasi] | INFO | fn_loot_addActionLoot | Adding loot action to loot object.",servertime];

private _lootActionID = _vehicle getVariable ["scrt_lootActionID", Nil];

//Check if action exists already
if(!isnil "_lootActionID") then
{
	_vehicle removeAction _lootActionID;
};

//add action
_lootActionID = [_vehicle,
	localize "STR_antistasi_actions_loot_around_text",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"vehicle player == player && _this distance _target < 5",
	"vehicle player == player && _caller distance _target < 5",
	{},
	{},
	{
		[_this select 0, 50] remoteExec ["SCRT_fnc_loot_gatherLoot", 2];
	},
	{},
	[],
	3,
	5,
	false,
	false
] call BIS_fnc_holdActionAdd;

diag_log format ["%1: [Antistasi] | INFO | fn_loot_addActionLoot | Loot action to loot truck has been added.",servertime];

_vehicle setVariable ["scrt_lootActionID", _lootActionID, false];

//add event handler to remove action from vehicle when it's killed
_vehicle addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] remoteExec ["SCRT_fnc_loot_removeActionLoot",0, _unit];
}];

_lootActionID;