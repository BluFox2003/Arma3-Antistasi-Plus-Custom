//Define results for small intel
#define TIME_LEFT       101
#define DECRYPTION_KEY  102
#define CONVOY          103

//Define results for medium intel
#define ACCESS_ARMOR    200
#define ACCESS_AIR      201
#define ACCESS_HELI     202
#define CONVOYS         203
#define COUNTER_ATTACK  204
#define CONVOY_ROUTE    205

//Define results for large intel
#define WEAPON          300
#define TRAITOR         301
#define MONEY           302

//Define results for (mostly) any intel
#define TASK          500
#define DISCOUNT      501

params ["_intelType", "_side"];

/*  Selects, creates and executes the intel of the given type and side
*   Params:
*       _intelType : STRING : One of "Small", "Medium" or "Large"
*       _side : SIDE : The enemy side, which the intel belongs to
*
*   Returns:
*       _text : STRING : The text of the selected intel
*/

private _fileName = "selectIntel";
if(isNil "_intelType") exitWith
{
    [1, "No intel type given!", _fileName] call A3A_fnc_log;
};
if(isNil "_side") exitWith
{
    [1, "No side given!", _fileName] call A3A_fnc_log;
};

private _text = "";
private _sideName = "";
private _intelContent = "";
if(_side == Occupants) then
{
    _sideName = nameOccupants
}
else
{
    _sideName = nameInvaders
};

