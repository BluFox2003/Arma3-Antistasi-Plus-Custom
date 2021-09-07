params ["_flagX", "_playerX"];

private _fileName = "fn_mrkWIN";

private _markerX = [markersX, getPos _flagX] call BIS_fnc_nearestPosition;
private _markerPos = getMarkerPos _markerX;

if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) exitWith {};

if !(_playerX call A3A_fnc_canFight) exitWith { 
    [1, "Action somehow used by dead or unconscious player?", _filename, true] call A3A_fnc_log;
};
if (captive _playerX) exitWith {["Capture", "You cannot Capture the Flag while Undercover"] call A3A_fnc_customHint;};
if ((_markerX in airportsX) and (tierWar < 3)) exitWith {["Capture", "You cannot capture Airports until you reach War Level 3"] call A3A_fnc_customHint;};
if ((_markerX in milbases) and (tierWar < 3)) exitWith {["Capture", "You cannot capture Military Bases until you reach War Level 3"] call A3A_fnc_customHint;};

//Check if the flag is locked
if(_flagX getVariable ["isGettingCaptured", false]) exitWith
{
    ["Capture", "This flag pole is locked, try again in 30 seconds!"] call A3A_fnc_customHint;
};

//Lock the flag
_flagX setVariable ["isGettingCaptured", true, true];

//Unlock the flag after 30 seconds
_flagX spawn
{
    sleep 30;
    _this setVariable ["isGettingCaptured", nil, true];
};

[2, format ["Flag capture at %1 initiated by %2", _markerX, str _playerX], _filename, true] call A3A_fnc_log;

private _capRadius = ((markerSize _markerX select 0) + (markerSize _markerX select 1)) / 2;
_capRadius = _capRadius max 50;

private _rebelValue = 0;
private _enemyValue = 0;
{
    if !(_x call A3A_fnc_canFight) then { continue };
    private _value = linearConversion [_capRadius/2, _capRadius, _markerPos distance2d _x, 1, 0, true];
    if (side _x == teamPlayer) then {
        _rebelValue = _rebelValue + _value;
        continue;
    };
    if (side _x == Occupants or side _x == Invaders) then {
        _enemyValue = _enemyValue + _value;
        _playerX reveal _x;
    };
} forEach (allUnits inAreaArray [_markerPos, _capRadius, _capRadius]);

[2, format ["Rebel value %1, enemy value %2", _rebelValue, _enemyValue], _filename, true] call A3A_fnc_log;

if (_enemyValue > 2*_rebelValue) exitWith
{
    [2, format ["Flag capture by %1 abandoned due to outnumbering", str _playerX], _filename, true] call A3A_fnc_log;
    ["Capture", "The enemy still outnumber us, check the map and clear the rest of the area"] call A3A_fnc_customHint;
};

_playerX playMove "MountSide";
sleep 8;
_playerX playMove "";

{
    if (isPlayer _x) then
    {
        [5,_x] remoteExec ["A3A_fnc_playerScoreAdd",_x];
        if (captive _x) then
        {
            [_x,false] remoteExec ["setCaptive",_x];
        };
    }
} forEach ([_capRadius,0,_markerPos,teamPlayer] call A3A_fnc_distanceUnits);

[2, format ["Flag capture by %1 rewarded", str _playerX], _filename, true] call A3A_fnc_log;
[teamPlayer,_markerX] remoteExec ["A3A_fnc_markerChange",2];