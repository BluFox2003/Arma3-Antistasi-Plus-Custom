params ["_typeUnit"];

if !(player call A3A_fnc_isMember) exitWith {["AI Recruitment", "Only Server Members can recruit AI units"] call A3A_fnc_customHint;};

if (recruitCooldown > time) exitWith {["AI Recruitment", format ["You need to wait %1 seconds to be able to recruit units again",round (recruitCooldown - time)]] call A3A_fnc_customHint;};

if (player != player getVariable ["owner",player]) exitWith {["AI Recruitment", "You cannot buy units while you are controlling AI"] call A3A_fnc_customHint;};

if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {["AI Recruitment", "You cannot Recruit Units with enemies nearby"] call A3A_fnc_customHint;};

if (player != leader group player) exitWith {["AI Recruitment", "You cannot recruit units as you are not your group leader"] call A3A_fnc_customHint;};

private _hr = server getVariable "hr";

if (_hr < 1) exitWith {["AI Recruitment", "You do not have enough HR for this request"] call A3A_fnc_customHint;};
private _costs = server getVariable _typeUnit;
private _resourcesFIA = player getVariable ["moneyX", 0];


private _exit = false;
{
	if (_x == _typeUnit) exitWith {
		_exit = true;
	};
} forEach [SDKMG, SDKGL, SDKSniper, SDKExp];

if (_exit && {tierWar < 2}) exitWith {
	["Recruit Squad", "You can not recruit this type of unit at war level 1."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (_typeUnit == SDKATman && {tierWar < 4}) exitWith {
	["Recruit Squad", "You can not recruit this type of unit at war level 3 or less."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (_costs > _resourcesFIA) exitWith {["AI Recruitment", format ["You do not have enough money for this kind of unit (%1 € needed)",_costs]] call A3A_fnc_customHint;};

if ((count units group player) + (count units stragglers) > 9) exitWith {["AI Recruitment", "Your squad is full or you have too many scattered units with no radio contact"] call A3A_fnc_customHint;};

private _unit = [group player, _typeUnit, position player, [], 0, "NONE"] call A3A_fnc_createUnit;

if (!isMultiPlayer) then {
	_nul = [-1, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];
} else {
	_nul = [-1, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
	[- _costs] call A3A_fnc_resourcesPlayer;
	["AI Recruitment", "Soldier Recruited.<br/><br/>Remember: if you use the group menu to switch groups you will lose control of your recruited AI"] call A3A_fnc_customHint;
};

[_unit] spawn A3A_fnc_FIAinit;
_unit disableAI "AUTOCOMBAT";
sleep 1;
petros directSay "SentGenReinforcementsArrived";
