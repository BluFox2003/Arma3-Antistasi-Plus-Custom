params ["_side", "_timerIndex", "_posDestination", "_supportName"];

/*  Sends a transport plane that will drop light APC with troops on the given position

    Execution on: Server

    Scope: External

    Params:
        _posDestination: POSITION : The target position where the QRF will be send to
        _side: SIDE : The side of the QRF

    Returns:
        _coverageMarker : STRING : The name of the marker covering the support area, "" if not possible
*/

private _filename = "SUP_airdrop";

private _markerOrigin = [_posDestination, _side] call A3A_fnc_findAirportForAirstrike;

if(_markerOrigin == "") exitWith {
    [2, format ["No airport found for %1 support", _supportName], _filename] call A3A_fnc_log;
    ["", 0, 0];
};

private _targetMarker = createMarker [format ["%1_coverage", _supportName], _posDestination];

_targetMarker setMarkerShape "ELLIPSE";
_targetMarker setMarkerBrush "Grid";
_targetMarker setMarkerSize [300, 300];
if(_side == Occupants) then {
    _targetMarker setMarkerColor colorOccupants;
};
if(_side == Invaders) then {
    _targetMarker setMarkerColor colorInvaders;
};
_targetMarker setMarkerAlpha 0;

private _posOrigin = getMarkerPos _markerOrigin;

//Set idle times for marker
[_markerOrigin, 10] call A3A_fnc_addTimeForIdle;

//Base selected, select units now
private _plane = objNull;
private _groups = [];
private _landPosBlacklist = [];

private _planeClass = if (_side == Occupants) then {selectRandom vehNATOTransportPlanes} else {selectRandom vehCSATTransportPlanes};

if (isNil "_planeClass") exitWith {
    [2, format ["No plane found for %1 support", _supportName], _filename] call A3A_fnc_log;
    ["", 0, 0];
};

private _vehicleData = [_planeClass, "Normal", _landPosBlacklist, _side, _markerOrigin, _posDestination, true] call A3A_fnc_createAttackVehicle;
if (_vehicleData isEqualType []) then {
    _plane = (_vehicleData select 0);
    _groups pushBack (_vehicleData select 1);
    if !(isNull (_vehicleData select 2)) then {
        _groups pushBack (_vehicleData select 2);
    };
    _landPosBlacklist = (_vehicleData select 3);
};

if (isNull _plane) exitWith {
    ["", 0, 0];
};

[2, format ["Spawn Performed: %1 airdrop plane sent, callsign %2", (str _plane), _supportName], _filename] call A3A_fnc_log;

[_side, _timerIndex, _plane, _groups, _posDestination, _supportName] spawn A3A_fnc_SUP_airdropRoutine;

_markerOrigin spawn {
    sleep 60;
    if(spawner getVariable _this == 2) then {
        [_this] call A3A_fnc_freeSpawnPositions;
    };
};

private _distance = _posOrigin distance2D _posDestination;
private _minTime = _distance / (300 / 3.6);
private _maxTime = _distance / (25 / 3.6);

private _result = [_targetMarker, _minTime, _maxTime];
_result;