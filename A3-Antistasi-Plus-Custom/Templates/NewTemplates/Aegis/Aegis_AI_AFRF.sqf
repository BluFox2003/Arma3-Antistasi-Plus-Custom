//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AFRF"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "AFRF Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_Russia_F"] call _fnc_saveToTemplate; 						
["flagTexture", "\A3_Aegis\Data_F_Aegis\Flags\flag_RUS_CO.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "flag_Russia"] call _fnc_saveToTemplate; 			

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////
["baseSoldiers", [ // Cases matter. Lower case here because allVariables on namespace returns lowercase
	["militia_squadleader", "O_R_Soldier_SL_F"],
	["militia_rifleman", "O_R_Soldier_F"],
	["militia_radioman", "O_R_Soldier_F"],
	["militia_medic", "O_R_medic_F"],
	["militia_engineer", "O_R_engineer_F"],
	["militia_explosivesexpert", "O_R_soldier_exp_F"],
	["militia_grenadier", "O_R_Soldier_GL_F"],
	["militia_lat", "O_R_Soldier_LAT_F"],
	["militia_at", "O_R_soldier_AT_F"],
	["militia_aa", "O_R_soldier_AA_F"],
	["militia_machinegunner", "O_R_Soldier_AR_F"],
	["militia_marksman", "O_R_soldier_M_F"],
	["militia_sniper", "O_R_sniper_F"],

	["military_squadleader", "O_R_Soldier_SL_F"],
	["military_rifleman", "O_R_Soldier_F"],
	["military_radioman", "O_R_Soldier_F"],
	["military_medic", "O_R_medic_F"],
	["military_engineer", "O_R_engineer_F"],
	["military_explosivesexpert", "O_R_soldier_exp_F"],
	["military_grenadier", "O_R_Soldier_GL_F"],
	["military_lat", "O_R_Soldier_LAT_F"],
	["military_at", "O_R_soldier_AT_F"],
	["military_aa", "O_R_soldier_AA_F"],
	["military_machinegunner", "O_R_Soldier_AR_F"],
	["military_marksman", "O_R_soldier_M_F"],
	["military_sniper", "O_R_sniper_F"],

	["elite_squadleader", "O_R_Soldier_SL_F"],
	["elite_rifleman", "O_R_Soldier_F"],
	["elite_radioman", "O_R_Soldier_F"],
	["elite_medic", "O_R_medic_F"],
	["elite_engineer", "O_R_engineer_F"],
	["elite_explosivesexpert", "O_R_soldier_exp_F"],
	["elite_grenadier", "O_R_Soldier_GL_F"],
	["elite_lat", "O_R_Soldier_LAT_F"],
	["elite_at", "O_R_soldier_AT_F"],
	["elite_aa", "O_R_soldier_AA_F"],
	["elite_machinegunner", "O_R_Soldier_AR_F"],
	["elite_marksman", "O_R_soldier_M_F"],
	["elite_sniper", "O_R_sniper_F"],

	["sf_squadleader", "O_R_recon_TL_F"],
	["sf_rifleman", "O_R_recon_F"],
	["sf_radioman", "O_R_recon_F"],
	["sf_medic", "O_R_recon_medic_F"],
	["sf_engineer", "O_R_recon_F"],
	["sf_explosivesexpert", "O_R_recon_exp_F"],
	["sf_grenadier", "O_R_recon_GL_F"],
	["sf_lat", "O_R_recon_LAT_F"],
	["sf_at", "O_R_recon_LAT_F"],
	["sf_aa", "O_R_recon_F"],
	["sf_machinegunner", "O_R_recon_AR_F"],
	["sf_marksman", "O_R_recon_M_F"],
	["sf_sniper", "O_R_sniper_F"],

	["other_crew", "O_R_crew_F"],
	["other_unarmed", "O_R_Survivor_F"],
	["other_official", "O_R_officer_F"],
	["other_traitor", "O_G_officer_F"],
	["other_pilot", "O_R_helipilot_F"],
	["police_squadleader", "O_R_Soldier_lite_F"],
	["police_standard", "O_R_Soldier_lite_F"]
]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["O_R_Quadbike_01_F"]] call _fnc_saveToTemplate; 			
["vehiclesLightUnarmed", ["O_R_MRAP_02_F", "O_R_LSV_02_unarmed_F"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed", ["O_R_MRAP_02_gmg_F", "O_R_MRAP_02_hmg_F", "O_R_LSV_02_AT_F", "O_R_LSV_02_armed_F"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["O_R_Truck_02_transport_F", "O_R_Truck_02_F", "O_R_Truck_03_transport_F", "O_R_Truck_03_covered_F"]] call _fnc_saveToTemplate; 			
["vehiclesCargoTrucks", ["O_R_Truck_02_flatbed_F", "O_R_Truck_02_cargo_F"]] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["O_R_Truck_03_ammo_F", "O_R_Truck_02_Ammo_F"]] call _fnc_saveToTemplate; 		
["vehiclesRepairTrucks", ["O_R_Truck_03_box_F", "O_R_Truck_02_repair_F"]] call _fnc_saveToTemplate; 		
["vehiclesFuelTrucks", ["O_R_Truck_03_fuel_F", "O_R_Truck_02_fuel_F"]] call _fnc_saveToTemplate;		
["vehiclesMedical", ["O_R_APC_Tracked_02_medical_F","O_R_Truck_03_medical_F", "O_R_Truck_02_medical_F"]] call _fnc_saveToTemplate;			
["vehiclesAPCs", ["O_R_APC_Wheeled_04_cannon_F", "O_R_APC_Tracked_02_cannon_F"]] call _fnc_saveToTemplate; 				
["vehiclesTanks", ["O_R_MBT_02_cannon_F", "O_R_MBT_04_cannon_F", "O_R_MBT_04_command_F"]] call _fnc_saveToTemplate; 			
["vehiclesAA", ["O_R_APC_Tracked_02_AA_F"]] call _fnc_saveToTemplate; 				
["vehiclesLightAPCs", ["O_R_APC_Wheeled_04_cannon_F"]] call _fnc_saveToTemplate;			
["vehiclesIFVs", []] call _fnc_saveToTemplate;				

["vehiclesSam", ["O_R_Radar_System_02_F","O_R_SAM_System_04_F"]] call _fnc_saveToTemplate; 	//this line determines SAM systems, order: radar, SAM

["vehiclesTransportBoats", ["O_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 	
["vehiclesGunBoats", ["O_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate; 			
["vehiclesAmphibious", ["Atlas_O_W_APC_Wheeled_02_rcws_v2_ghex_F"]] call _fnc_saveToTemplate; 		

["vehiclesPlanesCAS", ["O_R_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate; 		
["vehiclesPlanesAA", ["O_R_Plane_Fighter_02_F", "O_R_Plane_Fighter_02_Stealth_F"]] call _fnc_saveToTemplate; 			
["vehiclesPlanesTransport", ["O_T_Plane_Transport_01_infantry_ghex_F"]] call _fnc_saveToTemplate; 	

["vehiclesHelisLight", ["O_R_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate; 		
["vehiclesHelisTransport", ["O_R_Heli_Light_02_unarmed_F", "O_R_Heli_Transport_04_bench_F", "O_R_Heli_Transport_04_covered_F"]] call _fnc_saveToTemplate; 	
["vehiclesHelisAttack", ["O_R_Heli_Attack_02_dynamicLoadout_F", "O_R_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate; 		

["vehiclesArtillery", [
["O_R_Truck_02_MRL_F",["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate; 		


["uavsAttack", ["O_R_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate; 				
["uavsPortable", ["O_R_UAV_01_F"]] call _fnc_saveToTemplate; 				


["vehiclesMilitiaLightArmed", ["Atlas_O_W_LSV_02_armed_F","Atlas_O_W_LSV_02_AT_F"]] call _fnc_saveToTemplate; 
["vehiclesMilitiaTrucks", ["Atlas_O_W_Truck_02_transport_F", "Atlas_O_W_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["Atlas_O_W_LSV_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaApcs", ["Atlas_O_W_APC_Wheeled_02_rcws_v2_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTanks", ["Atlas_O_W_MBT_02_cannon_ghex_F"]] call _fnc_saveToTemplate;

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
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;


["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", [
	//Team Leader
	["aegis_opfor_teamLeader_wdl"] call A3A_fnc_getLoadout,
	//Medic
	["aegis_opfor_medic_wdl"] call A3A_fnc_getLoadout,
	//Autorifleman
	["aegis_opfor_machineGunner_wdl"] call A3A_fnc_getLoadout,
	//Marksman
	["aegis_opfor_marksman_wdl"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["aegis_opfor_AT_wdl"] call A3A_fnc_getLoadout,
	//AT2
	["aegis_opfor_AT2_wdl"] call A3A_fnc_getLoadout
]] call _fnc_saveToTemplate;
["pvpVehicles", ["O_R_MRAP_02_F", "O_R_LSV_02_unarmed_F", "O_R_MRAP_02_gmg_F", "O_R_LSV_02_armed_F"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData setVariable ["rifles", []]; 					
_loadoutData setVariable ["carbines", []]; 					
_loadoutData setVariable ["grenadeLaunchers", []]; 			
_loadoutData setVariable ["SMGs", []]; 
_loadoutData setVariable ["shotguns", []];						
_loadoutData setVariable ["machineGuns", []]; 				
_loadoutData setVariable ["marksmanRifles", []]; 			
_loadoutData setVariable ["sniperRifles", []]; 				
_loadoutData setVariable ["lightATLaunchers", []];		
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

_loadoutData setVariable ["antiInfantryGrenades", ["HandGrenade_East", "HandGrenade_Guer"]]; 		
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
_loadoutData setVariable ["longRangeRadios", ["B_RadioBag_01_eaf_F"]];
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
_sfLoadoutData setVariable ["uniforms", ["U_O_R_Gorka_01_camo_F", "U_O_R_Gorka_01_F", "U_O_R_Gorka_01_brown_F"]];			
_sfLoadoutData setVariable ["vests", ["V_SmershVest_01_olive_F", "V_SmershVest_01_radio_olive_F"]];				
_sfLoadoutData setVariable ["GLvests", ["V_HarnessOGL_gry"]];
_sfLoadoutData setVariable ["Hvests", ["V_TacVest_oli"]];
_sfLoadoutData setVariable ["backpacks", ["B_AssaultPack_taiga_F", "B_Carryall_taiga_F", "B_FieldPack_taiga_F"]];			
_sfLoadoutData setVariable ["helmets", ["H_HelmetAggressor_cover_taiga_F", "H_HelmetAggressor_cover_F", "H_HelmetAggressor_F"]];				
_sfLoadoutData setVariable ["binoculars", ["Laserdesignator_03"]];
_sfLoadoutData setVariable ["missileATLaunchers", [
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
]];
_sfLoadoutData setVariable ["lightATLaunchers", [
["launch_RPG32_camo_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""]
]];

//SF Weapons
_sfLoadoutData setVariable ["rifles", [
["arifle_AK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12_arid_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_Holosight", ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"], [], ""],
["arifle_AK12_arid_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_Arco_AK_arid_F", ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"], [], ""],
["arifle_AK12_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]];			
_sfLoadoutData setVariable ["carbines", [
["arifle_AK12U_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12U_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12U_arid_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_Holosight", ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"], [], ""],
["arifle_AK12U_arid_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_Arco_AK_arid_F", ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"], [], ""],
["arifle_AK12U_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12U_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]]; 					
_sfLoadoutData setVariable ["grenadeLaunchers", [
["arifle_AK12_GL_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_arid_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_Holosight", ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_arid_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_Arco_AK_arid_F", ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
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
["arifle_RPK12_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_Arco_AK_lush_F", ["75rnd_762x39_AK12_Lush_Mag_F"], [], ""],
["arifle_RPK12_lush_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_MRCO", ["75rnd_762x39_AK12_Lush_Mag_F"], [], ""],
["MMG_01_tan_F", "muzzle_snds_93mmg", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_tan"]
]]; 				
_sfLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"]
]]; 			
_sfLoadoutData setVariable ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_lrps", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]]; 				
_sfLoadoutData setVariable ["sidearms", [
["hgun_Pistol_heavy_02_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD", [], [], ""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData setVariable ["uniforms", ["U_O_R_CombatUniform_taiga_F"]];		
_militaryLoadoutData setVariable ["offuniforms", ["U_O_R_OfficerUniform_taiga_F"]];
_militaryLoadoutData setVariable ["vests", ["V_SmershVest_01_olive_F", "V_SmershVest_01_radio_olive_F"]];			
_militaryLoadoutData setVariable ["GLvests", ["V_HarnessOGL_gry"]];
_militaryLoadoutData setVariable ["Hvests", ["V_TacVest_oli"]];
_militaryLoadoutData setVariable ["backpacks", ["B_Carryall_taiga_F", "B_FieldPack_taiga_F"]];		
_militaryLoadoutData setVariable ["helmets", ["H_HelmetAggressor_cover_taiga_F", "H_HelmetAggressor_F", "H_Booniehat_taiga_hs", "H_MilCap_taiga"]];		
_militaryLoadoutData setVariable ["lightATLaunchers", [
["launch_RPG32_camo_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""]
]];

_militaryLoadoutData setVariable ["rifles", [
["arifle_AK12_545_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_Arco_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_Arco_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_Arco_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData setVariable ["SMGs", [
["sgun_Mp153_black_F", "", "", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Yorris", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];
_militaryLoadoutData setVariable ["machineGuns", [
["arifle_RPK12_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["75rnd_762x39_AK12_Mag_F"], [], ""],
["arifle_RPK12_F", "", "acc_flashlight", "optic_MRCO", ["75rnd_762x39_AK12_Mag_F"], [], ""],
["arifle_RPK12_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["75rnd_762x39_AK12_Mag_F"], [], ""]
]];
_militaryLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_01_black_F", "", "acc_flashlight", "optic_dms", [], [], "bipod_02_F_hex"],
["srifle_DMR_01_black_F", "", "acc_flashlight", "optic_SOS", [], [], "bipod_02_F_hex"]
]];
_militaryLoadoutData setVariable ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_lrps", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_militaryLoadoutData setVariable ["sidearms", ["hgun_Rook40_F"]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData setVariable ["uniforms", ["Police_U_I_P_PoliceUniform_F", "Police_U_I_P_PoliceUniform_gloves_F"]];
_policeLoadoutData setVariable ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData setVariable ["helmets", ["H_Cap_police", "H_HelmetSpecter_black_headset_F", "H_HelmetSpecter_black_F"]];
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
_militiaLoadoutData setVariable ["uniforms", ["Atlas_U_O_W_CombatUniform_owcamo"]];		
_militiaLoadoutData setVariable ["offuniforms", ["Atlas_U_O_W_OfficerUniform"]];
_militiaLoadoutData setVariable ["vests", ["V_HarnessO_brn"]];
_militiaLoadoutData setVariable ["GLvests", ["V_HarnessOGL_brn"]];
_militiaLoadoutData setVariable ["Hvests", ["V_TacVest_brn"]];
_militiaLoadoutData setVariable ["backpacks", ["B_AssaultPack_khk", "B_FieldPack_khk", "B_Carryall_khk"]];		
_militiaLoadoutData setVariable ["helmets", ["H_O_Helmet_canvas_owcamo", "H_MilCap_whex_F", "H_Booniehat_whex_F"]];
_militiaLoadoutData setVariable ["lightATLaunchers", [
["launch_RPG7_F", "", "", "", [], [], ""]
]];

_militiaLoadoutData setVariable ["rifles", [
["arifle_AK12_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""]
]];			
_militiaLoadoutData setVariable ["carbines", [
["arifle_AK12U_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""]
]]; 					
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["arifle_AK12_GL_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]]; 			
_militiaLoadoutData setVariable ["SMGs", [
["SMG_02_F", "", "acc_flashlight", "", [], [], ""]
]];
_militiaLoadoutData setVariable ["shotguns", [
	["sgun_Mp153_black_F", "", "", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""]
]];
_militiaLoadoutData setVariable ["machineGuns", [
["LMG_Zafir_F", "", "acc_flashlight", "", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
]]; 				
_militiaLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_01_black_F", "", "acc_flashlight", "optic_Arco_blk_F", [], [], "bipod_02_F_hex"]
]]; 			
_militiaLoadoutData setVariable ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_Arco", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_Arco_blk_F", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]]; 				
_militiaLoadoutData setVariable ["sidearms", ["hgun_Rook40_F"]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData setVariable ["uniforms", ["U_O_R_Gorka_01_camo_F", "U_O_R_Gorka_01_F", "U_O_R_Gorka_01_brown_F"]];			
_eliteLoadoutData setVariable ["vests", ["V_SmershVest_01_olive_F", "V_SmershVest_01_radio_olive_F"]];				
_eliteLoadoutData setVariable ["GLvests", ["V_HarnessOGL_gry"]];
_eliteLoadoutData setVariable ["Hvests", ["V_TacVest_oli"]];
_eliteLoadoutData setVariable ["backpacks", ["B_Carryall_taiga_F"]];			
_eliteLoadoutData setVariable ["helmets", ["H_HelmetAggressor_cover_taiga_F", "H_HelmetAggressor_cover_F", "H_HelmetAggressor_F"]];				
_eliteLoadoutData setVariable ["binoculars", ["Laserdesignator_03"]];

_eliteLoadoutData setVariable ["lightATLaunchers", [
["launch_RPG32_camo_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""]
]];
_eliteLoadoutData setVariable ["missileATLaunchers", [
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
]]; 

_eliteLoadoutData setVariable ["rifles", [
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];			
_eliteLoadoutData setVariable ["carbines", [
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]]; 					
_eliteLoadoutData setVariable ["grenadeLaunchers", [
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]]; 			
_eliteLoadoutData setVariable ["SMGs", [
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];
_eliteLoadoutData setVariable ["machineGuns", [
["MMG_01_tan_F", "muzzle_snds_93mmg", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_tan"]
]]; 				
_eliteLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_blk"],
["srifle_DMR_05_tan_f", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_tan"]
]]; 			
_eliteLoadoutData setVariable ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_lrps", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]]; 				
_eliteLoadoutData setVariable ["sidearms", [
["hgun_Pistol_heavy_02_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD", [], [], ""]
]]; 


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData setVariable ["uniforms", ["U_O_CombatUniform_ocamo"]];			
_crewLoadoutData setVariable ["vests", ["V_HarnessO_brn"]];				
_crewLoadoutData setVariable ["helmets", ["H_HelmetCrew_O"]];			


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["Atlas_U_B_G_HeliPilotCoveralls"]];			
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

  	[["shotguns", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
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

	[["shotguns", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
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
