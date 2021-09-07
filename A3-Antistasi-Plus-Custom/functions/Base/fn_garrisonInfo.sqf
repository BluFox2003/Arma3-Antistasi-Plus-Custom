private ["_siteX","_textX","_garrison","_size","_positionX"];

_siteX = _this select 0;

_garrison = garrison getVariable [_siteX,[]];

_size = [_siteX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _siteX;
_estatic = if (_siteX in roadblocksFIA) then {"Technicals"} else {"Statics"};
_textX = format [
    "<br/>Garrison men: %1<br/><br/>Squad Leaders: %2<br/>%11: %3<br/>Riflemen: %4<br/>Autoriflemen: %5<br/>Medics: %6<br/>Grenadiers: %7<br/>Marksmen: %8<br/>AT Men: %9<br/>Static Weap: %10", 
    count _garrison, 
    {_x == SDKSL} count _garrison, 
    {_x == staticCrewTeamPlayer} count _garrison, 
    {_x == SDKMil} count _garrison, 
    {_x == SDKMG} count _garrison,
    {_x == SDKMedic} count _garrison,
    {_x == SDKGL} count _garrison,
    {_x == SDKSniper} count _garrison,
    {_x == SDKATman} count _garrison, 
    {_x distance _positionX < _size} count staticsToSave, 
    _estatic
];

_textX