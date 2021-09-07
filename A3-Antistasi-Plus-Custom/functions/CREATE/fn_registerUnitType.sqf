private _fileName = "fn_registerUnitType";

params [["_unitTypeName", nil, [""]], ["_unitDefinition", nil, [[]]]];

if (!isServer) exitWith {};

[3, format ["Registering unit %1 with class %2 and %3 loadouts", _unitTypeName, _unitDefinition#2, count (_unitDefinition#0)], _fileName] call A3A_fnc_log;

A3A_customUnitTypes setVariable [_unitTypeName, _unitDefinition, true];