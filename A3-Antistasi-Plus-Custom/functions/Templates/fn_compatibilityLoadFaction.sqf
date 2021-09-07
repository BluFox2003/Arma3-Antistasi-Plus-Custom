/*
 * File: fn_compatabilityLoadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file, and transforms it into the old global variable system for sides.
 * Params:
 *    _file - Faction definition file path
 *    _side - Side to load them in as
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */
private _fileName = "fn_compatabilityLoadFaction";

params ["_file", "_side"];

[2, format ["Compatibility loading template: '%1' as side %2", _file, _side], _fileName] call A3A_fnc_log;

private _factionDefaultFile = ["EnemyDefaults","EnemyDefaults","RebelDefaults","CivilianDefaults"] #([west, east, independent, civilian] find _side);
_factionDefaultFile = "Templates\NewTemplates\FactionDefaults\" + _factionDefaultFile + ".sqf";

private _faction = [[_factionDefaultFile,_file]] call A3A_fnc_loadFaction;
private _factionPrefix = ["occ", "inv", "reb", "civ"] #([west, east, independent, civilian] find _side);
missionNamespace setVariable ["A3A_faction_" + _factionPrefix, _faction, true];  // ["A3A_faction_occ", "A3A_faction_inv", "A3A_faction_reb", "A3A_faction_civ"]

private _baseUnitClass = switch (_side) do {
	case west: { "B_G_Soldier_F" };
	case east: { "O_G_Soldier_F" };
	case independent: { "I_G_Soldier_F" };
	case civilian: { "C_Man_1" };
};

private _unitClassMap = createHashMapFromArray (_faction getVariable "baseSoldiers");

//Register loadouts globally.
private _loadoutsPrefix = format ["loadouts_%1_", _factionPrefix];
private _allDefinitions = _faction getVariable "loadouts";

{
		private _loadoutName = _x;
		private _definition = _allDefinitions getVariable _loadoutName;
		private _unitClass = _unitClassMap getOrDefault [_loadoutName, _baseUnitClass];
		[_loadoutsPrefix + _loadoutName, _definition + [_unitClass]] call A3A_fnc_registerUnitType;
} forEach allVariables _allDefinitions;

