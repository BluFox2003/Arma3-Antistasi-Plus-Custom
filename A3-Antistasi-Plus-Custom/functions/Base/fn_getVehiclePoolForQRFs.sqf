/*  Returns a weighted and balanced vehicle pool for the given side and filter

    Execution on: All

    Scope: External

    Params:
        _side: SIDE : The side for which the vehicle pool should be used
        _filter: ARRAY of STRINGS : The bases classes of units that should be filtered out (for example ["LandVehicle"] or ["Air"])

    Returns:
        _vehiclePool: ARRAY : [vehicleName, weight, vehicleName2, weight2]
*/

params ["_side", ["_filter", []]];

private _fileName = "getVehiclePoolForQRFs";
private _vehicleSelection = [];

[3, format ["Now searching for QRF vehicle pool for %1 with filter %2", _side, _filter], _fileName] call A3A_fnc_log;
//In general is Invaders always a bit less chill than the occupants, they will use heavier vehicles more often and earlier
switch (tierWar) do
{
    //General idea: Send only ground units as players should be able to loot and grab the crate before the enemy arrives with a QRF
    // JJ: As of 2.3-prerelease, this function is always called with either an air or ground filter, so air/ground balancing is not valid
    case (1):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehPoliceCars, 40],
                [vehFIACars, 30],
                [vehFIATrucks, 20],
                [vehFIAArmedCars, 10],

                [vehNATOPatrolHeli, 100]
            ];
        };
        if(_side == Invaders) then
        {
            if (gameMode == 4) then {
                _vehicleSelection =
                [
                    [vehPoliceCars, 40],
                    [vehWAMCars, 30],
                    [vehWAMTrucks, 20],
                    [vehWAMArmedCars, 10],

                    [vehCSATPatrolHeli, 100]
                ];
            } else {
                _vehicleSelection =
                [
                    [vehWAMCars, 40],
                    [vehWAMTrucks, 40],
                    [vehWAMArmedCars, 20],

                    [vehCSATPatrolHeli, 100]
                ];
            };
        };
    };
    //General idea: Enemies get airborne, police units are reduced and replaced by military units
    case (2):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehPoliceCars, 15],
                [vehFIACars, 15],
                [vehFIAArmedCars, 10],
                [vehFIATrucks, 25],
                [vehFIAAPC, 5],

                [vehNATOPatrolHeli, 100]
            ];
        };
        if(_side == Invaders) then
        {
            if (gameMode == 4) then {
                _vehicleSelection =
                [
                    [vehPoliceCars, 15],
                    [vehWAMCars, 20],
                    [vehWAMArmedCars, 30],
                    [vehWAMTrucks, 40],
                    [vehWAMAPC, 10],

                    [vehCSATPatrolHeli, 80],
                    [vehCSATTransportHelis, 20]
                ];
            } else {
                _vehicleSelection =
                [
                    [vehWAMCars, 20],
                    [vehWAMTrucks, 40],
                    [vehWAMArmedCars, 30],
                    [vehWAMAPC, 10],

                    [vehCSATPatrolHeli, 80],
                    [vehCSATTransportHelis, 20]
                ];
            };
        };
    };
    //General idea: No police units any more, armed vehicles and first sightings of APCs
    case (3):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehFIACars, 10],
                [vehFIAArmedCars, 20],
                [vehFIATrucks, 40],
                [vehFIAAPC, 10],
                [vehFIATanks, 5],

                [vehNATOPatrolHeli, 80],
                [vehNATOTransportHelis, 20]
            ];
        };
        if(_side == Invaders) then
        {
            if (gameMode == 4) then {
                _vehicleSelection =
                [
                    [vehWAMCars, 5],
                    [vehWAMArmedCars, 45],
                    [vehWAMTrucks, 30],
                    [vehWAMAPC, 20],
                    [vehWAMTanks, 5],

                    [vehCSATPatrolHeli, 60],
                    [vehCSATTransportHelis, 40]
                ];
            } else {
                 _vehicleSelection =
                [
                    [vehWAMCars, 5],
                    [vehWAMTrucks, 30],
                    [vehWAMArmedCars, 45],
                    [vehWAMAPC, 20],
                    [vehWAMTanks, 5],

                    [vehCSATPatrolHeli, 60],
                    [vehCSATTransportHelis, 40]
                ];
            };
        };
    };
    //General idea: Unarmed vehicles vanish, trucks start to get replaced by APCs, first sighting of transport helicopters
    case (4):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehFIAArmedCars, 35],
                [vehFIATrucks, 40],
                [vehFIAAPC, 25],
                [vehFIATanks, 15],

                [vehNATOPatrolHeli, 50],
                [vehNATOTransportHelis, 50]
            ];
        };
        if(_side == Invaders) then
        {
            if (gameMode == 4) then {
                _vehicleSelection =
                [
                    [vehWAMTrucks, 10],
                    [vehWAMArmedCars, 40],
                    [vehWAMAPC, 40],
                    [vehWAMTanks, 15],

                    [vehCSATPatrolHeli, 40],
                    [vehCSATTransportHelis, 50],
                    [vehCSATAttackHelis, 10]
                ];
            } else {
                _vehicleSelection =
                [
                    [vehWAMTrucks, 10],
                    [vehWAMArmedCars, 40],
                    [vehWAMAPC, 40],
                    [vehWAMTanks, 15],

                    [vehCSATPatrolHeli, 40],
                    [vehCSATTransportHelis, 50],
                    [vehCSATAttackHelis, 10]
                ];
            };
        };
    };
    //General idea: Get rid of any unarmed vehicle, Invaders start to bring the big guns
    case (5):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOLightArmed, 30],
                [vehNATOTrucks, 25],
                [vehNATOAPC, 35],
                [vehNATOTanks, 10],

                [vehNATOPatrolHeli, 30],
                [vehNATOTransportHelis, 60],
                [vehNATOAttackHelis, 10]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATTrucks, 10],
                [vehCSATLightArmed, 30],
                [vehCSATAPC, 40],
                [vehCSATTanks, 20],

                [vehCSATPatrolHeli, 25],
                [vehCSATTransportHelis, 50],
                [vehCSATTransportPlanes, 10],
                [vehCSATAttackHelis, 15]
            ];
        };
    };
    //General idea: No light vehicles any more, Invaders start to bring attack helicopter
    case (6):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOLightArmed, 25],
                [vehNATOTrucks, 15],
                [vehNATOAPC, 45],
                [vehNATOTanks, 15],

                [vehNATOPatrolHeli, 20],
                [vehNATOTransportHelis, 60],
                [vehNATOTransportPlanes, 10],
                [vehNATOAttackHelis, 10]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATTrucks, 5],
                [vehCSATLightArmed, 25],
                [vehCSATAPC, 45],
                [vehCSATAA, 5],
                [vehCSATTanks, 20],

                [vehCSATPatrolHeli, 15],
                [vehCSATTransportHelis, 50],
                [vehCSATTransportPlanes, 15],
                [vehCSATAttackHelis, 20]
            ];
        };
    };
    //General idea: Getting rid of light helis, Invaders start the endgame
    case (7):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOTrucks, 10],
                [vehNATOLightArmed, 20],
                [vehNATOAPC, 50],
                [vehNATOAA, 5],
                [vehNATOTanks, 15],

                [vehNATOPatrolHeli, 10],
                [vehNATOTransportHelis, 55],
                [vehNATOTransportPlanes, 20],
                [vehNATOAttackHelis, 15]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATTrucks, 5],
                [vehCSATLightArmed, 25],
                [vehCSATAPC, 40],
                [vehCSATAA, 5],
                [vehCSATTanks, 25],

                [vehCSATPatrolHeli, 10],
                [vehCSATTransportHelis, 40],
                [vehCSATTransportPlanes, 25],
                [vehCSATAttackHelis, 25]
            ];
        };
    };
    //General idea, Occupants start to throw in everything, Invaders upgrade to maximum
    case (8):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOTrucks, 10],
                [vehNATOLightArmed, 15],
                [vehNATOAPC, 50],
                [vehNATOAA, 5],
                [vehNATOTanks, 20],

                [vehNATOPatrolHeli, 10],
                [vehNATOTransportHelis, 40],
                [vehNATOTransportPlanes, 25],
                [vehNATOAttackHelis, 20]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATTrucks, 5],
                [vehCSATLightArmed, 20],
                [vehCSATAPC, 40],
                [vehCSATAA, 10],
                [vehCSATTanks, 25],

                [vehCSATPatrolHeli, 5],
                [vehCSATTransportHelis, 40],
                [vehCSATTransportPlanes, 25],
                [vehCSATAttackHelis, 25]
            ];
        };
    };
    //General idea: Occupants get access to all, invaders start to heavily rely on tanks and attack helis
    case (9):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOTrucks, 5],
                [vehNATOLightArmed, 10],
                [vehNATOAPC, 50],
                [vehNATOAA, 10],
                [vehNATOTanks, 25],

                [vehNATOPatrolHeli, 5],
                [vehNATOTransportHelis, 35],
                [vehNATOTransportPlanes, 25],
                [vehNATOAttackHelis, 25]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATTrucks, 5],
                [vehCSATLightArmed, 10],
                [vehCSATAPC, 40],
                [vehCSATAA, 10],
                [vehCSATTanks, 30],

                [vehCSATPatrolHeli, 5],
                [vehCSATTransportHelis, 35],
                [vehCSATTransportPlanes, 25],
                [vehCSATAttackHelis, 30]
            ];
        };
    };
    //General idea: Occupants finish with a focus on infantry units supported by combat vehicles, while Invaders tend to use heavy armor
    case (10):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOTrucks, 5],
                [vehNATOLightArmed, 5],
                [vehNATOAPC, 50],
                [vehNATOAA, 10],
                [vehNATOTanks, 30],

                [vehNATOPatrolHeli, 5],
                [vehNATOTransportHelis, 30],
                [vehNATOTransportPlanes, 25],
                [vehNATOAttackHelis, 25]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATTrucks, 5],
                [vehCSATLightArmed, 5],
                [vehCSATAPC, 45],
                [vehCSATAA, 10],
                [vehCSATTanks, 35],

                [vehCSATPatrolHeli, 5],
                [vehCSATTransportHelis, 30],
                [vehCSATTransportPlanes, 25],
                [vehCSATAttackHelis, 30]
            ];
        };
    };
};

