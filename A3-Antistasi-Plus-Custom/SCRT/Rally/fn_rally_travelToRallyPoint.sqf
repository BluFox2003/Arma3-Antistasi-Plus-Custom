if (isNil "rallyProps" || {count rallyProps < 1}) exitWith {
    ["Rally Point", "Rally point does not exist."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (vehicle player != player) exitWith {
    ["Rally Point", "You can't travel to rally point while being in vehicle."] call SCRT_fnc_misc_showDeniedActionHint;
};

if !([player] call A3A_fnc_canFight) exitWith {
    ["Rally Point", "You cannot fast travel while being unconscious."] call SCRT_fnc_misc_showDeniedActionHint;
};

if !((vehicle player getVariable "SA_Tow_Ropes") isEqualTo objNull) exitWith {
    ["Rally Point", "You cannot travel with your Tow Rope out or a Vehicle attached."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (player != player getVariable ["owner",player]) exitWith {
    ["Rally Point", "You cannot travel to rally point while you are controlling AI."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (player distance2D (getMarkerPos "Synd_HQ") > 50) exitWith {
    ["Rally Point", "You cannot travel to rally point outside the HQ."] call SCRT_fnc_misc_showDeniedActionHint;
};

private _groupX = group player;
private _remainingTravels = rallyPointRoot getVariable ["remainingTravels", 0];

if (_remainingTravels < 1) exitWith {
    ["Rally Point", "Not enough travel points."] call SCRT_fnc_misc_showDeniedActionHint;
    remoteExecCall ["SCRT_fnc_rally_deleteRallyPoint",2];
};

private _rallyPoint = rallyProps select 0;
private _rallyPosition = position _rallyPoint;

if ([_rallyPoint, 50] call A3A_fnc_enemyNearCheck) exitWith {
    ["Rally Point", "You cannot travel when enemies are surrounding rally point."] call SCRT_fnc_misc_showDeniedActionHint;
};

private _positionX = [_rallyPosition, 10, random 360] call BIS_fnc_relPos;
private _distanceX = round (((player distance2D _positionX)/200)/2);

disableUserInput true; 
cutText [format ["Traveling to rally point, travel time: %1s, please wait.", _distanceX],"BLACK",1]; 
sleep 1;

private _timePassed = 0;

while {_timePassed < _distanceX} do {
    cutText [format ["Traveling to rally point, travel time: %1s, please wait.", (_distanceX - _timePassed)],"BLACK",0.0001];
    sleep 1;
    _timePassed = _timePassed + 1;
};

{
    _unit = _x;
    if ((!isPlayer _unit) || {_unit == player}) then {
        _unit allowDamage false;
        if (!(_unit getVariable ["incapacitated",false])) then {
            _positionX = _positionX findEmptyPosition [1,25,typeOf _unit];
            _unit setPosATL _positionX;
            if (isPlayer leader _unit) then {_unit setVariable ["rearming",false]};
            _unit doWatch objNull;
            _unit doFollow leader _unit;
        } else {
            _positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
            _unit setPosATL _positionX;
        };
    };
} forEach units _groupX;

disableUserInput false;
cutText ["You arrived to rally point.", "BLACK IN", 1];

private _remainingTravels = _remainingTravels - 1;
rallyPointRoot setVariable ["remainingTravels", _remainingTravels, true];
rallyPointMarker setMarkerText (format ["Rally Point (Remaining Travels: %1)", str _remainingTravels]);

if (_remainingTravels < 1) then {
    remoteExecCall ["SCRT_fnc_rally_deleteRallyPoint",2];
};

sleep 5;
{_x allowDamage true} forEach units _groupX;