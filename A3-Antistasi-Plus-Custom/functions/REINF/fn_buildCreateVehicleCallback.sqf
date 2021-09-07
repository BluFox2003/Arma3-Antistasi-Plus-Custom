params ["_structureType", "_posASL", "_dir"];

private _positionX = ASLtoATL _posASL;

private _isPlayer = if (player == construction_selectedEngineer) then {true} else {false};
private _timeOut = time + 30;

if (!_isPlayer) then
{
	construction_selectedEngineer doMove _positionX
}
else
{
	construction_buildTime = construction_buildTime / 2;
	["Build Info", "Walk to the selected position to start building"] call A3A_fnc_customHint;
};

build_targetLocation = _positionX;
build_atBuildLocation = false;
build_cancelBuild = false;

addMissionEventHandler ["Draw3D", {
	if (build_atBuildLocation || build_cancelBuild) exitWith {
		removeMissionEventHandler ["Draw3D", _thisEventHandler];
	};
	drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", [1,1,1,1], build_targetLocation, 1,1,0,"Build", 0, 0.05, "PuristaMedium"];
}];

waitUntil {sleep 1;(time > _timeOut) or (construction_selectedEngineer distance _positionX < 3)};

if (time > _timeOut) exitWith 
{
	build_cancelBuild = true;
	["Build Info", "You didn't move to the position, construction has timed out."] call A3A_fnc_customHint;
};

build_atBuildLocation = true;
build_targetLocation = nil;


if (construction_cost > 0) then {
	if (!isMultiPlayer) then {
		_nul = [0, - construction_cost] remoteExec ["A3A_fnc_resourcesFIA",2];
	}
	else {
		[-construction_cost] call A3A_fnc_resourcesPlayer;
	};
};

construction_selectedEngineer setVariable ["constructing",true];

_timeOut = time + construction_buildTime;

if (!_isPlayer) then
	{
	{construction_selectedEngineer disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
	};

construction_selectedEngineer playMoveNow selectRandom medicAnims;

construction_selectedEngineer addEventHandler ["AnimDone",
	{
	private _engineer = _this select 0;
	if (([_engineer] call A3A_fnc_canFight) and !(_engineer getVariable ["helping",false]) and !(_engineer getVariable ["rearming",false]) and (_engineer getVariable ["constructing",false])) then
		{
		_engineer playMoveNow selectRandom medicAnims;
		}
	else
		{
		_engineer removeEventHandler ["AnimDone",_thisEventHandler];
		};
	}];

waitUntil  {sleep 5; !([construction_selectedEngineer] call A3A_fnc_canFight) or (construction_selectedEngineer getVariable ["helping",false]) or (construction_selectedEngineer getVariable ["rearming",false]) or (construction_selectedEngineer distance _positionX > 4) or (time > _timeOut)};

construction_selectedEngineer setVariable ["constructing",false];
if (!_isPlayer) then {{construction_selectedEngineer enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"]};

if (time <= _timeOut) exitWith {["Build Info", "Construction cancelled"] call A3A_fnc_customHint;};
if (!_isPlayer) then {construction_selectedEngineer doFollow (leader construction_selectedEngineer)};

private _veh = createVehicle [_structureType, _positionX, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;

constructionsToSave pushBackUnique _veh;
publicVariable "constructionsToSave";

//removing previous
private _excessiveConstructions = maxConstructions - (count constructionsToSave);
if(_excessiveConstructions < 0) then {
	private _top = abs _excessiveConstructions;
	for "_i" from 0 to _top do {
		deleteVehicle (constructionsToSave select _i);
		constructionsToSave deleteAt _i;
	};
};

construction_nearestFriendlyMarker = nil;
construction_selectedEngineer = nil;