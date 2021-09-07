params ["_vehicle", "_preference", "_side"];

/*  Selects a suitable group for the given vehicle and preference
*   Params:
*     _vehicle : STRING : The vehicle typename
*     _preference : STRING : The preferred group
*     _side : SIDE : The side of the selected group
*
*   Returns:
*     _group : ARRAY of STRINGS : The selected group
*/

//If preference is empty, return empty
if(_preference == "Empty") exitWith {[]};

//If tank, select AT team
if(_vehicle in vehNATOTanks) exitWith {groupsNATOAT call SCRT_fnc_unit_selectInfantryTier};
if(_vehicle in vehCSATTanks) exitWith {groupsCSATAT call SCRT_fnc_unit_selectInfantryTier};

//If AA-tank, select AA team
if(_vehicle in vehNATOAA) exitWith {groupsNATOAA call SCRT_fnc_unit_selectInfantryTier};
if(_vehicle in vehCSATAA) exitWith {groupsCSATAA call SCRT_fnc_unit_selectInfantryTier};

_result = "";
//If no vehicle return preference
if(_vehicle == "") then
{
  _result = _preference
}
else
{
  //Check vehicle seats
  _vehicleSeats = ([_vehicle, true] call BIS_fnc_crewCount) - ([_vehicle, false] call BIS_fnc_crewCount);
  if(_vehicleSeats >= 8) then
  {
    _result = _preference;
  }
  else
  {
    if(_vehicleSeats >= 4) then
    {
      _result = "GROUP";
    }
    else
    {
      _result = _preference;
      if(debug) then
      {
        diag_log format ["SelectGroupType: Vehicle %1 cannot transport four or more people, reconsider using another vehicle or make smaller groups possible!", _vehicle];
        diag_log "SelectGroupType: Assuming preference as a solution, may be changed in the future!";
      };
    };
  };
};

_group = [];
if(_result != "EMPTY") then
{
  _group = if(_result == "SQUAD") then {
    private _squads = [_side, "SQUAD"] call SCRT_fnc_unit_getGroupSet;
    selectRandom _squads;
  } else {
    private _mid = [_side, "MID"] call SCRT_fnc_unit_getGroupSet;
    selectRandom _mid;
  };
};

_group;
