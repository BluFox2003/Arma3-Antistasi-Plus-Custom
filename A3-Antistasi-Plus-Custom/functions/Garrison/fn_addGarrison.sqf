params ["_marker", "_units"];

/*  Adds units to a garrison, removes them from the reinforcements
*   Params:
*     _marker: STRING: The name of the marker
*     _units: ARRAY: The new units, formated as garrisons are
*
*   Returns:
*     Nothing
*/

if (isNil "_marker") exitWith {
  [1, "No marker given!", "fn_addGarrison", true] call A3A_fnc_log;
};
if (isNil "_units") exitWith {
  [1, "No units given!", "fn_addGarrison", true] call A3A_fnc_log;
};

[2, format ["Replenishing garrison on marker %1, units: %2.", _marker, str _units], "fn_addGarrison", true] call A3A_fnc_log;

private _garrison = [_marker] call A3A_fnc_getGarrison;
private _requested = [_marker] call A3A_fnc_getRequested;
private _nonReinfUnits = [["", [], []]];

{
  //Selecting the data
  private _vehicle = _x select 0;
  private _crew = _x select 1;
  private _cargo = _x select 2;
  private _isNew = false;

  if(_vehicle != "") then
  {
    private _index = _requested findIf {(_x select 0) == _vehicle};
    if(_index == -1) then
    {
      //Vehicle is new, will still be added with crew
      if(_nonReinfUnits select ((count _nonReinfUnits) - 1) select 0 != "") then
      {
        //Current _nonReinfUnits already got a vehicle, add another
        _nonReinfUnits pushBack [_vehicle, _crew, []];
      }
      else
      {
        //Current _nonReinfUnits got no vehicle, add there
        (_nonReinfUnits select ((count _nonReinfUnits) - 1)) set [0, _vehicle];
        ((_nonReinfUnits select ((count _nonReinfUnits) - 1)) select 1) append _crew;
      };
      _isNew = true;
    }
    else
    {
      //Fill _garrison if needed
      while {count _garrison <= _index} do
      {
        _garrison pushBack ["", [], []];
      };

      //Replace vehicle
      (_garrison select _index) set [0, _vehicle];
      (_requested select _index) set [0, ""];
    };
  };
  if(!_isNew) then
  {
    //Add crew to existing vehicles
    {
      private _crewUnit = _x;
      private _index = _requested findIf {count (_x select 1) > 0};
      if(_index == -1) then
      {
        //Search for vehicle with open crew space
        _index = _nonReinfUnits findIf {(_x select 0) == "" || {(count (_x select 1)) < ([_x select 0, false] call BIS_fnc_crewCount)}};
        if(_index == -1) then
        {
          //None found, open another slot
          _nonReinfUnits pushBack ["", [_crewUnit], []];
        }
        else
        {
          //Found space, adding crew unit
          ((_nonReinfUnits select _index) select 1) pushBack _crewUnit;
        };
      }
      else
      {
        //Fill _garrison if needed
        while {count _garrison <= _index} do
        {
          _garrison pushBack ["", [], []];
        };

        //Replace crew unit
        ((_garrison select _index) select 1) pushBack _crewUnit;
        ((_requested select _index) select 1) deleteAt 0; //Can simple deleted first, all crew units are the same !!! RASISM ALERT !!!
      };
    } forEach _crew;
  };
  if(count _cargo > 0) then
  {
    {
      private _cargoUnit = _x;
      if(_cargoUnit == NATOCrew || _cargoUnit == CSATCrew) then
      {
        //Unit is crew member, check crew section
        private _index = _requested findIf {count (_x select 1) > 0};
        if(_index == -1) then
        {
          //Search for vehicle with open crew space
          _index = _nonReinfUnits findIf {(_x select 0) == "" || {(count (_x select 1)) < ([_x select 0, false] call BIS_fnc_crewCount)}};
          if(_index == -1) then
          {
            //None found, open another slot
            _nonReinfUnits pushBack ["", [_cargoUnit], []];
          }
          else
          {
            //Found space, adding crew unit
            ((_nonReinfUnits select _index) select 1) pushBack _cargoUnit;
          };
        }
        else
        {
          //Fill _garrison if needed
          while {count _garrison <= _index} do
          {
            _garrison pushBack ["", [], []];
          };

          //Replace crew unit
          ((_garrison select _index) select 1) pushBack _cargoUnit;
          ((_requested select _index) select 1) deleteAt 0; //Can simple deleted first, all crew units are the same !!! RASISM ALERT !!!
        };
      }
      else
      {
        //Unit is combat unit, add as suited
        private _index = _requested findIf {count (_x select 2) > 0 && {_cargoUnit in (_x select 2)}};
        if(_index == -1) then
        {
          _index = _nonReinfUnits findIf {(count (_x select 2)) < 8};
          if(_index == -1) then
          {
            //None found, open another slot
            _nonReinfUnits pushBack ["", [_cargoUnit], []];
          }
          else
          {
            //Found space, adding cargo unit
            ((_nonReinfUnits select _index) select 2) pushBack _cargoUnit;
          };
        }
        else
        {
          //Fill _garrison if needed
          while {count _garrison <= _index} do
          {
            _garrison pushBack ["", [], []];
          };

          //Place combat unit
          ((_garrison select _index) select 2) pushBack _cargoUnit;
          private _temp = +((_requested select _index) select 2);
          private _subIndex = _temp findIf {_x == _cargoUnit};
          _temp deleteAt _subIndex;
          (_requested select _index) set [2, _temp];
        };
      };
    } forEach _cargo;
  };
} forEach _units;

//TODO sort units to avoid too much data
//NonReinfUnits gets discarded currently to avoid too much units and data junk
//_garrison append _nonReinfUnits;

//TODO test if that is needed (call by reference)
garrison setVariable [format ["%1_garrison", _marker], _garrison];
garrison setVariable [format ["%1_requested", _marker], _requested];


[_marker] call A3A_fnc_updateReinfState;
