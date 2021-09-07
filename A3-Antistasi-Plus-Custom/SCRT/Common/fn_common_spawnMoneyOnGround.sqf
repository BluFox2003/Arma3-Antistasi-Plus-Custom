if(!isServer) exitWith {};


params ["_position", "_count"];

_spawnPosition = [
    _position, //center
    0, //minimal distance
    1, //maximumDistance
    0.1, //object distance
    0, //water mode
    0, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_position, _position] //default position
] call BIS_fnc_findSafePos;

for "_i" from 1 to _count do {
	_moneyVeh = createVehicle [(selectRandom arrayMoneyLand), _spawnPosition, [], 0, "CAN_COLLIDE"];
};