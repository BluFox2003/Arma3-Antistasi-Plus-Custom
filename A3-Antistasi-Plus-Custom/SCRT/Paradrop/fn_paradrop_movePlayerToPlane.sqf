#define KEY_ESCAPE 1
#define TIME_WINDOW 5

closeDialog 0;
closeDialog 0;
2 fadeSound 0;
isMoveToPlaneCancelled = false;
moveMenu = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    _handled = false;
    if (_this select 1 == KEY_ESCAPE) then {
        isMoveToPlaneCancelled = true;
        (findDisplay 46) displayRemoveEventHandler ["KeyDown", moveMenu];
    };

    _handled;
}];

private _inputTimeout = time + TIME_WINDOW;
while {true} do {
    if (time > _inputTimeout) exitWith {};
    if (isMoveToPlaneCancelled) exitWith {};

    cutText [
        format [
            "<t color='#d3d9df' size='2'>Commander uses paradrop insertion at some location. You're about to be moved into plane in %1 seconds. Press ESCAPE if you don't want to be moved into airplane. Parachutes will be automatically applied on jump from plane.</t>", 
            (round(_inputTimeout - time))
        ],
        "BLACK",
        0.0001,
        true, 
        true
    ];
};

(findDisplay 46) displayRemoveEventHandler ["KeyDown", moveMenu];

if (isMoveToPlaneCancelled) exitWith {
    cutText ["<t color='#d3d9df' size='2'>You will stay at base.</t>","BLACK IN",1, true, true];
    isMoveToPlaneCancelled = nil;
    moveMenu = nil;
    2 fadeSound 1;
};

private _waitTimeout = time + 30;
waitUntil {sleep 0.01; !(isNil "paradropPlane") || time > _waitTimeout};

if (isNil "paradropPlane") exitWith {
    cutText ["","BLACK IN", 2];
    2 fadeSound 1;
    ["Paradrop", "Something happened to plane, aborting paradrop."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (!canMove paradropPlane || {!alive paradropPlane || {!alive (driver paradropPlane)}}) exitWith {
    cutText ["","BLACK IN", 2];
    2 fadeSound 1;
    ["Paradrop", "Plane is not capable to do the mission, aborting paradrop."] call SCRT_fnc_misc_showDeniedActionHint;
};

private _totalSeats = [vehSDKPlane, true] call BIS_fnc_crewCount;
private _occupiedSeats = count (crew paradropPlane);

if ((_totalSeats - _occupiedSeats) < 0) exitWith {
    cutText ["","BLACK IN", 2];
    2 fadeSound 1;
    ["Paradrop", "Plane has no free seats, aborting paradrop."] call SCRT_fnc_misc_showDeniedActionHint;
};

player moveInCargo paradropPlane;

private _earlyEscape = false;
private _iterations = 0;

while {true} do {
    if (vehicle player == paradropPlane) exitWith {};
    if (_iterations > 30) exitWith {_earlyEscape = true;};
    if (isNil "paradropPlane" || {!alive paradropPlane || {!([player] call A3A_fnc_canFight)}}) exitWith {
        _earlyEscape = true;
    };

    player moveInCargo paradropPlane;
    _iterations = _iterations + 1;
    sleep 0.05;
};

if (_earlyEscape) exitWith {
    ["Paradrop", "Something went wrong."] call SCRT_fnc_misc_showDeniedActionHint;
};

sleep 1;

cutText ["<t color='#d3d9df' size='2'>You have been moved to airplane to attend in paradrop.</t>","BLACK IN", 3, true, true];
5 fadeSound 1;

waitUntil {sleep 0.001; isNil "paradropPlane" || {vehicle player != paradropPlane}};

if (!([player] call A3A_fnc_canFight) || {isNil "paradropPlane"}) exitWith {};

player call SCRT_fnc_paradrop_jump;