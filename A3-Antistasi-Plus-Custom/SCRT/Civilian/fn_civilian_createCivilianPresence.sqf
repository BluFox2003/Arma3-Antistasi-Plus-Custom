private _fileName = "fn_civilian_createCivilianPresence";

if (civPedestrians == 0) exitWith {};

private _marker = _this;
private _position = getMarkerPos _marker;

[2, format ["Starting creating Civilian Presence Modules for %1", _marker], _fileName] call A3A_fnc_log;

[2, format ["Central position: %1", str _position], _fileName] call A3A_fnc_log;

private _moduleGroup = createGroup sideLogic;

private _cities = ["NameCityCapital","NameCity"] call SCRT_fnc_misc_getWorldPlaces;
private _isCity  = _cities findIf {(_x select 1) distance2D _position <= 250} != -1;

private _population = 0;
private _spawnPointCount = 0;
private _coverCount = 0;
private _waypointCount = 0;
private _size = 100;

if (_isCity) then {
    _spawnPointCount = round (random [3,4,6]);
    _coverCount = round (random [2,4,6]);
    _waypointCount = round (random [3,4,6]);
    _population = civPedestrians * 2;
    if (_population > 30) then {
        _population = 30;
    };
} else {
    _spawnPointCount = round (random [2,3,4]);
    _coverCount = round (random [2,3,4]);
    _waypointCount = round (random [2,3,4]);
    _population = civPedestrians;
};

private _marker1 = createMarkerLocal [format ["%1civilian1", _marker], _position];
_marker1 setMarkerShapeLocal "ELLIPSE";
_marker1 setMarkerSizeLocal [(_size - 20),(_size - 20)];
_marker1 setMarkerTypeLocal "hd_warning";
_marker1 setMarkerAlphaLocal 0;

private _marker2 = createMarkerLocal [format ["%1civilian2", _marker], _position];
_marker2 setMarkerShapeLocal "ELLIPSE";
_marker2 setMarkerSizeLocal [_size,_size];
_marker2 setMarkerTypeLocal "hd_warning";
_marker2 setMarkerAlphaLocal 0;

private _buildingSearchIterations = 0;
while {true} do {
    if (_isCity && {_size > 1000}) exitWith {};
    if (!_isCity && {_size > 500}) exitWith {};
    if (_buildingSearchIterations > 20) exitWith {};
    private _hasBorderBuildings = (_position nearObjects ["House", _size]) findIf {!(_x inArea _marker1) && _x inArea _marker2} != -1;
    if (!_hasBorderBuildings) exitWith {};

    _size = _size + 20;
    _marker1 setMarkerSizeLocal [(_size - 20),(_size - 20)];
    _marker2 setMarkerSizeLocal [_size,_size];
    _population = _population + 1;
    
    _buildingSearchIterations = _buildingSearchIterations + 1;
};

if (_population > 30) then {
    _population = 30;
};

if (!_isCity && {_population > 15}) then {
    _population = 15;
};

private _area = [_position,_size,_size,0,true,-1];
[2, format ["Area: %1", str _area], _fileName] call A3A_fnc_log;

[2, format ["Population: %1, spawns: %2, covers: %3, waypoints: %4", str _population, str _spawnPointCount, str _coverCount, str _waypointCount], _fileName] call A3A_fnc_log;

