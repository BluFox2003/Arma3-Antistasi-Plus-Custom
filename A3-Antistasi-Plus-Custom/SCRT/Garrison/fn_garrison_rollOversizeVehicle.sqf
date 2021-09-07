
params ["_side", "_markerPosition", "_size"];

private _return = [];
private _aggression = if (_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _isFia = if (random 10 > (tierWar + difficultyCoef)) then {true} else {false};
private _oversizeChance =  _aggression / 2;
if (_oversizeChance > 25) then {
	_oversizeChance = 25;
};

if ((random 100) < _oversizeChance) then {
    private _vehiclePool = if (_side == Occupants) then {
        if (_isFia) then {
            vehFIAAPC + vehFIATanks
        } else {
            vehNATOAPC + vehNATOLightArmed 
        };
    } else { 
        if (_isFia) then {
            vehWAMAPC + vehWAMTanks
        } else {
            vehCSATAPC + vehCSATLightArmed 
        };
    };
    _vehiclePool = _vehiclePool call BIS_fnc_arrayShuffle;

    private _selectedVehicle = selectRandom _vehiclePool;

    if (!isNil "_selectedVehicle") then {
        private _road = nil;
        private _radiusX = 5;

        while {true} do {
            _road = _markerPosition nearRoads _radiusX;
            if (count _road > 0) exitWith {};
            if (_radiusX > 700) exitWith {};
            _radiusX = _radiusX + 10;
        };

        private _position = nil;
        if (!isNil "_road") then {
            private _roadcon = roadsConnectedto (_road select 0);
            private _dirveh = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_DirTo} else {random 360};
            _position = getPos (_road select 0);
        } else {
            _position = [_markerPosition, 10, _size, 5, 0, 0.7, 0, [], [_markerPosition, _markerPosition]] call BIS_fnc_findSafePos;
        };

        private _vehicleData = [_position, 0, _selectedVehicle, _side] call A3A_fnc_spawnVehicle;
        _return = _vehicleData;

        [3, format ["Oversized vehicle position: %1, classname: %2", str _position, _selectedVehicle], "fn_garrison_rollOversizeVehicle", true] call A3A_fnc_log;
    } else {
        [1, format ["%1 has not enough vehicles, oversized vehicle will be not spawned.", str _side], "fn_garrison_rollOversizeVehicle", true] call A3A_fnc_log;
    };  
};

_return