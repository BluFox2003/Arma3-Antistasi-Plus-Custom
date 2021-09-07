/*
    Performs a paradrop with the given group and vehicle

Arguments:
    <OBJECT> The vehicle from which the drop will be performed
    <GROUP> The group that will jump and perform the drop (NOT THE PILOTS!)
    <MARKER> OR <POSITION> The designated target
    <MARKER> The origin location this vehicle is coming from
    (OPTIONAL) <BOOL> If this drop is there to reinforce (default false)

Return Value:
    <NIL>

Scope: Server/HC
Environment: Scheduled
Public: Yes
Dependencies:
    NONE

Example:
[_myPlane, _ODSTgroup, _targetPos, "CSAT_Carrier"] call SCRT_fnc_common_paradropVehicle;
*/

params
[
    ["_vehicle", objNull, [objNull]],
    ["_groupJumper", grpNull, [grpNull]],
    ["_target", "", ["", []]],
    ["_originMarker", "", [""]],
    ["_isReinforcement", false, [false]]
];

private _groupPilot = group driver _vehicle;
{
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x setBehaviour "CARELESS";
} foreach (units _groupPilot);

{
    _x setVariable ["jumpSave_Backpack", backpack _x];
    _x setVariable ["jumpSave_BackpackItems", backpackItems _x];
    removebackpack _x;
} forEach (units _groupJumper);

private _targetPosition = if(_target isEqualType "") then {getMarkerPos _target} else {_target};
private _originPosition = getMarkerPos _originMarker;

private _entryDistance = 350;
_vehicle flyInHeight 250;
_vehicle setCollisionLight false;
_vehicle setDir (_originPosition getDir _targetPosition);
_vehicle setVelocityModelSpace [0, 100, 0];

private _normalAngle = (_originPosition getDir _targetPosition);
private _attackAngle = (random 120) - 60;
private _entryPos = [];
while {true} do {
    _entryPos = _targetPosition getPos [_entryDistance, (_normalAngle - 180) - _attackAngle];
    if(!surfaceIsWater _entryPos) exitWith {};
    _attackAngle = (random 120) - 60;
};
private _exitPos = _targetPosition getPos [_entryDistance, _normalAngle + _attackAngle];

{
    _x set [2, 250];
} forEach [_entryPos, _exitPos, _originPosition];

private _wp = _groupPilot addWaypoint [_entryPos, -1];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointStatements ["true", "if !(local this) exitWith {}; (vehicle this) setVariable ['dropPosReached', true];"];

private _wp1 = _groupPilot addWaypoint [_exitPos, -1];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "NORMAL";

private _wp2 = _groupPilot addWaypoint [_originPosition, -1];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];

waitUntil {sleep 1; (_vehicle getVariable ["dropPosReached", false]) || (!alive _vehicle) || (!canMove _vehicle)};

if(_vehicle getVariable ["dropPosReached", false] && {!(_vehicle getVariable ["planeDead", false])}) then {
    [3, 'Drop pos reached', 'paradrop'] call A3A_fnc_log;
    _vehicle setCollisionLight true;
    {
        unAssignVehicle _x;
        //Move them into alternating left/right positions, so their parachutes are less likely to kill each other
        private _pos = if (_forEachIndex % 2 == 0) then {_vehicle modeltoWorld [7, -20, -5]} else {_vehicle modeltoWorld [-7, -20, -5]};
        _x setPos _pos;
        _x spawn {
            waitUntil {sleep 0.25; ((getPos _this) select 2) < 150};
            _this addBackpack "B_Parachute";
            waitUntil { sleep 0.05; isTouchingGround _this};
            _this addBackpack (_this getVariable "jumpSave_Backpack");
            {
                _this addItemToBackpack _x;
            } forEach (_this getVariable "jumpSave_BackpackItems");
        };
        sleep 0.25;
  	} forEach units _groupJumper;
    
    private _side = side _vehicle;
    private _dir = getDir _vehicle;
    private _initialPos = (getPos _vehicle) vectorAdd [0, 0, -6.5];
    private _apcClass = if (_side == Occupants) then {selectRandom vehNATOLightAPC} else {selectRandom vehCSATLightAPC};

    private _apcData = [_initialPos, _dir, _apcClass, _side] call A3A_fnc_spawnVehicle;
    private _apc = _apcData select 0;
	private _apcCrew = _apcData select 1;
	private _apcGroup = _apcData select 2;

    _vehicle setVariable ["apc", _apc, true]; //broadcast in case of HC

    {
        _x disableAI "TARGET";
        _x disableAI "AUTOTARGET";
    } forEach _apcCrew;

    [_apc, _side] call A3A_fnc_AIVEHinit;

    [_apc, _vehicle, _groupJumper, _targetPosition, _apcCrew, _apcGroup] spawn {
        params ["_apc", "_vehicle", "_groupJumper", "_targetPosition", "_apcCrew", "_apcGroup"];

        waitUntil {((getPos _apc) select 2) < 150};

        private _parachute = createVehicle ["B_Parachute_02_F", [0,0,0], [], 0, "NONE"];
        _parachute setDir getDir _apc;
        _parachute setPos getPos _apc;
        _apc attachTo [_parachute, [0, 0, 1.5]];  

        [_parachute, _apc] spawn {
            params ["_parachute", "_apc"];

            while {((position _apc) select 2) > 2 && {!(isNull _parachute)}} do {
                sleep 1;
                (_apc call BIS_fnc_getPitchBank) params ["_vx","_vy"];
                if (([_vx,_vy] findIf {_x > 80 || {_x < -80}}) != -1) then {	
                    _parachute setVectorUp [0,0,1];
                    _apc setVectorUp [0,0,1];
                };
            };
        };

        waitUntil {
            sleep 0.01;
            ((position _apc) select 2) < 2 
            || {isNull _parachute
            || {(count (lineIntersectsWith [getPosASL _apc, (getPosASL _apc) vectorAdd [0, 0, -0.5], _apc, _parachute])) > 0 }}
        };

        _parachute disableCollisionWith _apc;
        _apc setVectorUp [0,0,1];
        _apc setVelocity [0,0,0];
        detach _apc;    
        if (!isNull _parachute) then {deleteVehicle _parachute};

        {
            _x enableAI "TARGET";
            _x enableAI "AUTOTARGET";
        } forEach _apcCrew;

        
        {
            unassignVehicle _x;
            _x assignAsCargo _apc;
        } forEach units _groupJumper;

        private _apcLeader = leader _apcGroup;
        (units _apcGroup) joinSilent _groupJumper;
        _groupJumper selectLeader _apcLeader;

        private _posLeader = position ((units _groupJumper) select 0);
        _posLeader set [2,0];

        private _wpRegroup = _apcGroup addWaypoint [_posLeader,0];
        _wpRegroup setWaypointType "MOVE";
        _wpRegroup setWaypointSpeed "FULL";
        _wpRegroup setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) spawn A3A_fnc_attackDrillAI"];
        private _wpCharge = _groupJumper addWaypoint [_targetPosition, 25];
        _wpCharge setWaypointType "MOVE";
        _wpCharge setWaypointBehaviour "COMBAT";
        _wpCharge setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
        private _wpClear = _groupJumper addWaypoint [_targetPosition, 2];
        _wpClear setWaypointType "SAD";
    };
};