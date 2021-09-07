/*
 * This is the first initVar that gets called, and it gets called on both the client and the server.
 * Generally, this should only be constants.
 */

scriptName "initVarCommon.sqf";
private _fileName = "initVarCommon.sqf";
[2,"initVarCommon started",_fileName] call A3A_fnc_log;

antistasiVersion = localize "STR_antistasi_credits_generic_version_text";
antistasiPlusVersion = localize "STR_antistasi_plus_credits_generic_version_text";

////////////////////////////////////
// INITIAL SETTING AND VARIABLES ///
////////////////////////////////////
[2,"Setting initial variables",_fileName] call A3A_fnc_log;													//Sets a log level for feedback, 1=Errors, 2=Information, 3=DEBUG
debug = false;
A3A_customHintEnable = false; // Disables custom hints for boot duration. Is set to true in initClient.

////////////////////////////////////
//     BEGIN SIDES AND COLORS    ///
////////////////////////////////////
[2,"Generating sides",_fileName] call A3A_fnc_log;
if (isNil "teamPlayer") then { teamPlayer = side group petros };
if (teamPlayer == independent) then
	{
	Occupants = west;
	colorTeamPlayer = "colorGUER";
	colorOccupants = "colorBLUFOR";
	respawnTeamPlayer = "respawn_guerrila";
	respawnOccupants = "respawn_west"
	}
else
	{
	Occupants = independent;
	colorTeamPlayer = "colorBLUFOR";
	colorOccupants = "colorGUER";
	respawnTeamPlayer = "respawn_west";
	respawnOccupants = "respawn_guerrila";
	};
posHQ = getMarkerPos respawnTeamPlayer;
Invaders = east;
colorInvaders = "colorOPFOR";

////////////////////////////////////////
//     DECLARING ITEM CATEGORIES     ///
////////////////////////////////////////
[2,"Declaring item categories",_fileName] call A3A_fnc_log;

weaponCategories = ["Rifles", "Handguns", "MachineGuns", "MissileLaunchers", "Mortars", "RocketLaunchers", "Shotguns", "SMGs", "SniperRifles"];
itemCategories = ["Gadgets", "Bipods", "MuzzleAttachments", "PointerAttachments", "Optics", "Binoculars", "Compasses", "FirstAidKits", "GPS", "LaserDesignators",
	"Maps", "Medikits", "MineDetectors", "NVGs", "Radios", "Toolkits", "UAVTerminals", "Watches", "Glasses", "Headgear", "Vests", "Uniforms", "Backpacks"];

magazineCategories = ["MagArtillery", "MagBullet", "MagFlare", "Grenades", "MagLaser", "MagMissile", "MagRocket", "MagShell", "MagShotgun", "MagSmokeShell"];
explosiveCategories = ["Mine", "MineBounding", "MineDirectional"];
otherCategories = ["Unknown"];

//************************************************************************************************************
//ALL ITEMS THAT ARE MEMBERS OF CATEGORIES BELOW THIS LINE **MUST** BE A MEMBER OF ONE OF THE ABOVE CATEGORIES.
//************************************************************************************************************

//Categories that consist only of members of other categories, e.g, 'Weapons' contains items of every category from in weaponCategories;
aggregateCategories = ["Weapons", "Items", "Magazines", "Explosives"];

//All items in here *must* also be a member of one of the above categories.
//These are here because it's non-trivial to identify items in them. They might be a very specific subset of items, or the logic that identifies them might not be perfect.
//It's recommended that these categories be used with caution.
specialCategories = ["AA", "AT", "GrenadeLaunchers", "LightAttachments", "LaserAttachments", "Chemlights", "SmokeGrenades", "LaunchedSmokeGrenades", "LaunchedFlares", "HandFlares", "IRGrenades","LaserBatteries",
	"RebelUniforms", "CivilianUniforms", "BackpacksEmpty", "BackpacksTool", "BackpacksStatic", "BackpacksDevice", "BackpacksRadio", "CivilianVests", "ArmoredVests", "ArmoredHeadgear", "CosmeticHeadgear",
	"CosmeticGlasses"];


allCategoriesExceptSpecial = weaponCategories + itemCategories + magazineCategories + explosiveCategories + otherCategories + aggregateCategories;
allCategories = allCategoriesExceptSpecial + specialCategories;

