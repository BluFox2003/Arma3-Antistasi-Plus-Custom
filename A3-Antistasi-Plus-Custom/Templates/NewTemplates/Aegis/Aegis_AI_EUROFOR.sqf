//////////////////////////
//   Side Information   //
//////////////////////////

["name", "EUROFOR"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "EUROFOR support corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_Blue_F"] call _fnc_saveToTemplate; 						
["flagTexture", "\A3\Data_F\Flags\flag_blue_co.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "flag_EU"] call _fnc_saveToTemplate; 			

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////
["baseSoldiers", [ // Cases matter. Lower case here because allVariables on namespace returns lowercase
	["militia_squadleader", "B_Soldier_SL_F"],
	["militia_rifleman", "B_Soldier_F"],
	["militia_radioman", "B_Soldier_F"],
	["militia_medic", "B_medic_F"],
	["militia_engineer", "B_engineer_F"],
	["militia_explosivesexpert", "B_soldier_exp_F"],
	["militia_grenadier", "B_Soldier_GL_F"],
	["militia_lat", "B_soldier_LAT_F"],
	["militia_at", "B_soldier_AT_F"],
	["militia_aa", "B_soldier_AA_F"],
	["militia_machinegunner", "B_soldier_AR_F"],
	["militia_marksman", "B_soldier_M_F"],
	["militia_sniper", "B_sniper_F"],

	["military_squadleader", "B_Soldier_SL_F"],
	["military_rifleman", "B_Soldier_F"],
	["military_radioman", "B_Soldier_F"],
	["military_medic", "B_medic_F"],
	["military_engineer", "B_engineer_F"],
	["military_explosivesexpert", "B_soldier_exp_F"],
	["military_grenadier", "B_Soldier_GL_F"],
	["military_lat", "B_soldier_LAT_F"],
	["military_at", "B_soldier_AT_F"],
	["military_aa", "B_soldier_AA_F"],
	["military_machinegunner", "B_soldier_AR_F"],
	["military_marksman", "B_soldier_M_F"],
	["military_sniper", "B_sniper_F"],

	["elite_squadleader", "B_Soldier_SL_F"],
	["elite_rifleman", "B_Soldier_F"],
	["elite_radioman", "B_Soldier_F"],
	["elite_medic", "B_medic_F"],
	["elite_engineer", "B_engineer_F"],
	["elite_explosivesexpert", "B_soldier_exp_F"],
	["elite_grenadier", "B_Soldier_GL_F"],
	["elite_lat", "B_soldier_LAT_F"],
	["elite_at", "B_soldier_AT_F"],
	["elite_aa", "B_soldier_AA_F"],
	["elite_machinegunner", "B_soldier_AR_F"],
	["elite_marksman", "B_soldier_M_F"],
	["elite_sniper", "B_sniper_F"],

	["sf_squadleader", "B_recon_TL_F"],
	["sf_rifleman", "B_recon_F"],
	["sf_radioman", "B_recon_F"],
	["sf_medic", "B_recon_medic_F"],
	["sf_engineer", "B_recon_F"],
	["sf_explosivesexpert", "B_recon_exp_F"],
	["sf_grenadier", "B_recon_JTAC_F"],
	["sf_lat", "B_recon_LAT_F"],
	["sf_at", "B_recon_LAT_F"],
	["sf_aa", "B_soldier_AA_F"],
	["sf_machinegunner", "B_soldier_AR_F"],
	["sf_marksman", "B_recon_M_F"],
	["sf_sniper", "B_sniper_F"],

	["other_crew", "B_crew_F"],
	["other_unarmed", "B_Survivor_F"],
	["other_official", "B_officer_F"],
	["other_traitor", "B_G_Soldier_F"],
	["other_pilot", "B_Helipilot_F"],
	["police_squadleader", "B_G_Soldier_F"],
	["police_standard", "B_G_Soldier_F"]
]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["B_A_Quadbike_01_F"]] call _fnc_saveToTemplate; 			
["vehiclesLightUnarmed", ["B_A_MRAP_03_F", "B_A_LSV_01_light_F", "B_A_LSV_01_unarmed_F", "B_MRAP_01_F"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed",["B_A_MRAP_03_gmg_F", "B_A_MRAP_03_hmg_F", "B_A_LSV_01_AT_F", "B_A_LSV_01_armed_F", "B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F", "Atlas_B_G_LT_01_cannon_F", "Atlas_B_G_LT_01_AT_F"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["B_A_Truck_01_transport_F", "B_A_Truck_01_covered_F"]] call _fnc_saveToTemplate; 			
["vehiclesCargoTrucks", ["B_A_Truck_01_flatbed_F", "B_A_Truck_01_cargo_F"]] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["B_A_Truck_01_ammo_F"]] call _fnc_saveToTemplate; 		
["vehiclesRepairTrucks", ["B_A_Truck_01_Repair_F"]] call _fnc_saveToTemplate; 		
["vehiclesFuelTrucks", ["B_A_Truck_01_fuel_F"]] call _fnc_saveToTemplate;		
["vehiclesMedical", ["B_A_Truck_01_medical_F", "B_APC_Wheeled_01_medical_F"]] call _fnc_saveToTemplate;			
["vehiclesAPCs", ["B_A_APC_tracked_03_cannon_v2_F", "B_APC_Wheeled_01_cannon_v2_F", "B_APC_Tracked_01_CRV_F", "B_APC_Tracked_01_rcws_F"]] call _fnc_saveToTemplate; 				
["vehiclesTanks", ["Atlas_B_G_MBT_03_cannon_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F", "B_AFV_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_up_cannon_F"]] call _fnc_saveToTemplate; 			
["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate; 				
["vehiclesLightAPCs", ["Atlas_B_G_APC_Wheeled_03_cannon_F"]] call _fnc_saveToTemplate;			
["vehiclesIFVs", []] call _fnc_saveToTemplate;				

["vehiclesSam", ["B_Radar_System_01_F","B_SAM_System_03_F"]] call _fnc_saveToTemplate; 	//this line determines SAM systems, order: radar, SAM

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 	
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate; 			
["vehiclesAmphibious", ["B_APC_Wheeled_01_cannon_F"]] call _fnc_saveToTemplate; 		

["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate; 		
["vehiclesPlanesAA", ["B_A_Plane_Fighter_05_F"]] call _fnc_saveToTemplate; 			
["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] call _fnc_saveToTemplate; 	

["vehiclesHelisLight", ["B_A_Heli_light_03_unarmed_F", "B_Heli_Light_01_F"]] call _fnc_saveToTemplate; 		
["vehiclesHelisTransport", ["B_A_Heli_Transport_02_F", "B_CTRG_Heli_Transport_01_sand_F", "B_Heli_Transport_03_F", "B_Heli_Transport_03_unarmed_F"]] call _fnc_saveToTemplate; 	
["vehiclesHelisAttack", ["B_A_Heli_Attack_01_dynamicLoadout_F", "B_A_Heli_light_03_dynamicLoadout_F", "B_Heli_Light_01_dynamicLoadout_F"]] call _fnc_saveToTemplate; 		

["vehiclesArtillery", [
["B_MBT_01_arty_F",["32Rnd_155mm_Mo_shells"]],
["B_MBT_01_mlrs_F",["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate; 		

["uavsAttack", ["B_UAV_02_dynamicLoadout_F", "B_T_UAV_03_dynamicLoadout_F"]] call _fnc_saveToTemplate; 				
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate; 				


["vehiclesMilitiaLightArmed", ["Atlas_B_H_Offroad_02_LMG_F", "Atlas_B_H_Offroad_02_AT_F"]] call _fnc_saveToTemplate; 
["vehiclesMilitiaTrucks", ["B_G_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["Atlas_B_H_Offroad_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaApcs", ["B_G_APC_Wheeled_03_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTanks", ["Atlas_B_G_LT_01_cannon_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["Police_I_P_Offroad_01_police_F"]] call _fnc_saveToTemplate;

["staticMGs", ["B_G_HMG_02_high_F"]] call _fnc_saveToTemplate; 					
["staticAT", ["B_static_AT_F"]] call _fnc_saveToTemplate; 					
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate; 					
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", [""]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "not_supported"] call _fnc_saveToTemplate;

["baggedMGs", [["I_G_HMG_02_weapon_F", "I_G_HMG_02_support_high_F"]]] call _fnc_saveToTemplate; 				
["baggedAT", [["B_HMG_01_support_F", "B_AT_01_weapon_F"]]] call _fnc_saveToTemplate; 					
["baggedAA", [["B_HMG_01_support_F", "B_AA_01_weapon_F"]]] call _fnc_saveToTemplate; 					
["baggedMortars", [["B_Mortar_01_support_F", "B_Mortar_01_weapon_F"]]] call _fnc_saveToTemplate; 			//this line determines bagged static mortars -- Example: ["baggedMortars", [["B_Mortar_01_weapon_F", "B_Mortar_01_support_F"]]] -- Array, can contain multiple assets


["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine_Range_Mag"]] call _fnc_saveToTemplate;


["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", [
		//Team Leader
		["aegis_blufor_teamLeader_wdl"] call A3A_fnc_getLoadout,
		//Medic
		["aegis_blufor_medic_wdl"] call A3A_fnc_getLoadout,
		//Autorifleman
		["aegis_blufor_machineGunner_wdl"] call A3A_fnc_getLoadout,
		//Marksman
		["aegis_blufor_marksman_wdl"] call A3A_fnc_getLoadout,
		//Anti-tank Scout
		["aegis_blufor_AT_wdl"] call A3A_fnc_getLoadout,
		//AT2
		["aegis_blufor_AT_wdl"] call A3A_fnc_getLoadout
	]
] call _fnc_saveToTemplate;

["pvpVehicles", ["B_LSV_01_armed_F", "B_LSV_01_unarmed_F"]] call _fnc_saveToTemplate;


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
_loadoutData setVariable ["lightATLaunchers", [
	["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
	["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
	["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
	["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
	["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
	["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
	["launch_MRAWS_black_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT55_F", "MRAWS_HE_F"], [], ""],
	["launch_MRAWS_black_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]]; 			
_loadoutData setVariable ["ATLaunchers", []]; 				
_loadoutData setVariable ["missileATLaunchers", []]; 		
_loadoutData setVariable ["AALaunchers", [
	["launch_Titan_blk_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
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
_loadoutData setVariable ["NVGs", ["NVGoggles"]];
_loadoutData setVariable ["binoculars", ["Binocular"]];		
_loadoutData setVariable ["Rangefinder", ["Rangefinder"]];

_loadoutData setVariable ["uniforms", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["Hvests", []];
_loadoutData setVariable ["GLvests", []];
_loadoutData setVariable ["backpacks", []];
_loadoutData setVariable ["longRangeRadios", ["B_RadioBag_01_wdl_F"]];
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
_sfLoadoutData setVariable ["uniforms", ["U_B_CTRG_Soldier_Arid_F", "U_B_CTRG_Soldier_3_Arid_F", "U_B_CTRG_Soldier_2_Arid_F"]];			
_sfLoadoutData setVariable ["vests", ["V_PlateCarrierL_CTRG"]];				
_sfLoadoutData setVariable ["Hvests", ["V_PlateCarrierH_CTRG"]];
_sfLoadoutData setVariable ["backpacks", ["B_Kitbag_cbr", "B_Carryall_mcamo", "B_Carryall_cbr", "B_AssaultPack_cbr"]];			
_sfLoadoutData setVariable ["helmets", ["H_HelmetSpecB_blk", "H_HelmetSpecB", "H_Booniehat_mcamo", "H_Watchcap_khk"]];				
_sfLoadoutData setVariable ["binoculars", ["Laserdesignator"]];


_sfLoadoutData setVariable ["rifles", [
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"], [], ""],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"], [], ""],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"], [], ""],
["arifle_SCAR_F", "muzzle_mzls_B", "acc_pointer_IR", "optic_ERCO_snd_F", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
["arifle_SCAR_grip_F", "muzzle_mzls_B", "acc_pointer_IR", "optic_Hamr", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
["arifle_SCAR_black_F", "muzzle_mzls_B", "acc_pointer_IR", "optic_ERCO_blk_F", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["arifle_SCAR_grip_black_F", "muzzle_mzls_B", "acc_pointer_IR", "optic_ERCO_blk_F", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData setVariable ["carbines", [
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"], [], ""],
["arifle_SPAR_01_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"], [], ""],
["arifle_SPAR_01_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"], [], ""],
["arifle_SCAR_short_F", "muzzle_snds_B", "acc_pointer_IR", "optic_ERCO_snd_F", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
["arifle_SCAR_short_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
["arifle_SCAR_short_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_ERCO_blk_F", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
["arifle_SCAR_short_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData setVariable ["grenadeLaunchers", [
["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ""],
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_Hamr_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_ERCO_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_GL_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr_khk_F", ["20Rnd_762x51_Mag"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_GL_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_ERCO_blk_F", ["20Rnd_762x51_Mag"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData setVariable ["SMGs", [
["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], [], ""],
["SMG_04_blk_F", "muzzle_snds_460", "", "optic_Aco_smg", ["40Rnd_460x30_Mag_F"], [], ""],
["SMG_04_snd_F", "muzzle_snds_460", "", "optic_Holosight_smg", ["40Rnd_460x30_Mag_F"], [], ""]
]];
_sfLoadoutData setVariable ["machineGuns", [
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_ERCO_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F"], [], "bipod_01_F_snd"],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F"], [], "bipod_01_F_snd"],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_ERCO_snd_F", ["150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F"], [], "bipod_01_F_snd"],
["MMG_02_black_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_tws_mg", ["130Rnd_338_Mag"], [], "bipod_01_F_blk"],
["MMG_02_camo_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_tws_mg", ["130Rnd_338_Mag"], [], "bipod_01_F_mtp"],
["MMG_02_sand_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_tws_mg", ["130Rnd_338_Mag"], [], "bipod_01_F_snd"]
]];
_sfLoadoutData setVariable ["marksmanRifles", [
["arifle_SPAR_03_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_snd_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
["arifle_SPAR_03_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_ERCO_blk_F", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_snd_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_ERCO_snd_F", [], [], "bipod_01_F_snd"],
["arifle_SPAR_03_snd_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_ERCO_snd_F", [], [], "bipod_01_F_snd"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_snd"],
["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_02_camo_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_AMS_snd", [], [], "bipod_01_F_snd"],
["srifle_DMR_02_tna_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"]
]];
_sfLoadoutData setVariable ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_lrps", [], [], ""]
]];
_sfLoadoutData setVariable ["sidearms", [
["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD", [], [], ""],
["hgun_Pistol_heavy_01_green_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD_black", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData setVariable ["uniforms", ["U_B_UBACS_mtp_f", "U_B_UBACS_vest_mtp_f", "U_B_UBACS_tshirt_mtp_f"]];		
_militaryLoadoutData setVariable ["vests", ["V_PlateCarrierL_CTRG", "V_PlateCarrierL_CTRG_grn_F"]];			
_militaryLoadoutData setVariable ["Hvests", ["V_PlateCarrierH_CTRG", "V_PlateCarrierH_CTRG_grn_F"]];
_militaryLoadoutData setVariable ["GLvests", ["V_PlateCarrierH_CTRG", "V_PlateCarrierH_CTRG_grn_F"]];
_militaryLoadoutData setVariable ["backpacks", ["B_Carryall_oli", "B_AssaultPackSpec_rgr", "B_AssaultPackSpec_cbr"]];		
_militaryLoadoutData setVariable ["helmets", ["H_HelmetB_snakeskin", "H_HelmetB_camo_mcamo", "H_HelmetB_light_snakeskin"]];		
_militaryLoadoutData setVariable ["missileATLaunchers", [
	["launch_Titan_short_blk_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]]; 

_militaryLoadoutData setVariable ["rifles", [
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_blk_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_C_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_C_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_C_blk_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_C_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_LRCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "optic_LRCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData setVariable ["SMGs", [
["SMG_04_blk_F", "", "", "optic_Holosight", [], [], ""],
["SMG_04_blk_F", "", "", "optic_Yorris", [], [], ""],
["SMG_04_blk_F", "", "", "optic_Aco_smg", [], [], ""]
]];
_militaryLoadoutData setVariable ["machineGuns", [
["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_ACO_grn", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Aco", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_snd"],
["LMG_03_F", "", "acc_pointer_IR", "optic_ACO_grn", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""]
]];
_militaryLoadoutData setVariable ["marksmanRifles", [
["arifle_SCAR_black_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["arifle_SCAR_grip_black_F", "", "acc_pointer_IR", "optic_LRCO_blk_F", [], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData setVariable ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS_tna_F", [], [], ""]
]];
_militaryLoadoutData setVariable ["sidearms", [
["hgun_G17_black_F", "", "", "", [], [], ""],
["hgun_G17_F", "", "", "", [], [], ""]
]];
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
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""],
["SMG_04_blk_F", "", "", "optic_Holosight", [], [], ""],
["SMG_04_blk_F", "", "", "optic_Yorris", [], [], ""],
["SMG_04_blk_F", "", "", "optic_Aco_smg", [], [], ""]
]];
_policeLoadoutData setVariable ["sidearms", ["hgun_Rook40_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData setVariable ["uniforms", ["U_B_CombatUniform_sgg", "U_B_CombatUniform_sgg_vest", "U_B_CombatUniform_sgg_tshirt"]];		
_militiaLoadoutData setVariable ["vests", ["V_TacVest_oli", "V_Chestrig_oli", "V_ChestrigF_rgr"]];			
_militiaLoadoutData setVariable ["backpacks", ["B_AssaultPack_sgg", "B_FieldPack_oli"]];		
_militiaLoadoutData setVariable ["helmets", ["H_PASGT_basic_olive_F", "H_HelmetB_light_green", "H_HelmetSpecB_light_green", "H_MilCap_sgg", "H_Bandanna_sgg", "H_Watchcap_sgg", "H_Beret_grn"]];		

_militiaLoadoutData setVariable ["rifles", [
["arifle_MSBS65_black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_AUG_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_AUG_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_TRG21_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_TRG21_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_Mk20_plain_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_Mk20_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData setVariable ["carbines", [
["arifle_AUG_C_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_AUG_C_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_TRG20_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_TRG20_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_Mk20C_plain_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_Mk20C_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["arifle_MSBS65_UBS_black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug"], ""],
["arifle_AUG_GL_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AUG_GL_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Mk20_GL_plain_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Mk20_GL_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_TRG21_GL_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_TRG21_GL_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData setVariable ["shotguns", [
	["sgun_KSG_F", "", "", "", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""]
]];
_militiaLoadoutData setVariable ["SMGs", [
["SMG_05_F", "", "acc_flashlight", "", [], [], ""]
]];
_militiaLoadoutData setVariable ["machineGuns", [
["LMG_03_F", "", "acc_flashlight", "", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""],
["LMG_03_khk_F", "", "acc_flashlight", "", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""]
]];
_militiaLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_06_hunter_F", "", "acc_flashlight", "optic_MRCO", ["10Rnd_Mk14_762x51_Mag"], [], ""]
]];
_militiaLoadoutData setVariable ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""]
]];
_militiaLoadoutData setVariable ["sidearms", ["hgun_ACPC2_black_F"]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData setVariable ["uniforms", ["Atlas_U_B_G_CombatUniform_wdl", "Atlas_U_B_G_CombatUniform_vest_wdl", "Atlas_U_B_G_CombatUniform_tshirt_wdl"]];		
_eliteLoadoutData setVariable ["vests", ["V_CarrierRigKBT_01_Khaki_F", "V_CarrierRigKBT_01_light_Khaki_F"]];			
_eliteLoadoutData setVariable ["Hvests", ["V_CarrierRigKBT_01_heavy_Khaki_F"]];
_eliteLoadoutData setVariable ["GLvests", ["V_CarrierRigKBT_01_heavy_Khaki_F"]];
_eliteLoadoutData setVariable ["backpacks", ["B_Kitbag_sgg", "B_Carryall_cbr", "B_TacticalPack_blk"]];		
_eliteLoadoutData setVariable ["helmets", ["H_HelmetSpecB", "H_HelmetSpecB_light_wdl", "H_HelmetB_light_wdl", "H_Beret_grn"]];		
_eliteLoadoutData setVariable ["binoculars", ["Laserdesignator"]];
_eliteLoadoutData setVariable ["ATLaunchers", ["launch_NLAW_F"]]; 				
_eliteLoadoutData setVariable ["missileATLaunchers", [
	["launch_Titan_short_blk_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]]; 

_eliteLoadoutData setVariable ["rifles", [
["arifle_G36_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_G36_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_G36_F", "", "acc_pointer_IR", "optic_LRCO_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""]
]];
_eliteLoadoutData setVariable ["carbines", [
["arifle_G36C_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_G36C_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_G36C_F", "", "acc_pointer_IR", "optic_LRCO_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""]
]];
_eliteLoadoutData setVariable ["grenadeLaunchers", [
["GL_M32_F", "", "acc_pointer_IR", "", ["6Rnd_HE_Grenade_shell", "6Rnd_HE_Grenade_shell", "6Rnd_Smoke_Grenade_shell", "6Rnd_Pellets_Grenade_shell", "6Rnd_APERSMine_Grenade_shell"], ["6Rnd_HE_Grenade_shell", "6Rnd_HE_Grenade_shell", "6Rnd_Smoke_Grenade_shell", "6Rnd_Pellets_Grenade_shell", "6Rnd_APERSMine_Grenade_shell"], ""],
["arifle_G36_GL_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_G36_GL_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_G36_GL_F", "", "acc_pointer_IR", "optic_LRCO_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_G36_GL_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellets_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData setVariable ["SMGs", [
["SMG_02_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];
_eliteLoadoutData setVariable ["machineGuns", [
["MMG_02_black_F", "", "acc_pointer_IR", "optic_tws_mg", [], [], "bipod_01_F_blk"],
["MMG_02_camo_F", "", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_mtp"],
["MMG_02_sand_F", "", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_snd"]
]];
_eliteLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_02_camo_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_AMS_snd", [], [], "bipod_01_F_snd"],
["srifle_DMR_02_tna_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_tws", [], [], "bipod_01_F_blk"],
["srifle_DMR_03_multicam_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
["srifle_DMR_03_multicam_F", "", "acc_pointer_IR", "optic_tws", [], [], "bipod_01_F_snd"],
["srifle_DMR_03_khaki_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_khk"],
["srifle_DMR_03_khaki_F", "", "acc_pointer_IR", "optic_tws", [], [], "bipod_01_F_khk"],
["srifle_DMR_03_tan_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
["srifle_DMR_03_tan_F", "", "acc_pointer_IR", "optic_tws", [], [], "bipod_01_F_snd"],
["srifle_DMR_03_woodland_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_khk"],
["srifle_DMR_03_woodland_F", "", "acc_pointer_IR", "optic_tws", [], [], "bipod_01_F_khk"]
]];
_eliteLoadoutData setVariable ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_tws", [], [], ""]
]];
_eliteLoadoutData setVariable ["sidearms", [
["hgun_Pistol_heavy_01_green_F", "", "acc_flashlight_pistol", "", [], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData setVariable ["uniforms", ["U_B_UBACS_mtp_f"]];			
_crewLoadoutData setVariable ["vests", ["V_Chestrig_rgr"]];				
_crewLoadoutData setVariable ["helmets", ["H_HelmetCrew_B"]];			


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["Atlas_U_B_G_HeliPilotCoveralls"]];
_pilotLoadoutData setVariable ["vests", ["V_TacVest_blk"]];
_pilotLoadoutData setVariable ["helmets", ["H_CrewHelmetHeli_B", "H_PilotHelmetHeli_B"]];

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
	["uniforms"] call _fnc_setUniform;

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
	[["GLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
	["primary", 7] call _fnc_addMagazines;

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

//////////////////////
//    Misc Units    //
//////////////////////


["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Unarmed", _unarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;