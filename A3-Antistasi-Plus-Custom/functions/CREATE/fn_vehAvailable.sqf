params ["_typeX"];

if (_typeX == "") exitWith {false};
if (_typeX in vehCSATTrucks + vehNATOTrucks + vehNATOCargoTrucks + vehCSATCargoTrucks + [vehCSATPatrolHeli,vehNATOPatrolHeli,vehCSATRBoat,vehNATORBoat]) exitWith {true};

private _cant = timer getVariable _typeX;

if (isNil "_cant") exitWith {true};
if (_cant <= 1) exitWith {false};

if ({typeOf _x == _typeX} count vehicles >= (floor _cant)) exitWith {false};

true