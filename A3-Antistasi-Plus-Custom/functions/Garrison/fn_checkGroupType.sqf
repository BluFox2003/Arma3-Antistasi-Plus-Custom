params ["_group", "_vehicle", "_preference"];

/*  Checks if the given group matches the given vehicle and preference
*   Params:
*     _group : ARRAY of STRINGS : The typenames of the units in the group
*     _vehicle : STRING : The vehicle typename of the group
*     _preference : STRING : The preferred group type
*
*   Returns:
*     _result : BOOLEAN : True if group matches preference and vehicle, false otherwise
*/

private ["_result", "_vehicleSeats"];
_result = false;

//Tanks are always combined with an AT team
if(_vehicle == "LAND_TANK") exitWith {
  _currentOccATGroup = groupsNATOAT call SCRT_fnc_unit_selectInfantryTier;
  _currentInvATGroup = groupsCSATAT call SCRT_fnc_unit_selectInfantryTier;
  (_group == _currentOccATGroup || {_group == _currentInvATGroup})
};

//AA is always combined with an AA team
if(_vehicle == "LAND_AIR") exitWith {
  private _currentOccAAGroup = groupsNATOAA call SCRT_fnc_unit_selectInfantryTier;
  private _currentInvAAGroup = groupsCSATAA call SCRT_fnc_unit_selectInfantryTier;
  (_group == _currentOccAAGroup || {_group == _currentInvAAGroup})
};

//Check group size to determine
if(_preference == "SQUAD") then
{
  _result = (count _group == 8);
};
if(_preference == "GROUP") then
{
  _result = (count _group == 4);
};

//Check if vehicle can hold group
_vehicleSeats = ([_vehicle, true] call BIS_fnc_crewCount) - ([_vehicle, false] call BIS_fnc_crewCount);
_result = (_result && (count _group <= _vehicleSeats));

_result;