if(_intelType == "Small") then
{
    _intelContent = selectRandomWeighted [TIME_LEFT, 0.25, DECRYPTION_KEY, 0.25, CONVOY, 0.2, TASK, 0.25, DISCOUNT, 0.05];

    switch (_intelContent) do
    {
        case (TIME_LEFT):
        {
            private _nextAttack = 0;
            if(_side == Occupants) then
            {
                _nextAttack = attackCountdownOccupants + (random 600) - 300;
            }
            else
            {
                _nextAttack = attackCountdownInvaders + (random 600) - 300;
            };
            private _sideName = if (_side == Occupants) then {nameOccupants} else {nameInvaders};
            if(_nextAttack < 300) then
            {
                _text = format ["%1 attack is imminent!", _sideName];
            }
            else
            {
                _text = format ["%1 attack expected in %2 minutes", _sideName, round (_nextAttack / 60)];
            };
        };
        case (DECRYPTION_KEY):
        {
            if(_side == Occupants) then
            {
                occupantsRadioKeys = occupantsRadioKeys + 1;
                publicVariable "occupantsRadioKeys";
            }
            else
            {
                invaderRadioKeys = invaderRadioKeys + 1;
                publicVariable "invaderRadioKeys";
            };
            _text = format ["You found a %1 decryption key!<br/>It allows your faction to fully decrypt the next support call.", _sideName];
        };
        case (CONVOY):
        {
            private _convoyMarker = "";
            [] call A3A_fnc_cleanConvoyMarker;
            if(_side == Occupants) then
            {
                _convoyMarker = (server getVariable ["convoyMarker_Occupants", []]);
            }
            else
            {
                _convoyMarker = (server getVariable ["convoyMarker_Invaders", []]);
            };
            if(count _convoyMarker != 0) then
            {
                (selectRandom _convoyMarker) setMarkerAlpha 1;
                _text = format ["We found the tracking data for a %1 convoy.<br/>Convoy position marked on map!", _sideName];
            }
            else
            {
                _text = format ["There are currently no %1 convoys driving around!", _sideName];
            };
        };
        case (TASK):
        {
            _isTaskCreated = [] call SCRT_fnc_quest_rollTask;
            if(_isTaskCreated) then {
                _worldName = [] call SCRT_fnc_misc_getWorldName;
                _text = format ["We found some valuable information about events are happening on the %1 right now.", _worldName];
            } else {
                [2, "Rerolling small intel outcome", _fileName] call A3A_fnc_log;

                _rerollIntelContent = selectRandomWeighted [TIME_LEFT, 0.3, DECRYPTION_KEY, 0.35, CONVOY, 0.35];

                switch (_rerollIntelContent) do {
                    case (TIME_LEFT):
                    {
                        private _nextAttack = 0;
                        if(_side == Occupants) then
                        {
                            _nextAttack = attackCountdownOccupants + (random 600) - 300;
                        }
                        else
                        {
                            _nextAttack = attackCountdownInvaders + (random 600) - 300;
                        };
                        private _sideName = if (_side == Occupants) then {nameOccupants} else {nameInvaders};
                        if(_nextAttack < 300) then
                        {
                            _text = format ["%1 attack is imminent!", _sideName];
                        }
                        else
                        {
                            _text = format ["%1 attack expected in %2 minutes", _sideName, round (_nextAttack / 60)];
                        };
                    };
                    case (DECRYPTION_KEY):
                    {
                        if(_side == Occupants) then
                        {
                            occupantsRadioKeys = occupantsRadioKeys + 1;
                            publicVariable "occupantsRadioKeys";
                        }
                        else
                        {
                            invaderRadioKeys = invaderRadioKeys + 1;
                            publicVariable "invaderRadioKeys";
                        };
                        _text = format ["You found a %1 decryption key!<br/>It allows your faction to fully decrypt the next support call.", _sideName];
                    };
                    case (CONVOY):
                    {
                        private _convoyMarker = "";
                        [] call A3A_fnc_cleanConvoyMarker;
                        if(_side == Occupants) then
                        {
                            _convoyMarker = (server getVariable ["convoyMarker_Occupants", []]);
                        }
                        else
                        {
                            _convoyMarker = (server getVariable ["convoyMarker_Invaders", []]);
                        };
                        if(count _convoyMarker != 0) then
                        {
                            (selectRandom _convoyMarker) setMarkerAlpha 1;
                            _text = format ["We found the tracking data for a %1 convoy.<br/>Convoy position marked on map!", _sideName];
                        }
                        else
                        {
                            _text = format ["There are currently no %1 convoys driving around!", _sideName];
                        };
                    };
                };
            };
        };
        case (DISCOUNT):
        {
            if (!(isTraderQuestCompleted || (!(isNil "isTraderQuestAssigned") && {isTraderQuestAssigned}))) then {
                [] call SCRT_fnc_quest_rollTask;
                _worldName = [] call SCRT_fnc_misc_getWorldName;
                _text = format ["We found some valuable information about important events on the %1.", _worldName];
            } else {
                private _discount = traderDiscount + 0.01;
                [_discount] call SCRT_fnc_trader_setTraderDiscount;

                _text = format ["We found some information about undiscovered hidden smuggler routes and gave them to Arms Dealer. In return, he payed us for information and gave us a %1 percent discount for any weapon in his Arms Dealer store.", _discount * 100];
            };
        };
    };
};
if(_intelType == "Medium") then
{
    if (!(isTraderQuestCompleted || (!(isNil "isTraderQuestAssigned") && {isTraderQuestAssigned}))) then {
        _intelContent = TASK;
    } else {
        _intelContent = selectRandomWeighted [ACCESS_AIR, 0.2, ACCESS_HELI, 0.2, ACCESS_ARMOR, 0.15, CONVOYS, 0.15, CONVOY_ROUTE, 0.2, DISCOUNT, 0.1];
    };

    switch (_intelContent) do
    {
        case (ACCESS_AIR):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_AIR] call A3A_fnc_getVehicleIntel)];
        };
        case (ACCESS_HELI):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_HELI] call A3A_fnc_getVehicleIntel)];
        };
        case (ACCESS_ARMOR):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_ARMOR] call A3A_fnc_getVehicleIntel)];
        };
        case (CONVOYS):
        {
            [] call A3A_fnc_cleanConvoyMarker;
            private _convoyMarkers = [];
            if(_side == Occupants) then
            {
                _convoyMarkers = server getVariable ["convoyMarker_Occupants", []];
            }
            else
            {
                _convoyMarkers = server getVariable ["convoyMarker_Invaders", []];
            };
            {
                _x setMarkerAlpha 1;
            } forEach _convoyMarkers;
            _text = format ["We found the %1 convoy GPS decryption key!<br/>%2 convoys are marked on the map", _sideName, count _convoyMarkers];
        };
        case (DISCOUNT):
        {
            if (!(isTraderQuestCompleted || (!(isNil "isTraderQuestAssigned") && {isTraderQuestAssigned}))) then {
                [] call SCRT_fnc_quest_rollTask;
                _worldName = [] call SCRT_fnc_misc_getWorldName;
                _text = format ["We found some valuable information about important events on the %1.", _worldName];
            } else {
                private _discount = traderDiscount + 0.05;
                [_discount] call SCRT_fnc_trader_setTraderDiscount;

                _text = format ["We found some information about undiscovered hidden smuggler routes and gave them to Arms Dealer. In return, he payed us for information and gave us a %1 percent discount for any weapon in his Arms Dealer store.", _discount * 100];
            };
        };
        case (CONVOY_ROUTE):
        {
            if (!("CONVOY" in A3A_activeTasks) && !bigAttackInProgress) then
			{
                private _potentials = (outposts + milbases + airportsX + resourcesX + factories);
	            _potentials = _potentials select { sidesX getVariable [_x, sideUnknown] != teamPlayer };
                private _site = [_potentials, petros] call BIS_fnc_nearestPosition;
				private _base = [_site] call A3A_fnc_findBasesForConvoy;
                private _fromName = [_base] call A3A_fnc_localizar;
                private _toName = [_site] call A3A_fnc_localizar;
                _text = format ["We found some information about possible convoy route from %1 to %2. We can prepare an ambush on it.", _fromName, _toName];
                if (_base != "") then {
					[[_site,_base, "", -1, true],"A3A_fnc_convoy"] call A3A_fnc_scheduler;
				};
			} else {
                _worldName = [] call SCRT_fnc_misc_getWorldName;
                _text = format ["We found some outdated information about possible convoy routes on %1. We sold it on a black market for miniscule amount of money.", _worldName];
                private _money = (round (random 10)) * 100;
                [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];    
            };
        };
        case (TASK):
        {
            _isTaskCreated = [] call SCRT_fnc_quest_rollTask;
            if(_isTaskCreated) then {
                _worldName = toUpper([worldName, 0, 0] call BIS_fnc_trimString) + ([worldName, 1, count worldName] call BIS_fnc_trimString);
                _text = format ["We found some valuable information about events on the %1.", _worldName];
            } else {
                [2, "Rerolling medium intel outcome", _fileName] call A3A_fnc_log;

                private _rerollIntelContent = selectRandomWeighted [ACCESS_AIR, 0.2, ACCESS_HELI, 0.2, ACCESS_ARMOR, 0.2, CONVOYS, 0.2, CONVOY_ROUTE, 0.2, COUNTER_ATTACK, 0];

                switch (_rerollIntelContent) do {
                    case (ACCESS_AIR):
                    {
                        _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_AIR] call A3A_fnc_getVehicleIntel)];
                    };
                    case (ACCESS_HELI):
                    {
                        _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_HELI] call A3A_fnc_getVehicleIntel)];
                    };
                    case (ACCESS_ARMOR):
                    {
                        _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_ARMOR] call A3A_fnc_getVehicleIntel)];
                    };
                    case (CONVOYS):
                    {
                        [] call A3A_fnc_cleanConvoyMarker;
                        private _convoyMarkers = [];
                        if(_side == Occupants) then
                        {
                            _convoyMarkers = server getVariable ["convoyMarker_Occupants", []];
                        }
                        else
                        {
                            _convoyMarkers = server getVariable ["convoyMarker_Invaders", []];
                        };
                        {
                            _x setMarkerAlpha 1;
                        } forEach _convoyMarkers;
                        _text = format ["We found the %1 convoy GPS decryption key!<br/>%2 convoys are marked on the map", _sideName, count _convoyMarkers];
                    };
                    case (COUNTER_ATTACK):
                    {
                        //Not yet implemented, needs a rework of the attack script
                    };
                };
            };
        };
    };
};
if(_intelType == "Large") then
{
    if (!(isTraderQuestCompleted || (!(isNil "isTraderQuestAssigned") && {isTraderQuestAssigned}))) then {
        _intelContent = TASK;
    } else {
        if ("AS" in A3A_activeTasks) then {
            _intelContent = selectRandomWeighted [TRAITOR, 0.1, WEAPON, 0.1, MONEY, 0.15, TASK, 0.5, DISCOUNT, 0.15];
        } else {
            _intelContent = selectRandomWeighted [WEAPON, 0.1, MONEY, 0.25, TASK, 0.5, DISCOUNT, 0.15];
        };
    };

    switch (_intelContent) do
    {
        case (TRAITOR):
        {
            _text = "You found data on the family of the traitor, we don't think he will do any more trouble";
            traitorIntel = true; publicVariable "traitorIntel";
        };
        case (WEAPON):
        {
            private _notYetUnlocked = allWeapons - unlockedWeapons;
            private _newWeapon = selectRandom _notYetUnlocked;
            [_newWeapon] remoteExec ["A3A_fnc_unlockEquipment", 2];

            private _weaponName = getText (configFile >> "CfgWeapons" >> _newWeapon >> "displayName");
            _text = format ["You found the supply data for the<br/> %1<br/> You have unlocked this weapon!", _weaponName];
        };
        case (MONEY):
        {
            private _money = ((round (random 50)) + (10 * tierWar)) * 100;
            _text = format ["You found some confidential data, you sold it for %1 on the black market!", _money];
            [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];
        };
        case (TASK):
        {
            _isTaskCreated = [] call SCRT_fnc_quest_rollTask;
            if(_isTaskCreated) then {
                _worldName = toUpper([worldName, 0, 0] call BIS_fnc_trimString) + ([worldName, 1, count worldName] call BIS_fnc_trimString);
                _text = format ["We found some valuable information about important events on the %1.", _worldName];
            } else {
                [2, "Rerolling large intel outcome", _fileName] call A3A_fnc_log;

                private _rerollIntelContent = "";

                if("AS" in A3A_activeTasks) then {
                    _rerollIntelContent = selectRandomWeighted [TRAITOR, 0.3, WEAPON, 0.3, MONEY, 0.4];
                }
                else {
                    _rerollIntelContent = selectRandomWeighted [WEAPON, 0.4, MONEY, 0.6];
                };

                switch (_rerollIntelContent) do {
                    case (TRAITOR):
                    {
                        _text = "You found data on the family of the traitor, we don't think he will do any more trouble";
                        traitorIntel = true; publicVariable "traitorIntel";
                    };
                    case (WEAPON):
                    {
                        private _notYetUnlocked = allWeapons - unlockedWeapons;
                        private _newWeapon = selectRandom _notYetUnlocked;
                        [_newWeapon] remoteExec ["A3A_fnc_unlockEquipment", 2];

                        private _weaponName = getText (configFile >> "CfgWeapons" >> _newWeapon >> "displayName");
                        _text = format ["You found the supply data for the<br/> %1<br/> You have unlocked this weapon!", _weaponName];
                    };
                    case (MONEY):
                    {
                        private _money = ((round (random 50)) + (10 * tierWar)) * 100;
                        _text = format ["You found some confidential data, you sold it for %1 on the black market!", _money];
                        [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];
                    };
                };
            };
        };
        case (DISCOUNT):
        {
            if (!(isTraderQuestCompleted || (!(isNil "isTraderQuestAssigned") && {isTraderQuestAssigned}))) then {
                [] call SCRT_fnc_quest_rollTask;
                _worldName = toUpper([worldName, 0, 0] call BIS_fnc_trimString) + ([worldName, 1, count worldName] call BIS_fnc_trimString);
                _text = format ["We found some valuable information about important events on the %1.", _worldName];
            } else {
                private _discount = traderDiscount + 0.1;
                [_discount] call SCRT_fnc_trader_setTraderDiscount;

                private _money = (round (random 50)) * 100;
                [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];

                _text = format ["We found some information about undiscovered hidden smuggler routes and gave them to Arms Dealer. In return, he payed us for information and gave us a %1 percent discount for any weapon in his Arms Dealer store.", _discount * 100];
            };
        };
    };
};

_text;
