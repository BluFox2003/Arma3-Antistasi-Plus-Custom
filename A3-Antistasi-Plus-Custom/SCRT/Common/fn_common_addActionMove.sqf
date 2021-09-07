/*
	author: Socrates
	description: Adds move action to vehicle.
	returns: nothing
*/
params ["_vehicle"];

diag_log format ["%1: [Antistasi] | INFO | fn_loot_addActionLoot | Adding loot action to loot truck.",servertime];

private _actionId = _vehicle getVariable ["scrt_moveActionId", Nil];

//Check if action exists already
if(!isnil "_actionId") then {
	_vehicle removeAction _actionId;
};

//add action
_actionId = _vehicle addAction [
    "Carry Loot Crate", 
    SCRT_fnc_common_moveStatic,
    nil,
    0,
    false,
    true,
    "",
    "(isPlayer _this) && {(_this == _this getVariable ['owner',objNull]) && {isNull attachedTo _target}}", 
    4
];

_vehicle setVariable ["scrt_moveActionId", _actionId, false];

//add event handler to remove action from vehicle when it's killed
_vehicle addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] remoteExec ["SCRT_fnc_common_removeActionMove",0, _unit];
}];

_actionId;