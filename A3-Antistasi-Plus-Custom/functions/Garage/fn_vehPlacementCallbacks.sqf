#include "defineGarage.inc"

params ["_callbackTarget", "_callbackType", ["_callbackParams", []]];

/*
CALLBACK_VEH_PLACED_SUCCESSFULLY - Passed the created vehicle, no return needed. Only called if vehicle successfully created.
CALLBACK_VEH_PLACEMENT_CANCELLED - No parameters, no return needed
CALLBACK_SHOULD_CANCEL_PLACEMENT - Passed a temporary preview vehicle, return format [shouldCancel: bool, messageOnCancel: string]
CALLBACK_CAN_PLACE_VEH - Passed position, direction and vehicle class, return format [canPlace: bool, messageOnUnableTo: string]
CALLBACK_VEH_PLACEMENT_CLEANUP - Passed nothing, no return needed. Called just before vehicle placement totally finishes. Should always be called.
CALLBACK_VEH_IS_VALID_LOCATION - Passed position, direction and vehicle class. Return format [canPlace: bool, messageOnUnableTo: string]
CALLBACK_VEH_CUSTOM_CREATE_VEHICLE - Given a class, position and direction. Return vehicle created.
*/

switch (_callbackTarget) do {
	case "BUYFIA": {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
				[] call SCRT_fnc_misc_updateRichPresence;
			};

			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
			};

			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
				if (!(player inArea vehiclePurchase_nearestMarker)) exitWith {
					[true, "You need to be close to the flag to be able to purchase a vehicle"];
				};
				[false];
			};

			case CALLBACK_VEH_IS_VALID_LOCATION: {
				private _pos = _callbackParams select 0;
				private _maxDist = [50,150] select ((_callbackParams select 2) isKindOf "Ship");
				if (_pos distance2d (getMarkerPos vehiclePurchase_nearestMarker) > _maxDist) exitWith
				{
					[false, format ["This vehicle must be placed within %1m of the flag", _maxDist]];
				};
				[true];
			};

			case CALLBACK_CAN_PLACE_VEH: {
				if (!(player inArea vehiclePurchase_nearestMarker)) exitWith
				{
					[false, "You need to be close to one of your garrisons to be able to retrieve a vehicle from your garage"];
				};
				if ([player,300] call A3A_fnc_enemyNearCheck) exitWith
				{
					[false, "You cannotbuy vehicles with enemies nearby"];
				};
				[true];
			};

			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				private _purchasedVeh = _callbackParams param [0];
				private _typeVehX = typeOf _purchasedVeh;

				[_purchasedVeh, teamPlayer] call A3A_fnc_AIVEHinit;
				if !(_purchasedVeh isKindOf "StaticWeapon") then { [_purchasedVeh] spawn A3A_fnc_vehDespawner };

				if (_purchasedVeh isKindOf "Car") then {_purchasedVeh setPlateNumber format ["%1",name player]};

				private _factionMoney = server getVariable "resourcesFIA";

				if (player == theBoss && {vehiclePurchase_cost <= _factionMoney}) then {
					[0,(-1 * vehiclePurchase_cost)] remoteExec ["A3A_fnc_resourcesFIA",2];
				}
				else {
					[-1 * vehiclePurchase_cost] call A3A_fnc_resourcesPlayer;
					_purchasedVeh setVariable ["ownerX",getPlayerUID player,true];
					playSound "3DEN_notificationDefault";
				};

				if (_purchasedVeh isKindOf "StaticWeapon") then {staticsToSave pushBackUnique _purchasedVeh; publicVariable "staticsToSave"};

				player reveal _purchasedVeh;
				petros directSay "SentGenBaseUnlockVehicle";
			};

			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				_createdVehicle = 0;
                _createdVehicle = [_vehicleType, _pos, _dir] call A3A_fnc_placeEmptyVehicle;
				_createdVehicle;
			};
		};
	};

	case "BUYVEHICLEMARKET": {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
				[] call SCRT_fnc_misc_updateRichPresence;
			};

			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
			};

			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
				if (player distance2d traderX > 50) exitWith {
					[true, "You need to be close to the trader to be able to purchase a vehicle"];
				};
				[false];
			};

			case CALLBACK_VEH_IS_VALID_LOCATION: {
				private _pos = _callbackParams select 0;
				private _maxDist = [50,150] select ((_callbackParams select 2) isKindOf "Ship");
				if (_pos distance2d traderX > _maxDist) exitWith
				{
					[false, format ["This vehicle must be placed within %1m of the flag", _maxDist]];
				};
				[true];
			};

			case CALLBACK_CAN_PLACE_VEH: {
				if ((player distance2d traderX > 50)) exitWith  {
					[false, "You need to be close to Arms Dealer to be able to buy vehicle."];
				};
				if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {
					[false, "You cannotbuy vehicles with enemies nearby"];
				};
				[true];
			};

			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				private _purchasedVeh = _callbackParams param [0];
				private _typeVehX = typeOf _purchasedVeh;

				[_purchasedVeh, teamPlayer] call A3A_fnc_AIVEHinit;

				if (_purchasedVeh isKindOf "Car") then {_purchasedVeh setPlateNumber format ["%1",name player]};

				//Handle Money
				if (!isMultiplayer) then {
					[0,(-1 * vehiclePurchase_cost)] spawn A3A_fnc_resourcesFIA;
				}
				else {
					_factionMoney = server getVariable "resourcesFIA";

					if (player == theBoss && {vehiclePurchase_cost <= _factionMoney}) then {
						_nul = [0,(-1 * vehiclePurchase_cost)] remoteExec ["A3A_fnc_resourcesFIA",2];
					}
					else {
						[-1 * vehiclePurchase_cost] call A3A_fnc_resourcesPlayer;
						_purchasedVeh setVariable ["ownerX",getPlayerUID player,true];
						playSound "3DEN_notificationDefault";
					};
				};

				player reveal _purchasedVeh;
			};

			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				_createdVehicle = 0;
                _createdVehicle = [_vehicleType, _pos, _dir] call A3A_fnc_placeEmptyVehicle;
				_createdVehicle;
			};
		};
	};

	case "BUILDSTRUCTURE": {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
				constructionInProgress = false;
				construction_handleDamageHandler =	player removeEventHandler ["HandleDamage", construction_handleDamageHandler];
				[] call SCRT_fnc_misc_updateRichPresence;
			};

			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
				["Construction", "Construction cancelled"] call A3A_fnc_customHint;
			};

			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
				[false];
			};

			case CALLBACK_VEH_IS_VALID_LOCATION: {
				private _pos =	_callbackParams param [0];
				switch (construction_type) do {
					case "CONCRETE_BUNKER": {
						[_pos inArea construction_nearestFriendlyMarker, "Bunkers can only be built off roads, in friendly areas."];
					};
					default {
						[true];
					};
				};
			};

			case CALLBACK_CAN_PLACE_VEH: {
				[true];
			};

			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
			};

			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				[_vehicleType, _pos, _dir] spawn A3A_fnc_buildCreateVehicleCallback;
				//Explcitly return nil. We're letting the spawned script handle building from here.
				nil;
			};
		};
	};

	case "CREATELOOTCRATE": {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
			};

			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
			};

			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
			};

			case CALLBACK_VEH_IS_VALID_LOCATION: {
			};

			case CALLBACK_CAN_PLACE_VEH: {
			};

			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				private _purchasedVeh = _callbackParams param [0];
				private _typeVehX = typeOf _purchasedVeh;

				[_purchasedVeh, teamPlayer] call A3A_fnc_AIVEHinit;

				//Handle Money
				_factionMoney = server getVariable "resourcesFIA";

				if (player == theBoss && {vehiclePurchase_cost <= _factionMoney}) then {
					[0,(-1 * vehiclePurchase_cost)] remoteExec ["A3A_fnc_resourcesFIA",2];
				}
				else {
					[-1 * vehiclePurchase_cost] call A3A_fnc_resourcesPlayer;
					_purchasedVeh setVariable ["ownerX",getPlayerUID player,true];
					playSound "3DEN_notificationDefault";
				};

				[_purchasedVeh, false] remoteExec ["allowDamage", 0, _purchasedVeh];
				[_purchasedVeh] call SCRT_fnc_loot_addLootCrateActions;
			};

			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				_createdVehicle = 0;
                _createdVehicle = [_vehicleType, _pos, _dir] call A3A_fnc_placeEmptyVehicle;
				_createdVehicle;
			};
		};
	};

	case "CREATERALLYPOINT": {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
			};

			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
			};

			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
			};

			case CALLBACK_VEH_IS_VALID_LOCATION: {
			};

			case CALLBACK_CAN_PLACE_VEH: {
				if ([player, 50] call A3A_fnc_enemyNearCheck) exitWith {
					[false, "The surrounding area is occupied by enemy, find different place."];
				};
				[true];
			};

			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				private _purchasedVeh = _callbackParams param [0];
				private _typeVehX = typeOf _purchasedVeh;

				[_purchasedVeh, teamPlayer] call A3A_fnc_AIVEHinit;

				_factionMoney = server getVariable "resourcesFIA";

				if (player == theBoss && {vehiclePurchase_cost <= _factionMoney}) then {
					[0,(-1 * vehiclePurchase_cost)] remoteExec ["A3A_fnc_resourcesFIA",2];
				}
				else {
					[-1 * vehiclePurchase_cost] call A3A_fnc_resourcesPlayer;
					_purchasedVeh setVariable ["ownerX",getPlayerUID player,true];
				};

				isRallyPointPlaced = true;
    			publicVariable "isRallyPointPlaced";

				petros sideRadio "SentGenBaseUnlockRespawn";

				private _announceText = format ["<t size='0.6'><t size='0.6' color='#008000'>Rally point </t> has been established.</t>"];
    			[petros, "support", _announceText] remoteExec ["A3A_fnc_commsMP", 0];
			};

			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				_createdVehicle = 0;
                _createdVehicle = [_pos, _dir] call SCRT_fnc_rally_placeRallyPoint;
				_createdVehicle;
			};
		};
	};

	default {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
				//No return needed
			};

			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
				//No return needed
			};

			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
				[false];
			};

			case CALLBACK_VEH_IS_VALID_LOCATION: {
				[true];
			};

			case CALLBACK_CAN_PLACE_VEH: {
				[true];
			};

			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				//No return needed.
			};

			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				diag_log format ["%1 %2 %3", _vehicleType, _pos, _dir];
				_createdVehicle = 0;
                _createdVehicle = [_vehicleType, _pos, _dir] call A3A_fnc_placeEmptyVehicle;
                _createdVehicle;
			};
		};
	};
};
