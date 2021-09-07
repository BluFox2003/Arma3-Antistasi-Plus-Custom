_posbase = getMarkerPos respawnTeamPlayer;
_potentials = [];

_sites = (controlsX select {!(isOnRoad getMarkerPos _x)});
_sites = _sites select {sidesX getVariable [_x,sideUnknown] != teamPlayer};

if (count _sites > 0) then {
    for "_i" from 0 to ((count _sites) - 1) do {
        _siteX = _sites select _i;
        _pos = getMarkerPos _siteX;

       if (_pos distance _posbase < distanceMission * 2) then {
           _potentials pushBack _siteX;
       };
    };
};

if (count _potentials < 1) then {
    //hope there are no maps without controls
    _defaultSite = controlsX select 0;
    _potentials pushBack _defaultSite;
};

_missionSite = selectRandom _potentials;

[[_missionSite],"A3A_fnc_ENC_Trader"] remoteExec ["A3A_fnc_scheduler",2];