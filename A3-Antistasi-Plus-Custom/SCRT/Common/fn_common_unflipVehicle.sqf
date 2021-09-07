private _vehicle = cursorTarget;

if(isNil "_vehicle" || {isNull _vehicle}) exitWith {};
if !(_vehicle isKindOf "LandVehicle") exitWith {
    ["Unflip failed", "This kind of vehicle can't be flipped."] call SCRT_fnc_misc_showDeniedActionHint;
};

private _isAlive = alive _vehicle;
if !(alive _vehicle) exitWith {
    ["Unflip failed", "Vehicle is destroyed."] call SCRT_fnc_misc_showDeniedActionHint;
};

private _crew = crew _vehicle;
if !(_crew isEqualTo []) exitWith {
    ["Unflip failed", "Vehicle is occupied by someone, clear crew before unflip."] call SCRT_fnc_misc_showDeniedActionHint;
};

private _nearFriendlies = (_vehicle nearEntities ["Man", 35]) select {side _x == teamPlayer && {[_x] call A3A_fnc_canFight}};
private _friendlyCount = count _nearFriendlies;
if (_friendlyCount < unflipPersonCount) exitWith {
    ["Unflip failed", format ["Not enough people to unflip vehicle, %1 required.", str unflipPersonCount]] call SCRT_fnc_misc_showDeniedActionHint;
};

private _vehicleMass = getMass _vehicle;
private _escape = false;

if(_vehicleMass > 10000) then {
    private _nearVehicles = nearestObjects [(position _vehicle),["Car", "Truck", "Tank"],50];

    if (count _nearVehicles < 2) then { //flippable vehicle is included too
        _escape = true;
    };
};

if (_escape) exitWith {
    ["Unflip failed", "Vehicle is too heavy, additional car is required to perform unflip."] call SCRT_fnc_misc_showDeniedActionHint;
};

(_vehicle call BIS_fnc_getPitchBank) params ["_vx","_vy"];
if (([_vx,_vy] findIf {_x > 80 || _x < -80}) != -1) then {	
	[_vehicle] spawn {
        params ["_unflippableVehicle"];
        _unflippableVehicle allowDamage false;
        _unflippableVehicle setVectorUp [0,0,1];
        _unflippableVehicle setPosATL [(getPosATL _unflippableVehicle) select 0, (getPosATL _unflippableVehicle) select 1, 0];
        sleep 1;
        _unflippableVehicle allowDamage true;
	};
};

playSound "3DEN_notificationDefault";