#define VEH               0
#define HELI              1
#define PLANE             2
#define MORTAR            3
#define SAM               4

params ["_marker", "_type"];

_result = getMarkerPos _marker;

_spawns = spawner getVariable [format ["%1_spawns", _marker], -1];
if(_spawns isEqualType -1) exitWith
{
  diag_log format ["%1 does not have any spawn positions set!", _marker];
  -1;
};

_selection = -1;
switch (_type) do {
  case ("Group"): {
    //Not yet implemented
  };
  case ("Crew"): {
    //Not yet implemented
  };
  case ("Vehicle"): {
    _selection = VEH;
  };
  case ("Heli"): {
    _selection = HELI;
  };
  case ("Plane"): {
    _selection = PLANE;
  };
  case ("Mortar"): {
    _selection = MORTAR;
  };
  case ("Sam"): {
    _selection = SAM;
  };
};

if (_selection == -1) exitWith {};

_possible = (_spawns select _selection) select {!(_x select 1)};

if(count _possible > 0) then
{
  _result = selectRandom _possible;
  _index = (_spawns select _selection) findIf {_x isEqualTo _result};
  ((_spawns select _selection) select _index) set [1, true];

  _result = _result select 0;

}
else
{
  _result = -1;
};

diag_log format ["Result is %1", _result];


_result;
