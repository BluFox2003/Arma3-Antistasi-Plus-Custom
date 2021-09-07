//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSAT"] call _fnc_saveToTemplate;
["spawnMarkerName", "CSAT Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_CSAT_F"] call _fnc_saveToTemplate;
["flagTexture", "A3\Data_F\Flags\Flag_CSAT_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CSAT"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////
["baseSoldiers", [ // Cases matter. Lower case here because allVariables on namespace returns lowercase
	["militia_squadleader", "O_T_Soldier_SL_F"],
	["militia_rifleman", "O_T_Soldier_F"],
	["militia_radioman", "O_T_Soldier_F"],
	["militia_medic", "O_T_Medic_F"],
	["militia_engineer", "O_T_Engineer_F"],
	["militia_explosivesexpert", "O_T_Soldier_Exp_F"],
	["militia_grenadier", "O_T_Soldier_GL_F"],
	["militia_lat", "O_T_Soldier_LAT_F"],
	["militia_at", "O_T_Soldier_AT_F"],
	["militia_aa", "O_T_Soldier_AA_F"],
	["militia_machinegunner", "O_T_Soldier_AR_F"],
	["militia_marksman", "O_T_Soldier_M_F"],
	["militia_sniper", "O_T_Sniper_F"],

	["military_squadleader", "O_T_Soldier_SL_F"],
	["military_rifleman", "O_T_Soldier_F"],
	["military_radioman", "O_T_Soldier_F"],
	["military_medic", "O_T_Medic_F"],
	["military_engineer", "O_T_Engineer_F"],
	["military_explosivesexpert", "O_T_Soldier_Exp_F"],
	["military_grenadier", "O_T_Soldier_GL_F"],
	["military_lat", "O_T_Soldier_LAT_F"],
	["military_at", "O_T_Soldier_AT_F"],
	["military_aa", "O_T_Soldier_AA_F"],
	["military_machinegunner", "O_T_Soldier_AR_F"],
	["military_marksman", "O_T_Soldier_M_F"],
	["military_sniper", "O_T_Sniper_F"],

	["elite_squadleader", "O_T_Soldier_SL_F"],
	["elite_rifleman", "O_T_Soldier_F"],
	["elite_radioman", "O_T_Soldier_F"],
	["elite_medic", "O_T_Medic_F"],
	["elite_engineer", "O_T_Engineer_F"],
	["elite_explosivesexpert", "O_T_Soldier_Exp_F"],
	["elite_grenadier", "O_T_Soldier_GL_F"],
	["elite_lat", "O_T_Soldier_LAT_F"],
	["elite_at", "O_T_Soldier_AT_F"],
	["elite_aa", "O_T_Soldier_AA_F"],
	["elite_machinegunner", "O_T_Soldier_AR_F"],
	["elite_marksman", "O_T_Soldier_M_F"],
	["elite_sniper", "O_T_Sniper_F"],

	["sf_squadleader", "O_V_Soldier_TL_ghex_F"],
	["sf_rifleman", "O_V_Soldier_ghex_F"],
	["sf_radioman", "O_V_Soldier_ghex_F"],
	["sf_medic", "O_V_Soldier_Medic_ghex_F"],
	["sf_engineer", "O_recon_F"],
	["sf_explosivesexpert", "O_V_Soldier_Exp_ghex_F"],
	["sf_grenadier", "O_T_Soldier_GL_F"],
	["sf_lat", "O_V_Soldier_LAT_ghex_F"],
	["sf_at", "O_V_Soldier_LAT_ghex_F"],
	["sf_aa", "O_T_Soldier_AA_F"],
	["sf_machinegunner", "O_T_Soldier_AR_F"],
	["sf_marksman", "O_V_Soldier_M_ghex_F"],
	["sf_sniper", "O_sniper_F"],

	["other_crew", "O_T_Crew_F"],
	["other_unarmed", "O_T_Soldier_unarmed_F"],
	["other_official", "O_T_Officer_F"],
	["other_traitor", "O_G_Soldier_F"],
	["other_pilot", "O_T_Helipilot_F"],
	["police_squadleader", "O_GEN_Commander_F"],
	["police_standard", "O_GEN_Soldier_F"]
]] call _fnc_saveToTemplate;


//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["O_T_Quadbike_01_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["O_T_MRAP_02_ghex_F", "O_T_LSV_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["O_T_LSV_02_armed_F", "O_T_LSV_02_AT_F", "O_T_MRAP_02_hmg_ghex_F", "O_T_MRAP_02_gmg_ghex_F"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["O_T_Truck_02_transport_F","O_T_Truck_02_F","O_T_Truck_03_transport_ghex_F","O_T_Truck_03_covered_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["O_T_Truck_02_transport_F","O_T_Truck_03_transport_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["O_T_Truck_03_ammo_ghex_F","O_T_Truck_02_Ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["O_T_Truck_02_Box_F","O_T_Truck_03_repair_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["O_T_Truck_02_fuel_F","O_T_Truck_03_fuel_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["O_T_Truck_03_medical_ghex_F","O_T_Truck_02_Medical_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["O_T_APC_Wheeled_02_rcws_v2_ghex_F", "O_T_APC_Tracked_02_cannon_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["O_T_MBT_02_cannon_ghex_F", "O_T_MBT_04_cannon_F", "O_T_MBT_04_command_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["O_T_APC_Tracked_02_AA_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["O_T_APC_Wheeled_02_rcws_v2_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesSam", ["O_Radar_System_02_F","O_SAM_System_04_F"]] call _fnc_saveToTemplate; 	//this line determines SAM systems, order: radar, SAM


["vehiclesTransportBoats", ["O_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["O_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["O_APC_Wheeled_02_rcws_v2_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_Plane_Fighter_02_F", "O_Plane_Fighter_02_Stealth_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["O_T_VTOL_02_infantry_dynamicLoadout_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["O_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_bench_black_F","O_Heli_Transport_04_covered_black_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["O_T_VTOL_02_infantry_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F", "O_Heli_Light_02_F", "O_Heli_Attack_02_black_F", "O_Heli_Attack_02_dynamicLoadout_black_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", [
["O_T_MBT_02_arty_ghex_F",["32Rnd_155mm_Mo_shells_O"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["O_T_UAV_04_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["O_UAV_01_F"]] call _fnc_saveToTemplate;


["vehiclesMilitiaLightArmed", ["O_LSV_02_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["O_Truck_02_transport_F", "O_Truck_02_covered_F", "O_Truck_03_covered_F", "O_Truck_03_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["O_LSV_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaApcs", ["O_T_APC_Wheeled_02_rcws_v2_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTanks", ["O_T_MBT_02_cannon_ghex_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["O_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["O_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["O_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["O_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", [""]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "not_supported"] call _fnc_saveToTemplate;

["baggedMGs", [["O_G_HMG_02_high_F", "O_G_HMG_02_support_high_F"]]] call _fnc_saveToTemplate;
["baggedAT", [["O_AT_01_weapon_F", "O_HMG_01_support_F"]]] call _fnc_saveToTemplate;
["baggedAA", [["O_AA_01_weapon_F", "O_HMG_01_support_F"]]] call _fnc_saveToTemplate;
["baggedMortars", [["O_Mortar_01_weapon_F", "O_Mortar_01_support_F"]]] call _fnc_saveToTemplate; 			//this line determines bagged static mortars -- Example: ["baggedMortars", [["B_Mortar_01_weapon_F", "B_Mortar_01_support_F"]]] -- Array, can contain multiple assets


["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine_Range_Mag"]] call _fnc_saveToTemplate;


["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", [
	//Team Leader
	["vanilla_opfor_teamLeader_enoch"] call A3A_fnc_getLoadout,
	//Medic
	["vanilla_opfor_medic_enoch"] call A3A_fnc_getLoadout,
	//Autorifleman
	["vanilla_opfor_machineGunner_enoch"] call A3A_fnc_getLoadout,
	//Marksman
	["vanilla_opfor_marksman_enoch"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["vanilla_opfor_AT_enoch"] call A3A_fnc_getLoadout,
	//AT2
	["vanilla_opfor_AT2_enoch"] call A3A_fnc_getLoadout
]] call _fnc_saveToTemplate;
["pvpVehicles", ["O_MRAP_02_F","O_MRAP_02_hmg_F"]] call _fnc_saveToTemplate;



//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData setVariable ["rifles", []];
_loadoutData setVariable ["carbines", []];
_loadoutData setVariable ["grenadeLaunchers", []];
_loadoutData setVariable ["SMGs", []];
_loadoutData setVariable ["machineGuns", []];
_loadoutData setVariable ["marksmanRifles", []];
_loadoutData setVariable ["sniperRifles", []];
_loadoutData setVariable ["lightATLaunchers", [
["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""]
]];
_loadoutData setVariable ["ATLaunchers", []];
_loadoutData setVariable ["missileATLaunchers", []];
_loadoutData setVariable ["AALaunchers", [
["launch_O_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData setVariable ["sidearms", []];

_loadoutData setVariable ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData setVariable ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData setVariable ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData setVariable ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData setVariable ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData setVariable ["antiTankGrenades", []];
_loadoutData setVariable ["smokeGrenades", ["SmokeShell"]];
_loadoutData setVariable ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];



_loadoutData setVariable ["maps", ["ItemMap"]];
_loadoutData setVariable ["watches", ["ItemWatch"]];
_loadoutData setVariable ["compasses", ["ItemCompass"]];
_loadoutData setVariable ["radios", ["ItemRadio"]];
_loadoutData setVariable ["gpses", ["ItemGPS"]];
_loadoutData setVariable ["NVGs", ["NVGoggles_OPFOR"]];
_loadoutData setVariable ["binoculars", ["Binocular"]];
_loadoutData setVariable ["Rangefinder", ["Rangefinder"]];

_loadoutData setVariable ["uniforms", []];
_loadoutData setVariable ["offuniforms", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["Hvests", []];
_loadoutData setVariable ["GLvests", []];
_loadoutData setVariable ["backpacks", []];
_loadoutData setVariable ["longRangeRadios", ["B_RadioBag_01_ghex_F"]];
_loadoutData setVariable ["helmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData setVariable ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData setVariable ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData setVariable ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData setVariable ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];


_loadoutData setVariable ["items_squadleader_extras", ["ACE_microDAGR", "ACE_DAGR", "Laserbatteries", "Laserbatteries", "Laserbatteries"]];
_loadoutData setVariable ["items_rifleman_extras", []];
_loadoutData setVariable ["items_medic_extras", []];
_loadoutData setVariable ["items_grenadier_extras", []];
_loadoutData setVariable ["items_explosivesExpert_extras", ["Toolkit", "MineDetector", "ACE_Clacker","ACE_DefusalKit"]];
_loadoutData setVariable ["items_engineer_extras", ["Toolkit", "MineDetector"]];
_loadoutData setVariable ["items_lat_extras", []];
_loadoutData setVariable ["items_at_extras", []];
_loadoutData setVariable ["items_aa_extras", []];
_loadoutData setVariable ["items_machineGunner_extras", []];
_loadoutData setVariable ["items_marksman_extras", ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"]];
_loadoutData setVariable ["items_sniper_extras", ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"]];
_loadoutData setVariable ["items_police_extras", []];
_loadoutData setVariable ["items_crew_extras", []];
_loadoutData setVariable ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData setVariable ["uniforms", ["U_O_V_Soldier_Viper_F"]];
_sfLoadoutData setVariable ["backpacks", ["B_ViperLightHarness_ghex_F", "B_ViperHarness_ghex_F"]];			//this line determines backpacks for special forces -- Example: ["B_AssaultPack_mcamo","B_Kitbag_mcamo"] -- Array, can contain multiple assets
_sfLoadoutData setVariable ["helmets", ["H_HelmetO_ViperSP_ghex_F"]];				//this line determines helmets for special forces -- Example: ["H_HelmetB_camo","H_HelmetB_desert"] -- Array, can contain multiple assets
_sfLoadoutData setVariable ["NVGs", []];
_sfLoadoutData setVariable ["binoculars", ["Laserdesignator_02_ghex_F"]];
_sfLoadoutData setVariable ["missileATLaunchers", [
["launch_O_Vorona_brown_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""],
["launch_O_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];

//SF Weapons
_sfLoadoutData setVariable ["rifles", [
["arifle_AK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_ARX_blk_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["10Rnd_50BW_Mag_F"], ""],
["arifle_ARX_blk_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["10Rnd_50BW_Mag_F"], ""],
["arifle_AK12_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData setVariable ["carbines", [
["arifle_AK12U_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12U_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_AK12U_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12U_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData setVariable ["grenadeLaunchers", [
["arifle_AK12_GL_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Arco", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData setVariable ["SMGs", [
["SMG_01_F", "muzzle_snds_acp", "", "optic_Holosight", [], [], ""],
["SMG_01_F", "muzzle_snds_acp", "", "optic_Yorris", [], [], ""],
["SMG_01_F", "muzzle_snds_acp", "", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];
_sfLoadoutData setVariable ["machineGuns", [
["arifle_RPK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["75rnd_762x39_AK12_Mag_F"], [], ""],
["arifle_RPK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_MRCO", ["75rnd_762x39_AK12_Mag_F"], [], ""],
["arifle_RPK12_arid_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_Arco_AK_arid_F", ["75rnd_762x39_AK12_Arid_Mag_F"], [], ""],
["arifle_RPK12_arid_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_MRCO", ["75rnd_762x39_AK12_Arid_Mag_F"], [], ""],
["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_MRCO", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Arco_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
["MMG_01_tan_F", "muzzle_snds_93mmg", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_tan"],
["MMG_01_hex_F", "muzzle_snds_93mmg_tan", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_hex"]
]];
_sfLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_01_F", "muzzle_snds_B", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_hex"],
["srifle_DMR_01_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_hex"],
["srifle_DMR_01_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_02_F_hex"],
["srifle_DMR_07_ghex_F", "muzzle_snds_H", "acc_pointer_IR", "optic_DMS_ghex_F", [], [], ""],
["srifle_DMR_07_ghex_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco_ghex_F", [], [], ""],
["srifle_DMR_07_ghex_F", "muzzle_snds_H", "acc_pointer_IR", "optic_SOS", [], [], ""]
]];
_sfLoadoutData setVariable ["sniperRifles", [
["srifle_GM6_ghex_F", "", "optic_LRPS_ghex_F", "", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_ghex_F", "", "optic_SOS", "", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_sfLoadoutData setVariable ["sidearms", [
["hgun_Pistol_heavy_02_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_Rook40_F", "muzzle_snds_L", "", "", [], [], ""],
["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData setVariable ["uniforms", ["U_O_T_Soldier_F"]];
_militaryLoadoutData setVariable ["offuniforms", ["U_O_T_Officer_F"]];
_militaryLoadoutData setVariable ["vests", ["V_HarnessO_ghex_F"]];
_militaryLoadoutData setVariable ["GLvests", ["V_HarnessOGL_ghex_F"]];
_militaryLoadoutData setVariable ["Hvests", ["V_TacVest_oli"]];
_militaryLoadoutData setVariable ["backpacks", ["B_Carryall_ghex_F", "B_FieldPack_ghex_F"]];
_militaryLoadoutData setVariable ["helmets", ["H_HelmetO_ghex_F", "H_HelmetLeaderO_ghex_F", "H_HelmetSpecO_ghex_F"]];
_militaryLoadoutData setVariable ["binoculars", ["Laserdesignator_02"]];

_militaryLoadoutData setVariable ["rifles", [
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["arifle_CTAR_GL_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData setVariable ["SMGs", [
["SMG_01_F", "", "", "optic_Holosight", [], [], ""],
["SMG_01_F", "", "", "optic_Yorris", [], [], ""],
["SMG_01_F", "", "", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];
_militaryLoadoutData setVariable ["machineGuns", [
["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Holosight", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Arco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
["LMG_Zafir_F", "", "acc_pointer_IR", "optic_MRCO", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
]];
_militaryLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_07_ghex_F", "", "acc_pointer_IR", "optic_DMS_ghex_F", [], [], ""],
["srifle_DMR_07_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", [], [], ""],
["srifle_DMR_07_ghex_F", "", "acc_pointer_IR", "optic_SOS", [], [], ""]
]];
_militaryLoadoutData setVariable ["sniperRifles", [
["srifle_GM6_ghex_F", "", "optic_LRPS_ghex_F", "", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_ghex_F", "", "optic_SOS", "", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_militaryLoadoutData setVariable ["sidearms", ["hgun_Rook40_F"]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData setVariable ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData setVariable ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData setVariable ["helmets", ["H_Cap_police"]];
_policeLoadoutData setVariable ["smgs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Holosight", [], [], ""],
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Yorris", [], [], ""],
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Holosight_blk_F", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Yorris", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Yorris", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];
_policeLoadoutData setVariable ["sidearms", ["hgun_Rook40_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData setVariable ["uniforms", ["U_O_T_Soldier_F"]];
_militiaLoadoutData setVariable ["offuniforms", ["U_O_T_Officer_F"]];
_militiaLoadoutData setVariable ["vests", ["V_HarnessO_ghex_F", "V_BandollierB_ghex_F"]];
_militiaLoadoutData setVariable ["GLvests", ["V_HarnessOGL_ghex_F"]];
_militiaLoadoutData setVariable ["Hvests", ["V_TacVest_oli"]];
_militiaLoadoutData setVariable ["backpacks", ["B_Carryall_ghex_F", "B_FieldPack_ghex_F"]];
_militiaLoadoutData setVariable ["helmets", ["H_MilCap_ghex_F", "H_HelmetSpecO_ghex_F", "H_Beret_CSAT_01_F"]];
_militiaLoadoutData setVariable ["rifles", [
["arifle_Katiba_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_militiaLoadoutData setVariable ["carbines", [
["arifle_Katiba_C_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData setVariable ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "", [], [], ""]
]];
_militiaLoadoutData setVariable ["machineGuns", [
["LMG_Zafir_F", "", "acc_flashlight", "", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
]];
_militiaLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_01_F", "", "acc_flashlight", "optic_Arco", [], [], "bipod_02_F_hex"],
["srifle_DMR_01_F", "", "acc_flashlight", "optic_Arco_blk_F", [], [], "bipod_02_F_hex"]
]];
_militiaLoadoutData setVariable ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_Arco", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_Arco_blk_F", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_militiaLoadoutData setVariable ["sidearms", ["hgun_Rook40_F"]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData setVariable ["uniforms", ["U_O_CombatUniform_ocamo"]];
_eliteLoadoutData setVariable ["offuniforms", ["U_O_OfficerUniform_ocamo"]];
_eliteLoadoutData setVariable ["vests", ["V_TacVest_brn"]];
_eliteLoadoutData setVariable ["GLvests", ["V_TacVest_brn"]];
_eliteLoadoutData setVariable ["Hvests", ["V_TacVest_brn"]];
_eliteLoadoutData setVariable ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_FieldPack_ocamo", "B_Carryall_cbr", "B_Kitbag_cbr"]];
_eliteLoadoutData setVariable ["helmets", ["H_HelmetO_ocamo", "H_HelmetLeaderO_ocamo"]];
_eliteLoadoutData setVariable ["binoculars", ["Laserdesignator_02"]];
_eliteLoadoutData setVariable ["missileATLaunchers", [
["launch_O_Vorona_brown_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""],
["launch_O_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];

_eliteLoadoutData setVariable ["rifles", [
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_eliteLoadoutData setVariable ["carbines", [
["arifle_Katiba_C_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_C_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_eliteLoadoutData setVariable ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData setVariable ["SMGs", [
["SMG_01_F", "", "", "optic_Holosight", [], [], ""],
["SMG_01_F", "", "", "optic_Yorris", [], [], ""],
["SMG_01_F", "", "", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];
_eliteLoadoutData setVariable ["machineGuns", [
["MMG_01_tan_F", "", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_tan"],
["MMG_01_hex_F", "", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_hex"]
]];
_eliteLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_blk"],
["srifle_DMR_05_hex_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_hex"],
["srifle_DMR_05_tan_f", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_tan"]
]];
_eliteLoadoutData setVariable ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_lrps", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_eliteLoadoutData setVariable ["sidearms", ["hgun_Rook40_F"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData setVariable ["uniforms", ["U_O_CombatUniform_ocamo"]];
_crewLoadoutData setVariable ["vests", ["V_HarnessO_brn"]];
_crewLoadoutData setVariable ["helmets", ["H_HelmetCrew_O"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["U_O_PilotCoveralls"]];
_pilotLoadoutData setVariable ["vests", ["V_BandollierB_khk"]];
_pilotLoadoutData setVariable ["helmets", ["H_CrewHelmetHeli_O", "H_PilotHelmetHeli_O"]];


// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["longRangeRadios"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_medic"] call _fnc_addItemSet;
	["items_medic_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["GLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;


	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_explosivesExpert_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["lightExplosives", 2] call _fnc_addItem;
	if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_engineer_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	[["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_lat_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	[selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_at_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_aa_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_machineGunner_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_marksman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	["sniperRifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_sniper_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	["smgs"] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_police_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_crew_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
	call _unarmedTemplate;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Radioman", _radiomanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
/*{
	params ["_name", "_loadoutTemplate"];
	private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
	private _finalName = _prefix + _name;
	[_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Radioman", _radiomanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate],
	["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Radioman", _radiomanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Radioman", _radiomanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////


["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Unarmed", _unarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