if (_side isEqualTo east) then {
	nameInvaders = _faction getVariable "name";

	//Flag images
	CSATFlag = _faction getVariable "flag";
	CSATFlagTexture = _faction getVariable "flagTexture";
	flagCSATmrk = _faction getVariable "flagMarkerType";
	if (isServer) then {
		"CSAT_carrier" setMarkerText (_faction getVariable "spawnMarkerName");
		"CSAT_carrier" setMarkerType flagCSATmrk;
	};

	//Loot crate
	CSATAmmoBox = _faction getVariable "ammobox";
    CSATSurrenderCrate = _faction getVariable "surrenderCrate";
    CSATEquipmentBox = _faction getVariable "equipmentBox";

	//PVP Loadouts
	CSATPlayerLoadouts = _faction getVariable "pvpLoadouts";
	vehCSATPVP = _faction getVariable "pvpVehicles";

	CSATGrunt = ["loadouts_inv_militia_Rifleman", "loadouts_inv_military_Rifleman", "loadouts_inv_elite_Rifleman"];
	CSATOfficer = "loadouts_inv_other_Official";
	CSATOfficer2 = "loadouts_inv_other_Traitor";
	CSATCrew = "loadouts_inv_other_Crew";
	CSATMarksman = ["loadouts_inv_militia_Marksman", "loadouts_inv_military_Marksman", "loadouts_inv_elite_Marksman"];
	staticCrewInvaders = CSATGrunt;
	CSATPilot = "loadouts_inv_other_Pilot";
	CSATUnarmed = "loadouts_inv_other_Unarmed";

	WAMRifleman = "loadouts_inv_militia_Rifleman";
	WAMMarksman = "loadouts_inv_militia_Marksman";

	groupsCSATSentry = [
		["loadouts_inv_militia_Grenadier", "loadouts_inv_militia_Rifleman"],
		["loadouts_inv_military_Grenadier", "loadouts_inv_military_Rifleman"],
		["loadouts_inv_elite_Grenadier", "loadouts_inv_elite_LAT"]
	];
	//TODO Change Rifleman to spotter.
	groupsCSATSniper = [
		["loadouts_inv_militia_Sniper", "loadouts_inv_militia_Rifleman"],
		["loadouts_inv_military_Sniper", "loadouts_inv_military_Rifleman"],
		["loadouts_inv_elite_Sniper", "loadouts_inv_elite_Rifleman"]
	];
	//TODO Create lighter Recon loadouts, and add a group of them to here.
	groupsCSATSmall = [groupsCSATSentry, groupsCSATSniper];
	//TODO Add ammobearers
	groupsCSATAA = [
		["loadouts_inv_militia_SquadLeader", "loadouts_inv_militia_Rifleman", "loadouts_inv_militia_AA", "loadouts_inv_militia_AA"],
		["loadouts_inv_military_SquadLeader", "loadouts_inv_military_Rifleman", "loadouts_inv_military_AA", "loadouts_inv_military_AA"],
		["loadouts_inv_elite_SquadLeader", "loadouts_inv_elite_Rifleman", "loadouts_inv_elite_AA", "loadouts_inv_elite_AA"]
	];
	groupsCSATAT = [
		["loadouts_inv_militia_SquadLeader", "loadouts_inv_militia_LAT", "loadouts_inv_militia_AT", "loadouts_inv_militia_AT"],
		["loadouts_inv_military_SquadLeader", "loadouts_inv_military_LAT", "loadouts_inv_military_AT", "loadouts_inv_military_AT"],
		["loadouts_inv_elite_SquadLeader", "loadouts_inv_elite_LAT", "loadouts_inv_elite_AT", "loadouts_inv_elite_AT"]
	];
	private _groupsCSATMediumSquad = [
		["loadouts_inv_militia_SquadLeader","loadouts_inv_militia_MachineGunner","loadouts_inv_militia_Grenadier", "loadouts_inv_militia_Radioman", "loadouts_inv_militia_LAT"],
		["loadouts_inv_military_SquadLeader","loadouts_inv_military_MachineGunner","loadouts_inv_military_Grenadier", "loadouts_inv_military_Radioman", "loadouts_inv_military_LAT"],
		["loadouts_inv_elite_SquadLeader","loadouts_inv_elite_MachineGunner","loadouts_inv_elite_Grenadier","loadouts_inv_elite_Radioman", "loadouts_inv_elite_LAT"]
	];
	groupsCSATmid = [_groupsCSATMediumSquad, groupsCSATAA, groupsCSATAT];

	groupsCSATSquadT1 = [];
	for "_i" from 1 to 5 do {
		groupsCSATSquadT1 pushBack [
			"loadouts_inv_militia_SquadLeader",
			selectRandomWeighted ["loadouts_inv_militia_LAT", 2, "loadouts_inv_militia_MachineGunner", 1],
			selectRandomWeighted ["loadouts_inv_militia_Rifleman", 2, "loadouts_inv_militia_Grenadier", 1],
			selectRandomWeighted ["loadouts_inv_militia_MachineGunner", 2, "loadouts_inv_militia_Marksman", 1],
			selectRandomWeighted ["loadouts_inv_militia_AT", 2, "loadouts_inv_militia_LAT", 1],
			selectRandomWeighted ["loadouts_inv_militia_AA", 1, "loadouts_inv_militia_Engineer", 3],
			selectRandomWeighted ["loadouts_inv_militia_Rifleman", 1, "loadouts_inv_militia_Radioman", 1],
			"loadouts_inv_militia_Medic"
		];
	};

	groupsCSATSquadT2 = [];
	for "_i" from 1 to 5 do {
		groupsCSATSquadT2 pushBack [
			"loadouts_inv_military_SquadLeader",
			selectRandomWeighted ["loadouts_inv_military_LAT", 2, "loadouts_inv_military_MachineGunner", 1],
			selectRandomWeighted ["loadouts_inv_military_Rifleman", 2, "loadouts_inv_military_Grenadier", 1],
			selectRandomWeighted ["loadouts_inv_military_MachineGunner", 2, "loadouts_inv_military_Marksman", 1],
			selectRandomWeighted ["loadouts_inv_military_AT", 2, "loadouts_inv_military_LAT", 1],
			selectRandomWeighted ["loadouts_inv_military_AA", 1, "loadouts_inv_military_Engineer", 3],
			selectRandomWeighted ["loadouts_inv_military_Rifleman", 1, "loadouts_inv_military_Radioman", 1],
			"loadouts_inv_military_Medic"
		];
	};

	groupsCSATSquadT3 = [];
	for "_i" from 1 to 5 do {
		groupsCSATSquadT3 pushBack [
			"loadouts_inv_elite_SquadLeader",
			selectRandomWeighted ["loadouts_inv_elite_LAT", 2, "loadouts_inv_elite_MachineGunner", 1],
			selectRandomWeighted ["loadouts_inv_elite_Rifleman", 2, "loadouts_inv_elite_Grenadier", 1],
			selectRandomWeighted ["loadouts_inv_elite_MachineGunner", 2, "loadouts_inv_elite_Marksman", 1],
			"loadouts_inv_elite_AT",
			selectRandomWeighted ["loadouts_inv_elite_AA", 1, "loadouts_inv_elite_Engineer", 3],
			selectRandomWeighted ["loadouts_inv_elite_Rifleman", 1, "loadouts_inv_elite_Radioman", 1],
			"loadouts_inv_elite_Medic"
		];
	};

	CSATSquad = [(groupsCSATSquadT1 select 0), (groupsCSATSquadT2 select 0), (groupsCSATSquadT3 select 0)];
	CSATSpecOp = [
		"loadouts_inv_SF_SquadLeader",
		"loadouts_inv_SF_Rifleman",
		"loadouts_inv_SF_Radioman",
		"loadouts_inv_SF_Marksman",
		"loadouts_inv_SF_MachineGunner",
		"loadouts_inv_SF_ExplosivesExpert",
		"loadouts_inv_SF_AT",
		"loadouts_inv_SF_LAT",
		"loadouts_inv_SF_Medic"
	];

	groupsWAMSmall = [
		["loadouts_inv_militia_Grenadier", "loadouts_inv_militia_LAT"],
		["loadouts_inv_militia_Marksman", "loadouts_inv_militia_Rifleman"],
		["loadouts_inv_militia_Marksman", "loadouts_inv_militia_Grenadier"]
	];
	groupsWAMMid = [];
	for "_i" from 1 to 6 do {
		groupsWAMMid pushBack [
			"loadouts_inv_militia_SquadLeader",
			"loadouts_inv_militia_Grenadier",
			"loadouts_inv_militia_MachineGunner",
			selectRandomWeighted [
				"loadouts_inv_militia_LAT", 1,
				"loadouts_inv_militia_Marksman", 1,
				"loadouts_inv_militia_Engineer", 1,
				"loadouts_inv_militia_Medic", 1
			]
		];
	};

	groupsWAMSquad = [];
	for "_i" from 1 to 5 do {
		groupsWAMSquad pushBack [
			"loadouts_inv_militia_SquadLeader",
			"loadouts_inv_militia_MachineGunner",
			"loadouts_inv_militia_Grenadier",
			selectRandomWeighted ["loadouts_inv_militia_Rifleman", 1, "loadouts_inv_militia_Radioman", 1],
			selectRandomWeighted ["loadouts_inv_militia_Rifleman", 1, "loadouts_inv_militia_Marksman", 1],
			selectRandomWeighted ["loadouts_inv_militia_Rifleman", 2, "loadouts_inv_militia_Marksman", 1],
			selectRandomWeighted ["loadouts_inv_militia_Rifleman", 1, "loadouts_inv_militia_LAT", 1],
			selectRandomWeighted ["loadouts_inv_militia_AT", 1, "loadouts_inv_militia_LAT", 2],
			"loadouts_inv_militia_Medic"
		];
	};

	vehCSATBike = _faction getVariable "vehiclesBasic" select 0;
	vehCSATLightArmed = _faction getVariable "vehiclesLightArmed";
	vehCSATLightUnarmed = _faction getVariable "vehiclesLightUnarmed";
	vehCSATTrucks = _faction getVariable "vehiclesTrucks";
	vehCSATCargoTrucks = _faction getVariable "vehiclesCargoTrucks";
	vehCSATAmmoTruck = _faction getVariable "vehiclesAmmoTrucks" select 0;
	vehCSATFuelTruck = _faction getVariable "vehiclesFuelTrucks" select 0;
	vehCSATRepairTruck = _faction getVariable "vehiclesRepairTrucks" select 0;
	vehCSATMedical = _faction getVariable "vehiclesMedical" select 0;
	vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;

	vehCSATLightAPC = _faction getVariable "vehiclesLightAPCs";
	vehCSATAPC = _faction getVariable "vehiclesAPCs";
	vehCSATTanks = _faction getVariable "vehiclesTanks";
	vehCSATAA = _faction getVariable "vehiclesAA";
	vehCSATAttack = vehCSATAPC + vehCSATTanks;

	vehCSATBoat = _faction getVariable "vehiclesGunboats" select 0;
	vehCSATRBoat = _faction getVariable "vehiclesTransportBoats" select 0;
	vehCSATBoats = [vehCSATBoat, vehCSATRBoat] + (_faction getVariable "vehiclesAmphibious");

	vehCSATPlanes = _faction getVariable "vehiclesPlanesCAS";
	vehCSATPlanesAA = _faction getVariable "vehiclesPlanesAA";
	vehCSATTransportPlanes = _faction getVariable "vehiclesPlanesTransport";

	vehCSATPatrolHeli = _faction getVariable "vehiclesHelisLight" select 0;
	vehCSATTransportHelis = (_faction getVariable "vehiclesHelisLight") + (_faction getVariable "vehiclesHelisTransport");
	vehCSATAttackHelis = _faction getVariable "vehiclesHelisAttack";

	vehCSATUAV = _faction getVariable "uavsAttack" select 0;
	vehCSATUAVSmall = _faction getVariable "uavsPortable" select 0;

	vehCSATMRLS = _faction getVariable "vehiclesArtillery" select 0 select 0;
	vehCSATMRLSMags = _faction getVariable "vehiclesArtillery" select 0 select 1 select 0;

	vehCSATNormal =
		  vehCSATLight
		+ vehCSATTrucks
		+ (_faction getVariable "vehiclesAmmoTrucks")
		+ (_faction getVariable "vehiclesRepairTrucks")
		+ (_faction getVariable "vehiclesFuelTrucks")
		+ (_faction getVariable "vehiclesMedical");

	vehCSATUtilityTrucks = (_faction getVariable "vehiclesAmmoTrucks") + (_faction getVariable "vehiclesRepairTrucks") + (_faction getVariable "vehiclesFuelTrucks") + (_faction getVariable "vehiclesMedical");

	vehCSATAir =
		  vehCSATTransportHelis
		+ vehCSATAttackHelis
		+ vehCSATPlanes
		+ vehCSATPlanesAA
		+ vehCSATTransportPlanes;

	if (gameMode == 4) then {
		policeOfficer = "loadouts_inv_police_SquadLeader";
		policeGrunt = "loadouts_inv_police_Standard";

		vehPoliceCars = _faction getVariable "vehiclesPolice";
	};

	vehWAMArmedCars = _faction getVariable "vehiclesMilitiaLightArmed";
	vehWAMTrucks = _faction getVariable "vehiclesMilitiaTrucks";
	vehWAMCars = _faction getVariable "vehiclesMilitiaCars";
	vehWAMAPC = _faction getVariable "vehiclesMilitiaApcs";
	vehWAMTanks = _faction getVariable "vehiclesMilitiaTanks";

	CSATMG = _faction getVariable "staticMGs" select 0;
	staticATInvaders = _faction getVariable "staticAT" select 0;
	staticAAInvaders = _faction getVariable "staticAA";
	CSATMortar = _faction getVariable "staticMortars" select 0;
	CSATHowitzer = _faction getVariable "staticHowitzers" select 0;
	CSATmortarMagazineHE = _faction getVariable "mortarMagazineHE";
	CSATHowitzerMagazineHE = _faction getVariable "howitzerMagazineHE";

	MGStaticCSATB = _faction getVariable "baggedMGs" select 0 select 0;
	//TODO: Add tall/short support support.
	supportStaticCSATB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticCSATB2 = _faction getVariable "baggedMGs" select 0 select 1;
	ATStaticCSATB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticCSATB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticCSATB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticCSATB3 = _faction getVariable "baggedMortars" select 0 select 1;

	CSATAARadar = _faction getVariable "vehiclesSam" select 0;
	CSATAASam = _faction getVariable "vehiclesSam" select 1;
};

