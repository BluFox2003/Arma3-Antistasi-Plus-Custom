params ["_constructionType"];

#define K_UP 200
#define K_DOWN 208

private _fileName = "build_prepareAndStartConstruction";

if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {
    ["Construction", "You can't build while placing something."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (player != player getVariable ["owner",player]) exitWith {
    ["Construction", "You cannot buy vehicles while you are controlling AI."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (isNil "constructionInProgress") then {
	constructionInProgress = false;
};

construction_selectedEngineer = objNull;

private _engineers = (units group player) select {_x getUnitTrait "engineer"};
private _playerIsEngineer = false;
private _otherPlayerEngineers = [];
private _aiEngineers = [];
private _abortMessage = "";

{
	if (_x getUnitTrait "engineer") then {
		if (isPlayer _x) then {
			if (player == _x) then {
				_playerIsEngineer = true;
			} else {
				_otherPlayerEngineers pushBack _x;
			};
		} else {
			//AI Engineer
			_aiEngineers pushBack _x;
		};
	};
} forEach units group player;

private _engineerIsBusy = {
	private _engineer = param [0, objNull];
	((_engineer getVariable ["helping",false])
	or (_engineer getVariable ["rearming",false])
	or (_engineer getVariable ["constructing",false]));
};

//Check if the player can build
if (_playerIsEngineer) then {
	if ([player] call A3A_fnc_canFight && !([player] call _engineerIsBusy)) then {
		construction_selectedEngineer = player;
	} else {
		_abortMessage = _abortMessage + "You are an engineer, but not in a state to build: you may be unconscious or undercover.<br/>";
	};
} else {
	_abortMessage =	_abortMessage + "You are not an engineer.<br/>";
};

//Check if an engineer can build.
if (isNull construction_selectedEngineer && count _otherPlayerEngineers > 0) then {
	construction_selectedEngineer = _otherPlayerEngineers select 0;
	_abortMessage = _abortMessage + "There is a human engineer in your squad. Ask them to build.<br/>";
};

if (isNull construction_selectedEngineer) then {
	if (count _aiEngineers > 0 && player != leader player) exitWith {
		_abortMessage =	_abortMessage + "Only squad leaders can order AI to build";
	};

    {
        if ([_x] call A3A_fnc_canFight && !([_x] call _engineerIsBusy)) exitWith {
            construction_selectedEngineer = _x;
            _abortMessage = _abortMessage + format ["Ordering %1 to build", _x];
        };
    } forEach _aiEngineers;

	if (isNull construction_selectedEngineer) exitWith {
		_abortMessage =	_abortMessage + "You have no available engineers in your squad. They may be unconscious or busy.";
	};
};

if (isNull construction_selectedEngineer ||((player != construction_selectedEngineer) and (isPlayer construction_selectedEngineer))) exitWith {
	["Build", _abortMessage] call A3A_fnc_customHint;
};

if (_constructionType == "CONCRETE_BUNKER" && {{sidesX getVariable [_x,sideUnknown] == teamPlayer} count factories < 3}) exitWith {
    ["Build", "Concrete bunkers requires 3 captured factories to build."] call A3A_fnc_customHint;
};

construction_buildingsAvailable = [];
construction_buildingIndex = 0;
construction_cost = 0;
construction_buildTime = 0;
construction_type = _constructionType;

switch(_constructionType) do {
    case("TRENCH"): {
        construction_buildingsAvailable = ["Land_SandbagBarricade_01_half_F", "Land_SandbagBarricade_01_F", "Land_BasaltKerb_01_pile_F", "Land_SandbagBarricade_01_hole_F", "Land_BagFence_01_long_green_F", "Land_BagFence_Round_F", "Land_BagFence_Long_F", "Land_BagFence_01_round_green_F"];
        construction_cost = 50;
        construction_buildTime = 30;
    };
    case("OBSTACLE"): {
        construction_buildingsAvailable = ["Land_DragonsTeeth_01_1x1_old_F", "Land_Barricade_01_10m_F", "Land_Barricade_01_4m_F", "Land_GarbageWashingMachine_F", "Land_Fortress_01_bricks_v1_F", "Land_Fortress_01_bricks_v2_F","Land_WoodPile_large_F", "Land_JunkPile_F", "Land_WoodPile_F", "Land_Razorwire_F"];
        construction_cost = 50;
        construction_buildTime = 25;
    };
    case("SANDBAG_BUNKER"): {
        construction_buildingsAvailable = ["Land_BagBunker_01_small_green_F", "Fort_Nest", "Land_BagBunker_Large_F"];
        construction_cost = 250;
        construction_buildTime = 60;
    };
    case("CONCRETE_BUNKER"): {
        construction_buildingsAvailable = ["Land_Bunker_02_light_left_F", "Land_Bunker_02_light_right_F", "Land_PillboxBunker_01_hex_F", "Land_PillboxBunker_01_big_F", "Land_PillboxBunker_01_rectangle_F"];
        construction_cost = 500;
        construction_buildTime = 90;
    };
    case("MISC"): {
        construction_buildingsAvailable = ["CamoNet_BLUFOR_F", "CamoNet_BLUFOR_open_F", "CamoNet_BLUFOR_big_F", "Land_CanvasCover_02_F", "Land_CanvasCover_01_F", "Land_LampShabby_F"];
        construction_cost = 10;
        construction_buildTime = 20;
    };
    default { 
        [1, format ["Bad Construction Type - %1 ", _constructionType], _fileName] call A3A_fnc_log;
    };
};

if (count construction_buildingsAvailable < 1) exitWith {
    [3, "Unable to select buildings pool, exiting function.", _fileName] call A3A_fnc_log;
    construction_buildingsAvailable = nil;
    construction_buildingIndex = nil;
    construction_cost = nil; 
    construction_selectedEngineer = nil;
    construction_buildTime = nil;
    construction_type = nil;
};

private _sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
private _playerPosition = position player;
construction_nearestFriendlyMarker = [_sites,_playerPosition] call BIS_fnc_nearestPosition;
if (_constructionType in ["SANDBAG_BUNKER", "CONCRETE_BUNKER"] && {!(_playerPosition inArea construction_nearestFriendlyMarker)}) exitWith {
    ["Construction", "You cannot build a bunker outside a controlled zone."] call SCRT_fnc_misc_showDeniedActionHint;
	construction_buildingsAvailable = nil;
    construction_buildingIndex = nil;
    construction_cost = nil; 
    construction_selectedEngineer = nil;
    construction_buildTime = nil;
    construction_type = nil;
};

private _initialType = construction_buildingsAvailable select construction_buildingIndex;

//We define this once and never remove it
//Because removing handlers can cause the IDs other handlers to change, stopping them being removed.
if (isNil "construction_keyDownHandler") then {
	construction_keyDownHandler = (findDisplay 46) displayAddEventHandler ["KeyDown",
	{
		if (!constructionInProgress) exitWith {false;};
		private _handled = false;
		private _leave = false;
		//Next type
		if (_this select 1 == K_UP) then {
			_handled = true;
			if (construction_buildingIndex + 1 > (count construction_buildingsAvailable) - 1) then {
                construction_buildingIndex = 0;
            } else {
                construction_buildingIndex = construction_buildingIndex + 1;
            };

			private _type = construction_buildingsAvailable select construction_buildingIndex;
			[_type] call A3A_fnc_vehPlacementChangeVehicle;
		};

		//Previous vehicle
		if (_this select 1 == K_DOWN) then {
			_handled = true;
			if (construction_buildingIndex - 1 < 0) then {
                construction_buildingIndex = (count construction_buildingsAvailable) - 1;
            } else {
                construction_buildingIndex = construction_buildingIndex - 1;
            };
            
		    private _type = construction_buildingsAvailable select construction_buildingIndex;
			[_type] call A3A_fnc_vehPlacementChangeVehicle;
		};
		_handled;
	}];
};

private _money = player getVariable "moneyX";

if (_money < construction_cost) exitWith {
    ["Construction", format ["You do not have enough money for this vehicle: %1 € required", construction_cost]] call SCRT_fnc_misc_showDeniedActionHint;
    construction_buildingsAvailable = nil;
    construction_buildingIndex = nil;
    construction_cost = nil; 
    construction_selectedEngineer = nil;
    construction_buildTime = nil;
    construction_type = nil;
};

private _extraMessage = format ["Use Arrow Up-Down Keys to Switch Building Type.<br/> Building construction for $%1", construction_cost];

construction_handleDamageHandler = player addEventHandler ["HandleDamage",{[] call A3A_fnc_vehPlacementCancel;nil;}];

constructionInProgress = true;

[["UpdateState", "Builds field construction"]] call SCRT_fnc_misc_updateRichPresence;

[_initialType, "BUILDSTRUCTURE", _extraMessage] call A3A_fnc_vehPlacementBegin;