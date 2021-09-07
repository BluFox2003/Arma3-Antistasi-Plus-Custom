/*  This loop checks if condition for random game events are 
    Execution on: Server

    Scope: Internal

    Params:
        None

    Returns:
        Nothing
*/

//Random event types
#define CIV_HELI 100
#define POLICE 200
#define VEH_MOVE 300
#define VEH_PATROL 400
#define VEH_POSTAMBUSH 500

if(!isServer) exitWith {};

private _fileName = "fn_encounter_gameEventLoop";
[2, "Random Events Loop Init.", _filename] call A3A_fnc_log;

isEventInProgress = false;

private _chance = 5;

while {true} do {
    sleep 600;
    if (isEventInProgress) then {  
        [2, "Random event in progress, waiting...", _filename] call A3A_fnc_log; 
        waitUntil {sleep 30; !isEventInProgress};
    };
    if (count (allPlayers - (entities "HeadlessClient_F")) == 0) then {
        waitUntil {sleep 30; (count (allPlayers - (entities "HeadlessClient_F")) > 0)};
    };

    private _isEventProcced = if ((random 100) < _chance) then {true} else {false};

    if (_isEventProcced) then {
        [2, format ["Event check successful, had the %1 chance.", str _chance], _filename] call A3A_fnc_log;  
        isEventInProgress = true;
        _chance = 0;

        private _eventType = selectRandomWeighted [
            CIV_HELI, 0.2, 
            POLICE, 0.2,
            VEH_MOVE, 0.2, 
            VEH_PATROL, 0.2,
            VEH_POSTAMBUSH, 0.2
        ];

        switch (_eventType) do {
            case (CIV_HELI): {
                [[], "SCRT_fnc_encounter_civHeli"] call A3A_fnc_scheduler;
            };
            case (POLICE): {
                [[], "SCRT_fnc_encounter_police"] call A3A_fnc_scheduler;
            };
            case (VEH_MOVE): {
                [[], "SCRT_fnc_encounter_vehicleMove"] call A3A_fnc_scheduler;
            };
            case (VEH_PATROL): {
                [[], "SCRT_fnc_encounter_vehiclePatrol"] call A3A_fnc_scheduler;
            };
            case (VEH_POSTAMBUSH): {
                [[], "SCRT_fnc_encounter_postAmbush"] call A3A_fnc_scheduler;
            };
        };
    } else {
        [2, format ["Event doesn't rolled, current roll chance: %1.", str _chance], _filename] call A3A_fnc_log;
        _chance = _chance + 5;
    };
};