if (_side isEqualTo west) then {
	nameOccupants = _faction getVariable "name";

	//Flag images
	NATOFlag = _faction getVariable "flag";
	NATOFlagTexture = _faction getVariable "flagTexture";
	flagNATOmrk = _faction getVariable "flagMarkerType";
	if (isServer) then {
		"NATO_carrier" setMarkerText (_faction getVariable "spawnMarkerName");
		"NATO_carrier" setMarkerType flagNATOmrk;
	};

	//Loot crate
	NATOAmmobox = _faction getVariable "ammobox";
    NATOSurrenderCrate = _faction getVariable "surrenderCrate";
    NATOEquipmentBox = _faction getVariable "equipmentBox";

	//PVP Loadouts
	NATOPlayerLoadouts = _faction getVariable "pvpLoadouts";
	vehNATOPVP = _faction getVariable "pvpVehicles";

	NATOGrunt = ["loadouts_occ_militia_Rifleman", "loadouts_occ_military_Rifleman", "loadouts_occ_elite_Rifleman"];
	NATOOfficer = "loadouts_occ_other_Official";
	NATOOfficer2 = "loadouts_occ_other_Traitor";
	NATOCrew = "loadouts_occ_other_Crew";
	NATOUnarmed = "loadouts_occ_other_Unarmed";
	NATOMarksman = ["loadouts_occ_militia_Marksman", "loadouts_occ_military_Marksman", "loadouts_occ_elite_Marksman"];
	staticCrewOccupants = NATOGrunt;
	NATOPilot = "loadouts_occ_other_Pilot";

	FIARifleman = "loadouts_occ_militia_Rifleman";
	FIAMarksman = "loadouts_occ_militia_Marksman";

	groupsNATOSentry = [
		["loadouts_occ_militia_Grenadier", "loadouts_occ_militia_Rifleman"],
		["loadouts_occ_military_Grenadier", "loadouts_occ_military_Rifleman"],
		["loadouts_occ_elite_Grenadier", "loadouts_occ_elite_LAT"]
	];
	//TODO Change Rifleman to spotter.
	groupsNATOSniper = [
		["loadouts_occ_militia_Sniper", "loadouts_occ_militia_Rifleman"],
		["loadouts_occ_military_Sniper", "loadouts_occ_military_Rifleman"],
		["loadouts_occ_elite_Sniper", "loadouts_occ_elite_Rifleman"]
	];

	//TODO Add ammobearers
	groupsNATOAA = [
		["loadouts_occ_militia_SquadLeader", "loadouts_occ_militia_Rifleman", "loadouts_occ_militia_AA", "loadouts_occ_militia_AA"],
		["loadouts_occ_military_SquadLeader", "loadouts_occ_military_Rifleman", "loadouts_occ_military_AA", "loadouts_occ_military_AA"],
		["loadouts_occ_elite_SquadLeader", "loadouts_occ_elite_Rifleman", "loadouts_occ_elite_AA", "loadouts_occ_elite_AA"]
	];
	groupsNATOAT = [
		["loadouts_occ_militia_SquadLeader", "loadouts_occ_militia_Rifleman", "loadouts_occ_militia_AT", "loadouts_occ_militia_AT"],
		["loadouts_occ_military_SquadLeader", "loadouts_occ_military_LAT", "loadouts_occ_military_AT", "loadouts_occ_military_AT"],
		["loadouts_occ_elite_SquadLeader", "loadouts_occ_elite_LAT", "loadouts_occ_elite_AT", "loadouts_occ_elite_AT"]
	];
	private _groupsNATOMediumSquad = [
		["loadouts_occ_militia_SquadLeader","loadouts_occ_militia_MachineGunner","loadouts_occ_militia_Grenadier","loadouts_occ_militia_Radioman","loadouts_occ_militia_LAT"],
		["loadouts_occ_military_SquadLeader","loadouts_occ_military_MachineGunner","loadouts_occ_military_Grenadier","loadouts_occ_military_Radioman","loadouts_occ_military_LAT"],
		["loadouts_occ_elite_SquadLeader","loadouts_occ_elite_MachineGunner","loadouts_occ_elite_Grenadier","loadouts_occ_elite_Radioman","loadouts_occ_elite_LAT"]
	];
	groupsNATOmid = [_groupsNATOMediumSquad, groupsNATOAA, groupsNATOAT];

	groupsNATOSquadT1 = [];
	for "_i" from 1 to 5 do {
		groupsNATOSquadT1 pushBack [
			"loadouts_occ_militia_SquadLeader",
			selectRandomWeighted ["loadouts_occ_militia_LAT", 2, "loadouts_occ_militia_MachineGunner", 1],
			selectRandomWeighted ["loadouts_occ_militia_Rifleman", 2, "loadouts_occ_militia_Grenadier", 1],
			selectRandomWeighted ["loadouts_occ_militia_MachineGunner", 2, "loadouts_occ_militia_Marksman", 1],
			selectRandomWeighted ["loadouts_occ_militia_AT", 2, "loadouts_occ_militia_LAT", 1],
			selectRandomWeighted ["loadouts_occ_militia_AA", 1, "loadouts_occ_militia_Engineer", 3],
			selectRandomWeighted ["loadouts_occ_militia_Rifleman", 1, "loadouts_occ_militia_Radioman", 1],
			"loadouts_occ_militia_Medic"
		];
	};

	groupsNATOSquadT2 = [];
	for "_i" from 1 to 5 do {
		groupsNATOSquadT2 pushBack [
			"loadouts_occ_military_SquadLeader",
			selectRandomWeighted ["loadouts_occ_military_LAT", 2, "loadouts_occ_military_MachineGunner", 1],
			selectRandomWeighted ["loadouts_occ_military_Rifleman", 2, "loadouts_occ_military_Grenadier", 1],
			selectRandomWeighted ["loadouts_occ_military_MachineGunner", 2, "loadouts_occ_military_Marksman", 1],
			selectRandomWeighted ["loadouts_occ_military_AT", 2, "loadouts_occ_military_LAT", 1],
			selectRandomWeighted ["loadouts_occ_military_AA", 1, "loadouts_occ_military_Engineer", 3],
			selectRandomWeighted ["loadouts_occ_military_Rifleman", 1, "loadouts_occ_military_Radioman", 1],
			"loadouts_occ_military_Medic"
		];
	};

	groupsNATOSquadT3 = [];
	for "_i" from 1 to 5 do {
		groupsNATOSquadT3 pushBack [
			"loadouts_occ_elite_SquadLeader",
			selectRandomWeighted ["loadouts_occ_elite_LAT", 2, "loadouts_occ_elite_MachineGunner", 1],
			selectRandomWeighted ["loadouts_occ_elite_Rifleman", 2, "loadouts_occ_elite_Grenadier", 1],
			selectRandomWeighted ["loadouts_occ_elite_MachineGunner", 2, "loadouts_occ_elite_Marksman", 1],
			selectRandomWeighted ["loadouts_occ_elite_AT", 2, "loadouts_occ_elite_LAT", 1],
			selectRandomWeighted ["loadouts_occ_elite_AA", 1, "loadouts_occ_elite_Engineer", 3],
			selectRandomWeighted ["loadouts_occ_elite_Rifleman", 1, "loadouts_occ_elite_Radioman", 1],
			"loadouts_occ_elite_Medic"
		];
	};

	NATOSquad = [(groupsNATOSquadT1 select 0), (groupsNATOSquadT2 select 1), (groupsNATOSquadT3 select 2)];
	NATOSpecOp = [
		"loadouts_occ_SF_SquadLeader",
		"loadouts_occ_SF_Rifleman",
		"loadouts_occ_SF_Radioman",
		"loadouts_occ_SF_Marksman",
		"loadouts_occ_SF_MachineGunner",
		"loadouts_occ_SF_ExplosivesExpert",
		"loadouts_occ_SF_AT",
		"loadouts_occ_SF_LAT",
		"loadouts_occ_SF_Medic"
	];

	groupsFIASmall = [
		["loadouts_occ_militia_Grenadier", "loadouts_occ_militia_Rifleman"],
		["loadouts_occ_militia_Marksman", "loadouts_occ_militia_Rifleman"],
		["loadouts_occ_militia_Marksman", "loadouts_occ_militia_Grenadier"]
	];
	groupsFIAMid = [];
	for "_i" from 1 to 6 do {
		groupsFIAMid pushBack [
			"loadouts_occ_militia_SquadLeader",
			"loadouts_occ_militia_Grenadier",
			"loadouts_occ_militia_MachineGunner",
			selectRandomWeighted [
				"loadouts_occ_militia_LAT", 1,
				"loadouts_occ_militia_Marksman", 1,
				"loadouts_occ_militia_Medic", 1,
				"loadouts_occ_militia_Engineer", 1
			]
		];
	};

	groupsFIASquad = [];
	for "_i" from 1 to 5 do {
		groupsFIASquad pushBack [
			"loadouts_occ_militia_SquadLeader",
			"loadouts_occ_militia_MachineGunner",
			"loadouts_occ_militia_Grenadier",
			selectRandomWeighted ["loadouts_occ_militia_Rifleman", 1, "loadouts_occ_militia_Radioman", 1],
			selectRandomWeighted ["loadouts_occ_militia_Rifleman", 1, "loadouts_occ_militia_Marksman", 1],
			selectRandomWeighted ["loadouts_occ_militia_Rifleman", 2, "loadouts_occ_militia_Marksman", 1],
			selectRandomWeighted ["loadouts_occ_militia_Rifleman", 1, "loadouts_occ_militia_LAT", 1],
			"loadouts_occ_militia_AT",
			"loadouts_occ_militia_Medic"
		];
	};

	vehNATOBike = _faction getVariable "vehiclesBasic" select 0;
	vehNATOLightArmed = _faction getVariable "vehiclesLightArmed";
	vehNATOLightUnarmed = _faction getVariable "vehiclesLightUnarmed";
	vehNATOTrucks = _faction getVariable "vehiclesTrucks";
	vehNATOCargoTrucks = _faction getVariable "vehiclesCargoTrucks";
	vehNATOAmmoTruck = _faction getVariable "vehiclesAmmoTrucks" select 0;
	vehNATOFuelTruck = _faction getVariable "vehiclesFuelTrucks" select 0;
	vehNATORepairTruck = _faction getVariable "vehiclesRepairTrucks" select 0;
	vehNATOMedical = _faction getVariable "vehiclesMedical" select 0;
	vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;

	vehNATOLightAPC = _faction getVariable "vehiclesLightAPCs";
	vehNATOAPC = _faction getVariable "vehiclesAPCs";
	vehNATOTanks = _faction getVariable "vehiclesTanks";
	vehNATOAA = _faction getVariable "vehiclesAA";
	vehNATOAttack = vehNATOAPC + vehNATOTanks;

	vehNATOBoat = _faction getVariable "vehiclesGunboats" select 0;
	vehNATORBoat = _faction getVariable "vehiclesTransportBoats" select 0;
	vehNATOBoats = [vehNATOBoat, vehNATORBoat] + (_faction getVariable "vehiclesAmphibious");

	vehNATOPlanes = _faction getVariable "vehiclesPlanesCAS";
	vehNATOPlanesAA = _faction getVariable "vehiclesPlanesAA";
	vehNATOTransportPlanes = _faction getVariable "vehiclesPlanesTransport";

	vehNATOPatrolHeli = _faction getVariable "vehiclesHelisLight" select 0;
	vehNATOTransportHelis = (_faction getVariable "vehiclesHelisLight") + (_faction getVariable "vehiclesHelisTransport");
	vehNATOAttackHelis = _faction getVariable "vehiclesHelisAttack";

	vehNATOUAV = _faction getVariable "uavsAttack" select 0;
	vehNATOUAVSmall = _faction getVariable "uavsPortable" select 0;

	vehNATOMRLS = _faction getVariable "vehiclesArtillery" select 0 select 0;
	vehNATOMRLSMags = _faction getVariable "vehiclesArtillery" select 0 select 1 select 0;

	vehNATONormal =
		  vehNATOLight
		+ vehNATOTrucks
		+ (_faction getVariable "vehiclesAmmoTrucks")
		+ (_faction getVariable "vehiclesRepairTrucks")
		+ (_faction getVariable "vehiclesFuelTrucks")
		+ (_faction getVariable "vehiclesMedical");

	vehNATOUtilityTrucks = (_faction getVariable "vehiclesAmmoTrucks") + (_faction getVariable "vehiclesRepairTrucks") + (_faction getVariable "vehiclesFuelTrucks") + (_faction getVariable "vehiclesMedical");

	vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + vehNATOPlanes + vehNATOPlanesAA + vehNATOTransportPlanes;

	vehFIAArmedCars = _faction getVariable "vehiclesMilitiaLightArmed";
	vehFIATrucks = _faction getVariable "vehiclesMilitiaTrucks";
	vehFIACars = _faction getVariable "vehiclesMilitiaCars";
	vehFIAAPC = _faction getVariable "vehiclesMilitiaApcs";
	vehFIATanks = _faction getVariable "vehiclesMilitiaTanks";

	if (gameMode != 4) then {
		policeOfficer = "loadouts_occ_police_SquadLeader";
		policeGrunt = "loadouts_occ_police_Standard";

		vehPoliceCars = _faction getVariable "vehiclesPolice";
	};

	NATOMG = _faction getVariable "staticMGs" select 0;
	staticATOccupants = _faction getVariable "staticAT" select 0;
	staticAAOccupants = _faction getVariable "staticAA";
	NATOMortar = _faction getVariable "staticMortars" select 0;
	NATOHowitzer = _faction getVariable "staticHowitzers" select 0;
	NATOmortarMagazineHE = _faction getVariable "mortarMagazineHE";
	NATOHowitzerMagazineHE = _faction getVariable "howitzerMagazineHE";

	MGStaticNATOB = _faction getVariable "baggedMGs" select 0 select 0;
	//TODO: Add tall/short support support.
	supportStaticNATOB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticNATOB2 = _faction getVariable "baggedMGs" select 0 select 1;
	ATStaticNATOB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticNATOB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticNATOB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticNATOB3 = _faction getVariable "baggedMortars" select 0 select 1;

	NATOAARadar = _faction getVariable "vehiclesSam" select 0;
	NATOAASam = _faction getVariable "vehiclesSam" select 1;
};