private _generateWaypoints = {
    params ["_capacity", "_useBuildings", "_terminal", "_type", "_isOnRoad"];

    private _miniRadius = if (_terminal) then {_size - 25} else {0};

    for "_i" from 0 to _waypointCount do {
        private _waypointPosition = [
            _position,
            _miniRadius,
            _size,
            0,
            0,
            0.8,
            0,
            [],
            [_position, _position]
        ] call BIS_fnc_findSafePos;

        if (!(_waypointPosition inArea _area)) then {
            while {true} do {
                _waypointPosition = [
                    _position,
                    _miniRadius, //minimal distance
                    _size, //maximumDistance
                    0,
                    0,
                    0.8,
                    0,
                    [],
                    [_position, _position]
                ] call BIS_fnc_findSafePos;
                if (_waypointPosition inArea _area) exitWith {};
            };
        };

        private _finalPosition = _waypointPosition;

        if (_isOnRoad) then {
            private _road = objNull;
            private _roadPosition = [];
            private _roadRadius = 10;
            private _iterations = 0;

            while {true} do {
                if (_iterations > 30) exitWith {
                    _roadPosition = _waypointPosition;
                };

                _road = _waypointPosition nearRoads _roadRadius;
                if (count _road > 0) then {
                    _roadPosition = position (_road select 0);
                };
                if (count _road > 0 && {!(_roadPosition isEqualTo []) && _roadPosition inArea _area}) exitWith {};

                _roadRadius = _roadRadius + 10;
                _iterations = _iterations + 1;
            };

            private _roadcon = roadsConnectedto (_road select 0);
            private _roadDirection = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
            private _tempObject = "Land_HelipadEmpty_F" createVehicleLocal _roadPosition;
            _tempObject setDir _roadDirection;
            private _curb = if ((random 1) > 0.5) then {7} else {-7};
            private _tempPosition = position _tempObject;
            _finalPosition = _tempPosition vectorAdd [_curb, 0, 0];
            deleteVehicle _tempObject;
        };
        
        "ModuleCivilianPresenceSafeSpot_F" createUnit [
            _finalPosition,
            _moduleGroup,
            "this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true]; presenceWaypoint = this;"
        ];
        presenceWaypoint setVariable ["#capacity",_capacity];
        presenceWaypoint setVariable ["#usebuilding",_useBuildings];
        presenceWaypoint setVariable ["#terminal",_terminal];
        presenceWaypoint setVariable ["#type",_type]; //0 - Cover, 1 - Cover and Waypoint, 2 - Waypoint
    };
};

private _generateCovers = {
    private _buildings = [];
    _buildings = (_position nearObjects ["House", _size]) select {_x inArea _area};

    if (_buildings isEqualTo []) exitWith {false};

    for "_i" from 0 to _coverCount do {
        private _building = selectRandom _buildings;
        private _buildingPosition = position _building;

        "ModuleCivilianPresenceSafeSpot_F" createUnit [
            [_buildingPosition select 0, _buildingPosition select 1, 0],
            _moduleGroup,
            "this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true]; presenceWaypoint = this;"
        ];
        presenceWaypoint setVariable ["#capacity",4];
        presenceWaypoint setVariable ["#usebuilding",true];
        presenceWaypoint setVariable ["#terminal",false];
        presenceWaypoint setVariable ["#type",0]; //0 - Cover, 1 - Cover and Waypoint, 2 - Waypoint
    };

    true;
};

//waypoints
[2, false, false, 2, false] call _generateWaypoints; //waypoints
[3, false, true, 2, true] call _generateWaypoints; //exit waypoints
private _isCoversGenerated = [5, true, false, 0] call _generateCovers;
if (!_isCoversGenerated) then {
    [4, true, false, 0, false] call _generateWaypoints; //covers as waypoints
};

//spawnpoints
for "_i" from 0 to _spawnPointCount do {
    private _waypointPosition = [
        _position,
        0,
        _size,
        0,
        0,
        0.8,
        0,
        [],
        [_position, _position]
    ] call BIS_fnc_findSafePos;

    if (!(_waypointPosition inArea _area)) then {
        while {true} do {
            _waypointPosition = [
                _position,
                0,
                _size,
                5,
                0,
                0.8,
                0,
                [],
                [_position, _position]
            ] call BIS_fnc_findSafePos;
            if (_waypointPosition inArea _area) exitWith {};
        };
    };

    "ModuleCivilianPresenceUnit_F" createUnit [
        _waypointPosition,
        _moduleGroup,
        "this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true];"
    ];
};

//main module that covers top ones, should be created as last
"ModuleCivilianPresence_F" createUnit [
	_position,
	_moduleGroup,
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true]; presenceMain = this;"
];

presenceMain setVariable ["#area",_area];
presenceMain setVariable ["#useagents",true];
presenceMain setVariable ["#usepanicmode",true];
presenceMain setVariable ["#unitcount",_population];
presenceMain setVariable ["#onCreated", (compileFinal "_this spawn A3A_fnc_CIVinit;")];

presenceMain = nil;
presenceWaypoint = nil;

deleteMarkerLocal _marker1;
deleteMarkerLocal _marker2;

[2, format ["%1 Civilian Presence Modules created, job has been completed.", _marker], _fileName] call A3A_fnc_log;