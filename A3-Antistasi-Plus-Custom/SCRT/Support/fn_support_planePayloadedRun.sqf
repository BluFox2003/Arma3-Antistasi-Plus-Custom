private _positionOrigin = getMarkerPos supportMarkerOrigin;
private _positionDestination = getMarkerPos supportMarkerDestination;
private _angle = [_positionOrigin, _positionDestination] call BIS_fnc_dirTo;
private _angleOrigin = _angle - 180;

private _originPosition = [_positionOrigin, 2500, _angleOrigin] call BIS_fnc_relPos;
private _finPosition = [_positionDestination, 2500, _angle] call BIS_fnc_relPos;

private _planeData = [_originPosition, _angle, vehSDKPayloadPlane, teamPlayer] call A3A_fnc_spawnVehicle;
private _plane = _planeData select 0;
private _planeCrew = _planeData select 1;
private _groupPlane = _planeData select 2;

private _isHelicopter = _plane isKindOf "helicopter";

_plane setPosATL [getPosATL _plane select 0, getPosATL _plane select 1, if (_isHelicopter) then {100} else {1000}];
_plane disableAI "TARGET";
_plane disableAI "AUTOTARGET";
_plane flyInHeight 120;
private _minAltASL = ATLToASL [_positionDestination select 0, _positionDestination select 1, 0];
_plane flyInHeightASL [(_minAltASL select 2) +120, (_minAltASL select 2) +120, (_minAltASL select 2) +120];

driver _plane sideChat "Starting plane run. ETA 30 seconds.";
private _wp1 = group _plane addWaypoint [_positionOrigin, 0];
_wp1 setWaypointType "MOVE";
if (!_isHelicopter) then { _wp1 setWaypointSpeed "LIMITED" };
_wp1 setWaypointBehaviour "CARELESS";

private _text = nil;

switch (supportType) do {
	case ("STATIC_MG_AIRDROP"): {
		_wp1 setWaypointStatements ["true", format ["if !(local this) exitWith {}; [this, '%1', '%2'] spawn SCRT_fnc_common_supplyDrop", "Box_Syndicate_WpsLaunch_F", supportType]];
		_text = format ["<t size='0.6'>Rebel aircraft drops the <t size='0.6' color='#804000'>HMG</t> near your position.</t>"];
	};
	case ("SUPPLY"): {
		_wp1 setWaypointStatements ["true", format ["if !(local this) exitWith {}; [this, '%1', '%2'] spawn SCRT_fnc_common_supplyDrop", "IG_supplyCrate_F", supportType]];
		_text = format ["<t size='0.6'>Rebel aircraft drops the <t size='0.6' color='#0000ff'>supply crate</t> near your position.</t>"];
	};
	case ("VEH_AIRDROP"): {
		_wp1 setWaypointStatements ["true", format ["if !(local this) exitWith {}; [this, '%1', '%2'] spawn SCRT_fnc_common_supplyDrop", vehSDKBike, supportType]];
		_text = format ["<t size='0.6'>Rebel aircraft drops the <t size='0.6' color='#804000'>light vehicle</t> near your position.</t>"];
	};
	case ("LOOTCRATE_AIRDROP"): {
		_wp1 setWaypointStatements ["true", format ["if !(local this) exitWith {}; [this, '%1', '%2'] spawn SCRT_fnc_common_supplyDrop", lootCrate, supportType]];
		_text = format ["<t size='0.6'>Rebel aircraft drops the <t size='0.6' color='#010100'>loot crate</t> near your position.</t>"];
	};
	case ("NAPALM");
    case ("HE");
    case ("CLUSTER");
    case ("CHEMICAL"): {
		_text = format ["<t size='0.6'>Rebel aircraft is about to drop some <t size='0.6' color='#e60000'>%1 bombs</t> near your position, take cover.</t>", toLower supportType];

		private _bombCount = if (supportType == "CHEMICAL") then {1} else {4};
		private _distance = _positionOrigin distance2D _positionDestination;
		private _bombParams = [_plane, supportType, _bombCount, _distance];

		(driver _plane) setVariable ["bombParams", _bombParams, true];

		[_positionOrigin, driver _plane] spawn {
			params ["_pos", "_pilot"];
			waitUntil {sleep 0.1; ((_pos distance2D _pilot) < 250) || {isNull (objectParent _pilot)}};
			if(isNull (objectParent _pilot)) exitWith {};
			(_pilot getVariable 'bombParams') spawn A3A_fnc_airbomb;
		};
	};
};

_wp2 = group _plane addWaypoint [_positionDestination, 1];
if (!_isHelicopter) then { _wp2 setWaypointSpeed "LIMITED" };
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "isSupportMarkerPlacingLocked=false;publicVariable 'isSupportMarkerPlacingLocked';"];

_wp3 = group _plane addWaypoint [_finPosition, 2];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";

sleep 50;


if (canMove _plane && {alive _plane}) then {
	{
    	[petros, "support", _text] remoteExec ["A3A_fnc_commsMP", _x];
	} forEach ([1000, _positionDestination, teamPlayer] call SCRT_fnc_common_getNearPlayers);
};


private _timeOut = time + 600;
waitUntil { sleep 2; (currentWaypoint group _plane == 4) or (time > _timeOut) or !(canMove _plane) };

if (isSupportMarkerPlacingLocked) then {
    isSupportMarkerPlacingLocked = false;
    publicVariable "isSupportMarkerPlacingLocked";
};

if !(canMove _plane) then { sleep cleantime };
deleteVehicle _plane;
{deleteVehicle _x} forEach _planeCrew;
deleteGroup _groupPlane;