if (_side isEqualTo independent) then {
	nameTeamPlayer = _faction getVariable "name";

	//Flag images
	SDKFlag = _faction getVariable "flag";
	SDKFlagTexture = _faction getVariable "flagTexture";
	SDKFlagMarkerType = _faction getVariable "flagMarkerType";

	typePetros = "loadouts_reb_militia_Petros";

	staticCrewTeamPlayer = "loadouts_reb_militia_staticCrew";
	SDKUnarmed = "loadouts_reb_militia_Unarmed";
	SDKSniper = "loadouts_reb_militia_sniper";
	SDKATman = "loadouts_reb_militia_lat";
	SDKMedic = "loadouts_reb_militia_medic";
	SDKMG = "loadouts_reb_militia_MachineGunner";
	SDKExp = "loadouts_reb_militia_ExplosivesExpert";
	SDKGL = "loadouts_reb_militia_Grenadier";
	SDKMil = "loadouts_reb_militia_Rifleman";
	SDKSL = "loadouts_reb_militia_SquadLeader";
	SDKEng = "loadouts_reb_militia_Engineer";

	groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
	groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
	groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
	groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
	groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic, staticCrewTeamPlayer, staticCrewTeamPlayer];
	groupsSDKSniper = [SDKSniper,SDKSniper];
	groupsSDKSentry = [SDKGL,SDKMil];
	groupsSDKCrew = [staticCrewTeamPlayer, staticCrewTeamPlayer, SDKEng];

	//Rebel Unit Tiers (for costs)
	sdkTier1 = [SDKMil, staticCrewTeamPlayer, SDKMG, SDKGL, SDKATman];
	sdkTier2 = [SDKMedic, SDKExp, SDKEng];
	sdkTier3 = [SDKSL, SDKSniper];
	soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;

	vehSDKBike = _faction getVariable "vehicleBasic";
	vehSDKLightArmed = _faction getVariable "vehicleLightArmed";
	vehSDKAT = _faction getVariable "vehicleAT";
	vehSDKAA = _faction getVariable "vehicleAA";
	vehSDKLightUnarmed = _faction getVariable "vehicleLightUnarmed";
	vehSDKTruck = _faction getVariable "vehicleTruck";
	vehSDKPlane = _faction getVariable "vehiclePlane";
	vehSDKPayloadPlane = _faction getVariable "vehiclePayloadPlane";
	vehSDKBoat = _faction getVariable "vehicleBoat";
	vehSDKRepair = _faction getVariable "vehicleRepair";
	vehSDKFuel = _faction getVariable "vehicleFuel";

	SDKMGStatic = _faction getVariable "staticMG";
	staticATteamPlayer = _faction getVariable "staticAT";
	staticAAteamPlayer = _faction getVariable "staticAA";
	SDKMortar = _faction getVariable "staticMortar";
	SDKMortarHEMag = _faction getVariable "staticMortarMagHE";
	SDKMortarSmokeMag = _faction getVariable "staticMortarMagSmoke";

	civCar = _faction getVariable "vehicleCivCar";
	civTruck = _faction getVariable "vehicleCivTruck";
	civHeli = _faction getVariable "vehicleCivHeli";
	civBoat = _faction getVariable "vehicleCivBoat";

	MGStaticSDKB = _faction getVariable "baggedMGs" select 0 select 0;
	ATStaticSDKB = _faction getVariable "baggedAT" select 0 select 0;
	AAStaticSDKB = _faction getVariable "baggedAA" select 0 select 0;
	MortStaticSDKB = _faction getVariable "baggedMortars" select 0 select 0;
	supportStaticSDKB = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticsSDKB2 = _faction getVariable "baggedMGs" select 0 select 1;
	supportStaticsSDKB3 = _faction getVariable "baggedMortars" select 0 select 1;

	ATMineMags = _faction getVariable "mineAT";
	APERSMineMags = _faction getVariable "mineAPERS";

	breachingExplosivesAPC = _faction getVariable "breachingExplosivesAPC";
	breachingExplosivesTank = _faction getVariable "breachingExplosivesTank";

	initialRebelEquipment = _faction getVariable "initialRebelEquipment";
};

if (_side isEqualTo civilian) then {
	civVehCommonData = _faction getVariable "vehiclesCivCar";
	civVehRepairData = _faction getVariable "vehiclesCivRepair";
	civVehMedicalData = _faction getVariable "vehiclesCivMedical";
	civVehRefuelData = _faction getVariable "vehiclesCivFuel";
	civBoatData = _faction getVariable "vehiclesCivBoat";
	civVehIndustrialData = _faction getVariable "vehiclesCivIndustrial";
};

_faction;