//Use this function to filter out any unwanted elements
_fn_checkElementAgainstFilter =
{
    params ["_element", "_filter"];

    private _passed = true;
    {
        if(_element isKindOf _x) exitWith
        {
            _passed = false;
            [
                3,
                format ["%1 didnt passed filter %2", _element, _x],
                _fileName
            ] call A3A_fnc_log;
        };
    } forEach _filter;

    _passed;
};

//Break unit arrays down to single vehicles
private _vehiclePool = [];
{
    if((_x select 0) isEqualType []) then
    {
        private _points = 0;
        private _vehicleCount = count (_x select 0);
        if(_vehicleCount != 0) then
        {
            _points = (_x select 1)/_vehicleCount;
        }
        else
        {
            [1, "Found vehicle array with no defined vehicles!", _fileName] call A3A_fnc_log;
        };
        {
            if(([_x, _filter] call _fn_checkElementAgainstFilter) && {[_x] call A3A_fnc_vehAvailable}) then
            {
                _vehiclePool pushBack _x;
                _vehiclePool pushBack _points;
            };
        } forEach (_x select 0);
    }
    else
    {
        if(([_x select 0, _filter] call _fn_checkElementAgainstFilter) && {[_x select 0] call A3A_fnc_vehAvailable}) then
        {
            _vehiclePool pushBack (_x select 0);
            _vehiclePool pushBack (_x select 1);
        };
    };
} forEach _vehicleSelection;

[
    3,
    format ["For %1 and war level %2 selected units are %3, filter was %4", _side, tierWar, _vehiclePool, _filter],
    _fileName
] call A3A_fnc_log;

_vehiclePool;