////////////////////////////////////
//     BEGIN MOD DETECTION       ///
////////////////////////////////////
[2,"Starting mod detection",_fileName] call A3A_fnc_log;
private _modsInfo = getLoadedModsInfo;
allDLCMods = _modsInfo select {_x#2};
allCDLC = _modsInfo select { !(_x#2) && _x#3 };
allmods = _modsInfo - allDLCMods - allCDLC;

// Short Info of loaded mods needs to be added to this array. eg: `A3A_loadedTemplateInfoXML pushBack ["RHS","All factions will be replaced by RHS (AFRF &amp; USAF &amp; GREF)."];`
A3A_loadedTemplateInfoXML = [];

//Mod detection is done locally to each client, in case some clients have different modsets for some reason.
//Radio Detection
A3A_hasTFAR = isClass (configFile >> "CfgPatches" >> "task_force_radio");
A3A_hasACRE = isClass (configFile >> "cfgPatches" >> "acre_main");
A3A_hasTFARBeta = isClass (configFile >> "CfgPatches" >> "tfar_static_radios");
if (A3A_hasTFARBeta) then {A3A_hasTFAR = false};
//ACE Detection
A3A_hasACE = (!isNil "ace_common_fnc_isModLoaded");
A3A_hasACEHearing = isClass (configFile >> "CfgSounds" >> "ACE_EarRinging_Weak");
A3A_hasACEMedical = isClass (configFile >> "CfgSounds" >> "ACE_heartbeat_fast_3");
//Content Mods (Units, Vehicles, Weapons, Clothes etc.)
//These are handled by a script in the Templates folder to keep integrators away from critical code.
call compile preProcessFileLineNumbers "Templates\detector.sqf";

////////////////////////////////////
//        BUILDINGS LISTS        ///
////////////////////////////////////
[2,"Creating building arrays",_fileName] call A3A_fnc_log;

listMilBld = [
	"Land_Cargo_Tower_V1_F",
	"Land_Cargo_Tower_V1_No1_F",
	"Land_Cargo_Tower_V1_No2_F",
	"Land_Cargo_Tower_V1_No3_F",
	"Land_Cargo_Tower_V1_No4_F",
	"Land_Cargo_Tower_V1_No5_F",
	"Land_Cargo_Tower_V1_No6_F",
	"Land_Cargo_Tower_V1_No7_F",
	"Land_Cargo_Tower_V2_F",
	"Land_Cargo_Tower_V3_F",
	"Land_Cargo_Tower_V4_F",
	"Land_vn_b_tower_01",
	"Land_vn_o_shelter_05",
	"Land_vn_bagbunker_01_small_green_f",
	"Land_vn_bagbunker_small_f",
	"Land_vn_o_tower_01","Land_vn_o_tower_02",
	"Land_vn_o_tower_03",
	"Land_vn_hut_tower_01",
	"Land_vn_o_platform_05",
	"Land_vn_o_platform_06",
	"Land_vn_o_snipertree_01",
	"Land_vn_o_snipertree_02",
	"Land_vn_o_snipertree_03",
	"Land_vn_o_snipertree_04",
	"Land_vn_o_platform_01",
	"Land_vn_o_platform_02",
	"Land_vn_o_platform_03",
	"Land_vn_hlaska",
	"Land_vn_b_trench_bunker_04_01",
	"Land_vn_pillboxbunker_02_hex_f",
	"Land_vn_guardtower_01_f",
	"Land_vn_strazni_vez",
	"Land_vn_b_trench_firing_05",
	"Land_vn_cementworks_01_grey_f",
	"Land_vn_cementworks_01_brick_f",
	"Land_vn_radar_01_hq_f",
	"Land_vn_a_office01",
	"land_bunker_garage",
	"Land_Hlidac_budka",
	"Land_Bunker_01_big_F",
	"Land_Bunker_01_tall_F",
	"Land_Bunker_01_small_F",
	"Land_Bunker_01_HQ_F",
	"Land_Mil_House",
	"Land_aif_strazni_vez",
	"Land_aif_hlaska",
	"Land_MBG_Killhouse_2",
	"WarfareBDepot",
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_HQ_V2_F",
	"Land_Cargo_HQ_V3_F",
	"Land_Cargo_HQ_V4_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Patrol_V2_F",
	"Land_Cargo_Patrol_V3_F",
	"Land_Cargo_Patrol_V4_F",
	"Land_HelipadSquare_F",
	"Land_HelipadCivil_F",
	"Land_HelipadCircle_F",
	"Land_BludpadCircle",
	"Land_Posed",
	"Land_Hlaska",
	"Land_fortified_nest_small_EP1",
	"Land_fortified_nest_small",
	"Fort_Nest",
	"Fortress1",
	"Land_GuardShed",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_01_small_green_F",
	"Land_Radar_01_HQ_F",
	"Land_Barracks_06_F",
	"Land_ControlTower_02_F",
	"Land_ControlTower_01_F",
	"Land_GuardHouse_02_F",
	"Land_GuardHouse_02_grey_F",
	"Land_ServiceHangar_01_L_F",
	"Land_ServiceHangar_01_R_F",
	"Land_MobileRadar_01_radar_F",
	"Land_i_Barracks_V1_F",
	"Land_i_Barracks_V2_F",
	"Land_u_Barracks_V2_F",
	"Land_Barracks_01_dilapidated_F",
	"Land_Barracks_01_grey_F",
	"Land_Barracks_01_camo_F",
	"land_gm_euro_barracks_02_win",
	"land_gm_euro_barracks_02",
	"land_gm_euro_barracks_01_win",
	"land_gm_euro_barracks_01",
	"land_gm_tower_bt_6_fuest_80",
	"land_gm_tower_bt_11_60",
	"land_gm_sandbags_02_bunker_high",
	"land_gm_woodbunker_01_bags",
	"land_gm_euro_misc_viewplatform_01",
	"Land_Vez",
	"Land_Hlaska",
	"Land_Posed",
	"Land_Strazni_vez",
	"Land_HBarrierTower_F",
	"Land_HBarrier_01_big_tower_green_F",
	"Land_Fort_Watchtower_EP1",
	"Land_Fort_Watchtower",
	"Land_HBarrier_01_tower_green_F",
	"Land_BagBunker_Tower_F",
	"Land_BagBunker_Large_F",
	"Land_fortified_nest_big_EP1",
	"Land_fortified_nest_big",
	"Land_BagBunker_01_large_green_F"
];

UPSMON_Bld_remove = ["Bridge_PathLod_base_F","Land_Slum_House03_F","Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Bridge_01_F","Land_Bridge_Asphalt_F","Land_Bridge_Concrete_F","Land_Bridge_HighWay_F","Land_Canal_Wall_Stairs_F","warehouse_02_f","cliff_wall_tall_f","cliff_wall_round_f","containerline_02_f","containerline_01_f","warehouse_01_f","quayconcrete_01_20m_f","airstripplatform_01_f","airport_02_terminal_f","cliff_wall_long_f","shop_town_05_f","Land_ContainerLine_01_F","Land_MilOffices_V1_F","Land_vn_b_trench_bunker_01_01","Land_vn_mil_barracks_i_ep1","Land_vn_barracks_03_f","Land_vn_barracks_01","Land_vn_b_trench_bunker_02_01","Land_vn_b_trench_bunker_02_02","Land_vn_hootch_01_12","Land_vn_hootch_01_11","Land_vn_barracks_02_f","Land_vn_hootch_01_01","Land_vn_barracks_05_f","Land_vn_barracks_04_f","Land_vn_barracks_03_01","Land_vn_barracks_03","Land_vn_barracks_03_02","Land_vn_b_trench_bunker_02_04","Land_vn_b_trench_bunker_02_03","Land_vn_b_trench_bunker_01_02","Land_vn_hootch_01_02","Land_vn_hootch_02_11","Land_vn_hootch_02_01","Land_vn_hootch_02_02","Land_vn_hootch_01_03","Land_vn_hootch_02_03","Land_vn_hootch_01_13","Land_vn_barracks_03_04","Land_vn_barracks_03_03","Land_vn_b_trench_bunker_03_02","Land_vn_b_trench_bunker_03_01","Land_vn_quonset_02_01","Land_vn_quonset_02","Land_vn_quonset_01","Land_vn_hootch_01","Land_vn_hootch_02","Land_vn_barracks_02","Land_vn_barracks_02_01","Land_vn_barracks_04","Land_vn_b_trench_bunker_03_03","Land_vn_tent_mash_01_01","Land_vn_tent_mash_01_02","Land_vn_tent_01_03","Land_vn_tent_01_01","Land_vn_tent_01_02","Land_vn_tent_01_04","Land_vn_barracks_04_01","Land_vn_barracks_04_02","Land_vn_b_trench_bunker_01_03","Land_vn_b_trench_bunker_03_04","Land_vn_tent_mash_01_04","Land_vn_tent_02_01","Land_vn_tent_02_02","Land_vn_tent_mash_01","Land_vn_tent_mash_02_03","Land_vn_tent_mash_02_04","Land_vn_hut_old02","Land_vn_tent_02_04","Land_vn_tent_02_03","Land_vn_tent_mash_02_02","Land_vn_tent_mash_02_01","Land_vn_tent_mash_01_03","Land_vn_army_hut_storrage","Land_vn_army_hut_int","Land_vn_wf_field_hospital_east","Land_vn_army_hut2_int","Land_vn_army_hut3_long_int", "Land_vn_o_prop_cong_cage_01", "Land_vn_o_prop_cong_cage_02", "Land_vn_o_prop_cong_cage_03"];
//Lights and Lamps array used for 'Blackout'
lamptypes = ["Lamps_Base_F", "PowerLines_base_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_LampShabby_F","Land_NavigLight","Land_runway_edgelight","Land_PowerPoleWooden_L_F"];

////////////////////////////////////
//     SOUNDS AND ANIMATIONS     ///
////////////////////////////////////
[2,"Compiling sounds and animations",_fileName] call A3A_fnc_log;

private _missionRootPathNodes = str missionConfigFile splitString "\";
A3A_missionRootPath = (_missionRootPathNodes select [0,count _missionRootPathNodes -1] joinString "\") + "\";

A3A_sounds_dogBark = ["Music\dog_bark01.wss", "Music\dog_bark02.wss", "Music\dog_bark04.wss", "Music\dog_bark05.wss", "Music\dog_maul01.wss", "Music\dog_yelp02.wss"] apply {A3A_missionRootPath + _x};
injuredSounds =  // Todo: migrate functions to A3A_sounds_callMedic
[
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_20_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_21_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_22_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_23_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_24_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_25_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_26_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_27_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_28_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_29_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_30_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_31_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_32_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_33_words.wss",
	"a3\sounds_f\characters\human-sfx\Person2\P2_moan_19_words.wss"
];
A3A_sounds_moan = injuredSounds;

A3A_sounds_soundInjured_low = [];
A3A_sounds_soundInjured_mid = [];
A3A_sounds_soundInjured_max = [];

coughSounds = [
	"A3\Sounds_f\characters\human-sfx\Person0\P0_choke_02.wss",
    "A3\Sounds_f\characters\human-sfx\Person0\P0_choke_03.wss",
    "A3\Sounds_f\characters\human-sfx\Person0\P0_choke_04.wss",
    "A3\Sounds_f\characters\human-sfx\Person1\P1_choke_04.wss",
    "A3\Sounds_f\characters\human-sfx\Person2\P2_choke_04.wss",
    "A3\Sounds_f\characters\human-sfx\Person2\P2_choke_05.wss",
    "A3\Sounds_f\characters\human-sfx\Person3\P3_choke_02.wss",
    "A3\Sounds_f\characters\human-sfx\P06\Soundbreathinjured_Max_2.wss",
    "A3\Sounds_f\characters\human-sfx\P05\Soundbreathinjured_Max_5.wss"
];

gasMasks = [
	"G_RegulatorMask_F",
	"G_AirPurifyingRespirator_01_F",
	"G_AirPurifyingRespirator_02_sand_F",
	"G_AirPurifyingRespirator_02_olive_F",
	"G_AirPurifyingRespirator_02_black_F"
];

private _soundPersonParent = "a3\sounds_f\characters\human-sfx\";
for "_person" from 1 to 18 do {
	private _personFolder = str _person;
	if (_person < 10) then { _personFolder = "0" + _personFolder; };
	private _personFolder = "P" + _personFolder + "\";
	{
		private _soundList = missionNamespace getVariable ["A3A_sounds_soundInjured_" + _x, []];
		for "_level" from 1 to 5 do {
			_soundList pushBack (_soundPersonParent + _personFolder + "Soundinjured_"+_x+"_"+str _level+".wss");
		};
	} forEach ["Low","Mid","Max"];
};

belongings = [
	"Land_Document_01_F",
	"Land_File1_F",
	"Land_FilePhotos_F",
	"Land_File2_F",
	"Land_File_research_F",
	"Land_Notepad_F",
	"Land_PenBlack_F",
	"Land_TacticalBacon_F",
	"Land_TinContainer_F",
	"Land_Magazine_rifle_F",
	"Land_Antimalaricum_01_F",
	"Land_Bandage_F",
	"MedicalGarbage_01_FirstAidKit_F",
	"Land_Map_F",
	"Land_Map_unfolded_Malden_F",
	"Land_Matches_F",
	"Land_CanOpener_F"
];

noArtilleryComputerVehicles = [];

if (A3A_has3CBFactions) then {
	noArtilleryComputerVehicles append [
		"\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\wheeled\UK3CB_Factions_Vehicles_hilux\uk3cb_hilux_rocket.p3d",
		"\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\wheeled\UK3CB_Factions_Vehicles_hilux\uk3cb_hilux_rocket_arty.p3d",
		"\rhsafrf\addons\rhs_bmd\rhs_bmd1rock.p3d"
	];
};

if (A3A_hasCup) then {
	noArtilleryComputerVehicles append [
		"\CUP\WheeledVehicles\CUP_WheeledVehicles_Hilux\hiluxV2_UB32",
		"\CUP\WheeledVehicles\CUP_WheeledVehicles_Hilux\hiluxV2_MLRS",
		"\CUP\WheeledVehicles\CUP_WheeledVehicles_Hilux\hiluxV2_armored_MLRS",
		"\CUP\WheeledVehicles\CUP_WheeledVehicles_Hilux\hiluxV2_armored_UB32"
	];
};

flaresPool = if (A3A_hasCup) then {
	["CUP_F_40mm_Star_White", "CUP_F_40mm_Star_Red"]
} else {
	if (A3A_hasRhs) then {
		["rhsusf_40mm_white", "rhsusf_40mm_green", "rhs_mag_m662_red"]
	} else {
		["F_40mm_white", "F_40mm_Red", "F_40mm_Yellow"]
	};
};

flareSounds = ["A3\Sounds_F\weapons\Flare_Gun\flaregun_1.wss", "A3\Sounds_F\weapons\Flare_Gun\flaregun_2.wss"];

medicAnims = ["AinvPknlMstpSnonWnonDnon_medic_1","AinvPknlMstpSnonWnonDnon_medic0","AinvPknlMstpSnonWnonDnon_medic1","AinvPknlMstpSnonWnonDnon_medic2"];

radioSoundsIn = ["a3\dubbing_radio_f\sfx\in2a.ogg", "a3\dubbing_radio_f\sfx\in2b.ogg", "a3\dubbing_radio_f\sfx\in2c.ogg"];
radioSoundsMid = ["a3\dubbing_radio_f\sfx\radionoise1.ogg", "a3\dubbing_radio_f\sfx\radionoise2.ogg", "a3\dubbing_radio_f\sfx\radionoise3.ogg"];
radioSoundsOut = ["a3\dubbing_radio_f\sfx\out2a.ogg", "a3\dubbing_radio_f\sfx\out2b.ogg", "a3\dubbing_radio_f\sfx\out2c.ogg"];

////////////////////////////////////
//     ID LIST FOR UNIT NAMES    ///
////////////////////////////////////
[2,"Creating unit identities",_fileName] call A3A_fnc_log;
arrayids = ["Anthis","Costa","Dimitirou","Elias","Gekas","Kouris","Leventis","Markos","Nikas","Nicolo","Panas","Rosi","Samaras","Thanos","Vega"];
if (isMultiplayer) then {arrayids = arrayids + ["protagonista"]};
[2,"initVarCommon completed",_fileName] call A3A_fnc_log;
