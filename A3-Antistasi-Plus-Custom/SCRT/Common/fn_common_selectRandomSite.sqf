params ["_sideX"];

private _sites = outposts + seaports + airportsX + milbases;
_sites = _sites select {sidesX getVariable [_x,sideUnknown] == _sideX};

private _potentials = [];
private _positionBase = getMarkerPos respawnTeamPlayer;

if (count _sites > 0) then {
    for "_i" from 0 to ((count _sites) - 1) do {
        _site = _sites select _i;
        _position = getMarkerPos _site;

       if (_position distance _positionBase < distanceMission * 2) then {
           _potentials pushBack _site;
       };
    };
};

if (count _potentials < 1) then {
    _defaultSite = airportsX select 0;
    _potentials pushBack _defaultSite;
};

private _missionSite = selectRandom _potentials;

_missionSite