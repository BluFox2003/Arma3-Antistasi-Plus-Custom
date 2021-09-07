private ["_markerX","_threat","_positionX","_analyzed","_sideX"];

_threat = 0;

_markerX = _this select 0;
_sideX = _this select 1;
if (_markerX isEqualType []) then {_positionX = _markerX} else {_positionX = getMarkerPos _markerX};
_threat = _threat + 2 * ({
	(isOnRoad getMarkerPos _x) and (getMarkerPos _x distance _positionX < distanceSPWN)
} count roadblocksFIA + watchpostsFIA + aapostsFIA + atpostsFIA + mortarpostsFIA + hmgpostsFIA);

{
if (getMarkerPos _x distance _positionX < distanceSPWN) then
	{
	_analyzed = _x;
	_garrison = garrison getVariable [_analyzed,[]];
	_threat = _threat + (floor((count _garrison)/8));
	_staticsX = staticsToSave select {_x inArea _analyzed};
	if (count _staticsX > 0) then
		{
		_threat = _threat + ({typeOf _x == SDKMortar} count _staticsX) + (2*({typeOf _x == staticATteamPlayer} count _staticsX))
		};
	};
} forEach (markersX - citiesX - controlsX - watchpostsFIA - roadblocksFIA - aapostsFIA - atpostsFIA - mortarpostsFIA - hmgpostsFIA) select {sidesX getVariable [_x,sideUnknown] != _sideX};

_threat