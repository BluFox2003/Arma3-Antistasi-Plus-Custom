//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AAF"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "AAF support corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_Altis_F"] call _fnc_saveToTemplate; 						
["flagTexture", "\A3\Data_F\Flags\Flag_Altis_CO.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "flag_Altis"] call _fnc_saveToTemplate; 			

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////
["baseSoldiers", [ // Cases matter. Lower case here because allVariables on namespace returns lowercase
	["militia_squadleader", "B_G_Soldier_SL_F"],
	["militia_rifleman", "B_G_Soldier_F"],
	["militia_radioman", "B_G_Soldier_F"],
	["militia_medic", "B_G_medic_F"],
	["militia_engineer", "B_G_engineer_F"],
	["militia_explosivesexpert", "B_G_Soldier_exp_F"],
	["militia_grenadier", "B_G_Soldier_GL_F"],
	["militia_lat", "B_G_Soldier_LAT2_F"],
	["militia_at", "B_G_Soldier_LAT_F"],
	["militia_aa", "B_G_Soldier_F"],
	["militia_machinegunner", "B_G_Soldier_AR_F"],
	["militia_marksman", "B_G_Soldier_M_F"],
	["militia_sniper", "B_G_Soldier_M_F"],

	["military_squadleader", "B_G_Soldier_SL_F"],
	["military_rifleman", "B_G_Soldier_F"],
	["military_radioman", "B_G_Soldier_F"],
	["military_medic", "B_G_medic_F"],
	["military_engineer", "B_G_engineer_F"],
	["military_explosivesexpert", "B_G_Soldier_exp_F"],
	["military_grenadier", "B_G_Soldier_GL_F"],
	["military_lat", "B_G_Soldier_LAT2_F"],
	["military_at", "B_G_Soldier_LAT_F"],
	["military_aa", "B_G_Soldier_F"],
	["military_machinegunner", "B_G_Soldier_AR_F"],
	["military_marksman", "B_G_Soldier_M_F"],
	["military_sniper", "B_G_Soldier_M_F"],

	["elite_squadleader", "B_G_Soldier_SL_F"],
	["elite_rifleman", "B_G_Soldier_F"],
	["elite_radioman", "B_G_Soldier_F"],
	["elite_medic", "B_G_medic_F"],
	["elite_engineer", "B_G_engineer_F"],
	["elite_explosivesexpert", "B_G_Soldier_exp_F"],
	["elite_grenadier", "B_G_Soldier_GL_F"],
	["elite_lat", "B_G_Soldier_LAT2_F"],
	["elite_at", "B_G_Soldier_LAT_F"],
	["elite_aa", "B_G_Soldier_F"],
	["elite_machinegunner", "B_G_Soldier_AR_F"],
	["elite_marksman", "B_G_Soldier_M_F"],
	["elite_sniper", "B_G_Soldier_M_F"],

	["sf_squadleader", "B_G_Soldier_SL_F"],
	["sf_rifleman", "B_G_Soldier_F"],
	["sf_radioman", "B_G_Soldier_F"],
	["sf_medic", "B_G_medic_F"],
	["sf_engineer", "B_G_engineer_F"],
	["sf_explosivesexpert", "B_G_Soldier_exp_F"],
	["sf_grenadier", "B_G_Soldier_GL_F"],
	["sf_lat", "B_G_Soldier_LAT2_F"],
	["sf_at", "B_G_Soldier_LAT_F"],
	["sf_aa", "B_G_Soldier_F"],
	["sf_machinegunner", "B_G_Soldier_AR_F"],
	["sf_marksman", "B_G_Soldier_M_F"],
	["sf_sniper", "B_G_Soldier_M_F"],

	["other_crew", "B_G_Soldier_F"],
	["other_unarmed", "B_G_Survivor_F"],
	["other_official", "B_officer_F"],
	["other_traitor", "B_G_Soldier_F"],
	["other_pilot", "B_G_Soldier_F"],
	["police_squadleader", "B_G_Soldier_F"],
	["police_standard", "B_G_Soldier_F"]
]] call _fnc_saveToTemplate;
//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["I_Quadbike_01_F"]] call _fnc_saveToTemplate; 			
["vehiclesLightUnarmed", ["I_MRAP_03_F"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed",["gmx_aaf_iltis_milan_wdl", "I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F", "gmx_aaf_m113a2dk_wdl"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["gmx_aaf_u1300l_cargo_wdl", "gmx_aaf_kat1_451_cargo_wdl"]] call _fnc_saveToTemplate; 			
["vehiclesCargoTrucks", ["gmx_aaf_u1300l_container_wdl", "gmx_aaf_kat1_451_container_wdl"]] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["gmx_aaf_kat1_451_reammo_wdl", "I_Truck_02_ammo_F"]] call _fnc_saveToTemplate; 		
["vehiclesRepairTrucks", ["gmx_aaf_u1300l_repair_wdl", "I_Truck_02_box_F"]] call _fnc_saveToTemplate; 		
["vehiclesFuelTrucks", ["gmx_aaf_kat1_451_refuel_wdl", "I_Truck_02_fuel_F"]] call _fnc_saveToTemplate;		
["vehiclesMedical", ["gmx_aaf_u1300l_medic_wdl", "I_Truck_02_medical_F", "gmx_aaf_m113a1g_medic_wdl"]] call _fnc_saveToTemplate;			
["vehiclesAPCs", ["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F", "gmx_aaf_luchsa1_wdl", "gmx_aaf_luchsa2_wdl", "gmx_aaf_marder1a1plus_wdl", "gmx_aaf_marder1a1a_wdl", "gmx_aaf_marder1a2_wdl", "gmx_aaf_fuchsa0_command_wdl", "gmx_aaf_fuchsa0_engineer_wdl", "gmx_aaf_fuchsa0_reconnaissance_wdl"]] call _fnc_saveToTemplate; 				
["vehiclesTanks", ["I_MBT_03_cannon_F", "gmx_aaf_leopard1a1a1_wdl", "gmx_aaf_leopard1a3_wdl", "gmx_aaf_leopard1a5_wdl"]] call _fnc_saveToTemplate; 			
["vehiclesAA", ["gmx_aaf_gepard1a1_wdl", "I_LT_01_AA_F"]] call _fnc_saveToTemplate; 				
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;			
["vehiclesIFVs", []] call _fnc_saveToTemplate;				

["vehiclesSam", ["",""]] call _fnc_saveToTemplate; 	//this line determines SAM systems, order: radar, SAM

["vehiclesTransportBoats", ["I_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 	
["vehiclesGunBoats", ["I_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate; 			
["vehiclesAmphibious", ["gmx_aaf_fuchsa0_command_wdl", "gmx_aaf_fuchsa0_engineer_wdl", "gmx_aaf_fuchsa0_reconnaissance_wdl", "I_APC_Wheeled_03_cannon_F"]] call _fnc_saveToTemplate; 		

["vehiclesPlanesCAS", ["I_Plane_Fighter_03_dynamicLoadout_F"]] call _fnc_saveToTemplate; 		
["vehiclesPlanesAA", ["I_Plane_Fighter_04_F"]] call _fnc_saveToTemplate; 			
["vehiclesPlanesTransport", ["gmx_aaf_do28d2_wdl"]] call _fnc_saveToTemplate; 	

["vehiclesHelisLight", ["gmx_aaf_bo105p1m_vbh_wdl"]] call _fnc_saveToTemplate; 		
["vehiclesHelisTransport", ["gmx_aaf_ch53g_wdl", "I_Heli_Transport_02_F", "I_Heli_light_03_unarmed_F"]] call _fnc_saveToTemplate; 	
["vehiclesHelisAttack", ["I_Heli_light_03_dynamicLoadout_F", "gmx_aaf_bo105p_pah1a1_wdl"]] call _fnc_saveToTemplate; 		

["vehiclesArtillery", [
["I_Truck_02_MRL_F", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate; 		

["uavsAttack", ["I_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate; 				
["uavsPortable", ["I_UAV_01_F"]] call _fnc_saveToTemplate; 				

["vehiclesMilitiaLightArmed", ["I_C_Offroad_02_LMG_F"]] call _fnc_saveToTemplate; 
["vehiclesMilitiaTrucks", ["I_Truck_02_transport_F", "I_Truck_02_covered_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["gmx_aaf_iltis_cargo_wdl"]] call _fnc_saveToTemplate;
["vehiclesMilitiaApcs", ["gmx_aaf_m113a1g_apc_wdl", "gmx_aaf_m113a1g_apc_milan_wdl"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTanks", ["I_LT_01_AT_F", "I_LT_01_cannon_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F", "B_GEN_Offroad_01_comms_F", "B_GEN_Offroad_01_covered_F", "B_GEN_Van_02_transport_F"]] call _fnc_saveToTemplate;

["staticMGs", ["I_HMG_02_high_F"]] call _fnc_saveToTemplate; 					
["staticAT", ["I_static_AT_F"]] call _fnc_saveToTemplate; 					
["staticAA", ["I_static_AA_F"]] call _fnc_saveToTemplate; 					
["staticMortars", ["I_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", [""]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["baggedMGs", [["I_G_HMG_02_weapon_F", "I_G_HMG_02_support_high_F"]]] call _fnc_saveToTemplate; 				
["baggedAT", [["I_AT_01_weapon_F", "I_HMG_01_support_F"]]] call _fnc_saveToTemplate; 					
["baggedAA", [["I_AA_01_weapon_F", "I_HMG_01_support_F"]]] call _fnc_saveToTemplate; 					
["baggedMortars", [["I_Mortar_01_support_F", "I_Mortar_01_weapon_F"]]] call _fnc_saveToTemplate; 			//this line determines bagged static mortars -- Example: ["baggedMortars", [["B_Mortar_01_weapon_F", "B_Mortar_01_support_F"]]] -- Array, can contain multiple assets

["howitzerMagazineHE", "not_supported"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine_Range_Mag"]] call _fnc_saveToTemplate;


["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", [
		//Team Leader
		["vanilla_blufor_teamLeader"] call A3A_fnc_getLoadout,
		//Medic
		["vanilla_blufor_medic"] call A3A_fnc_getLoadout,
		//Autorifleman
		["vanilla_blufor_machineGunner"] call A3A_fnc_getLoadout,
		//Marksman
		["vanilla_blufor_marksman"] call A3A_fnc_getLoadout,
		//Anti-tank Scout
		["vanilla_blufor_AT"] call A3A_fnc_getLoadout,
		//AT2
		["vanilla_blufor_rifleman"] call A3A_fnc_getLoadout
	]
] call _fnc_saveToTemplate;

["pvpVehicles", ["gmx_aaf_iltis_cargo_wdl"]] call _fnc_saveToTemplate;


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
_loadoutData setVariable ["lightATLaunchers", []]; 			
_loadoutData setVariable ["ATLaunchers", []]; 				
_loadoutData setVariable ["missileATLaunchers", []]; 		
_loadoutData setVariable ["AALaunchers", []];
_loadoutData setVariable ["sidearms", []]; 					

_loadoutData setVariable ["ATMines", ["ATMine_Range_Mag"]]; 					
_loadoutData setVariable ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]]; 					
_loadoutData setVariable ["lightExplosives", ["DemoCharge_Remote_Mag"]]; 			
_loadoutData setVariable ["heavyExplosives", ["SatchelCharge_Remote_Mag"]]; 			

_loadoutData setVariable ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade", "gm_handgrenade_frag_dm51a1", "gm_handgrenade_frag_dm51"]]; 		
_loadoutData setVariable ["antiTankGrenades", []]; 			
_loadoutData setVariable ["smokeGrenades", ["SmokeShell"]];
_loadoutData setVariable ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

_loadoutData setVariable ["maps", ["ItemMap"]];
_loadoutData setVariable ["watches", ["ItemWatch"]];
_loadoutData setVariable ["compasses", ["ItemCompass"]];
_loadoutData setVariable ["radios", ["ItemRadio"]];
_loadoutData setVariable ["gpses", ["ItemGPS"]];
_loadoutData setVariable ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData setVariable ["binoculars", ["Binocular"]];		
_loadoutData setVariable ["Rangefinder", ["Rangefinder"]];

_loadoutData setVariable ["uniforms", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["Hvests", []];
_loadoutData setVariable ["backpacks", []];
_loadoutData setVariable ["longRangeRadios", []];
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
_sfLoadoutData setVariable ["uniforms", ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"]];		
_sfLoadoutData setVariable ["vests", ["V_CarrierRigKBT_01_light_Olive_F"]];				
_sfLoadoutData setVariable ["Hvests", ["V_CarrierRigKBT_01_heavy_Olive_F"]];
_sfLoadoutData setVariable ["backpacks", ["B_TacticalPack_oli", "B_Carryall_oli"]];			
_sfLoadoutData setVariable ["helmets", ["H_HelmetSpecB", "H_Booniehat_dgtl", "H_Cap_oli_hs"]];				
_sfLoadoutData setVariable ["binoculars", ["Laserdesignator"]];
_sfLoadoutData setVariable ["longRangeRadios", ["B_RadioBag_01_digi_F"]];
_sfLoadoutData setVariable ["missileATLaunchers", [
	["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT", "Titan_AT", "Titan_AP"], [], ""]
]]; 
_sfLoadoutData setVariable ["ATLaunchers", ["launch_NLAW_F"]];	
_sfLoadoutData setVariable ["AALaunchers", [
["launch_I_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];

_sfLoadoutData setVariable ["rifles", [
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_ERCO_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData setVariable ["carbines", [
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_ERCO_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData setVariable ["grenadeLaunchers", [
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_ERCO_khk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData setVariable ["SMGs", [
["gm_mp5sd2_blk", "", "", "", ["gm_30Rnd_9x19mm_B_DM51_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk" , "gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk"], [], ""],
["gm_mp5sd3_blk", "", "", "", ["gm_30Rnd_9x19mm_B_DM51_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk" , "gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk"], [], ""]
]];
_sfLoadoutData setVariable ["machineGuns", [
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_ERCO_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_khk"],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_MRCO", ["150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_khk"],
["arifle_SPAR_02_khk_F", "muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_ERCO_khk_F", ["150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"], [], "bipod_01_F_khk"],
["LMG_Mk200_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
["LMG_Mk200_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
["LMG_Mk200_F", "muzzle_snds_H", "acc_pointer_IR", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"]
]];
_sfLoadoutData setVariable ["marksmanRifles", [
["arifle_SPAR_03_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_khk_F", "muzzle_snds_B_khk_F", "acc_pointer_IR", "optic_SOS_khk_F", [], [], "bipod_01_F_khk"],
["arifle_SPAR_03_snd_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
["arifle_SPAR_03_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_ERCO_blk_F", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_khk_F", "muzzle_snds_B_khk_F", "acc_pointer_IR", "optic_ERCO_khk_F", [], [], "bipod_01_F_khk"],
["arifle_SPAR_03_snd_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_ERCO_snd_F", [], [], "bipod_01_F_snd"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_MRCO", [], [], "bipod_01_F_snd"]
]];
_sfLoadoutData setVariable ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_lrps", [], [], ""]
]];
_sfLoadoutData setVariable ["sidearms", [
["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData setVariable ["uniforms", ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"]];
_militaryLoadoutData setVariable ["vests", ["V_PlateCarrierIA2_dgtl", "V_PlateCarrierIA1_dgtl"]];			
_militaryLoadoutData setVariable ["Hvests", ["V_PlateCarrierIAGL_dgtl"]];
_militaryLoadoutData setVariable ["backpacks", ["B_Carryall_oli", "B_Kitbag_rgr"]];		
_militaryLoadoutData setVariable ["helmets", ["H_HelmetIA"]];		
_militaryLoadoutData setVariable ["lightATLaunchers", [
	["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm12_pzf3", "gm_1Rnd_60mm_heat_dm12_pzf3"], [], ""],
	["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm22_pzf3", "gm_1Rnd_60mm_heat_dm22_pzf3"], [], ""],
	["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm32_pzf3", "gm_1Rnd_60mm_heat_dm32_pzf3"], [], ""]
]];
_militaryLoadoutData setVariable ["ATLaunchers", [
    ["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf84_blk", ["gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf"], [], ""],
	["launch_NLAW_F", "", "", "", ["NLAW_F"], [], ""]
]]; 						
_militaryLoadoutData setVariable ["AALaunchers", ["gm_fim43_oli"]];
_militaryLoadoutData setVariable ["longRangeRadios", ["B_RadioBag_01_digi_F"]];

_militaryLoadoutData setVariable ["rifles", [
["arifle_Mk20_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_Mk20_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["gm_g36e_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_g36_blk", "gm_30Rnd_556x45mm_B_DM11_g36_blk", "gm_30Rnd_556x45mm_B_T_DM21_g36_blk"], [], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["arifle_Mk20C_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_Mk20C_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["arifle_Mk20_GL_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Mk20_GL_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData setVariable ["SMGs", [
["gm_mp5a2_blk", "", "", "", ["gm_30Rnd_9x19mm_B_DM51_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk" , "gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk"], [], ""],
["gm_mp5a3_blk", "", "", "", ["gm_30Rnd_9x19mm_B_DM51_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk" , "gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk"], [], ""]
]];
_militaryLoadoutData setVariable ["machineGuns", [
["LMG_Mk200_F", "", "acc_flashlight", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_03_F_blk"],
["LMG_Mk200_F", "", "acc_flashlight", "optic_ACO_grn", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_03_F_blk"]
]];
_militaryLoadoutData setVariable ["marksmanRifles", [
["srifle_EBR_F", "", "acc_flashlight", "optic_SOS", ["20Rnd_762x51_Mag"], [], "bipod_03_F_blk"]
]];
_militaryLoadoutData setVariable ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS_tna_F", [], [], ""]
]];
_militaryLoadoutData setVariable ["sidearms", [
["hgun_P07_F", "", "", "", [], [], ""],
["hgun_ACPC2_F", "", "acc_flashlight_pistol", "", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData setVariable ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData setVariable ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData setVariable ["helmets", ["H_Cap_police", "H_PASGT_basic_black_F", "H_PASGT_basic_blue_F"]];
_policeLoadoutData setVariable ["smgs", [
["gm_mp5a2_blk", "", "", "", ["gm_30Rnd_9x19mm_B_DM11_mp5_blk"], [], ""],
["gm_mp5a3_blk", "", "", "", ["gm_30Rnd_9x19mm_B_DM11_mp5_blk"], [], ""]
]];
_policeLoadoutData setVariable ["sidearms", ["hgun_P07_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData setVariable ["uniforms", ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"]];		
_militiaLoadoutData setVariable ["vests", ["V_Chestrig_oli", "V_TacVest_oli"]];			
_militiaLoadoutData setVariable ["backpacks", ["B_AssaultPack_dgtl", "B_FieldPack_oli"]];		
_militiaLoadoutData setVariable ["helmets", ["gm_dk_headgear_m96_oli", "H_MilCap_dgtl", "H_Booniehat_dgtl"]];
_militiaLoadoutData setVariable ["longRangeRadios", ["gm_ge_backpack_sem35_oli"]];

_militiaLoadoutData setVariable ["lightATLaunchers", ["gm_m72a3_oli","gm_pzf44_2_oli"]]; 			
_militiaLoadoutData setVariable ["ATLaunchers", [
    ["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf84_blk", ["gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf"], [], ""]
]]; 						
_militiaLoadoutData setVariable ["AALaunchers", ["gm_fim43_oli"]];

_militiaLoadoutData setVariable ["rifles", [
["gm_c7a1_oli", "", "", "gm_c79a1_oli", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["gm_c7a1_blk", "", "", "gm_c79a1_blk", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["gm_m16a1_blk", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["gm_m16a2_blk", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_TRG21_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData setVariable ["carbines", [
["arifle_TRG20_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["arifle_TRG21_GL_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData setVariable ["SMGs", [
["gm_mp5a2_blk", "", "", "", ["gm_30Rnd_9x19mm_B_DM11_mp5_blk"], [], ""],
["gm_mp5a3_blk", "", "", "", ["gm_30Rnd_9x19mm_B_DM11_mp5_blk"], [], ""]
]];
_militiaLoadoutData setVariable ["machineGuns", [
["gm_mg3_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""]
]];
_militiaLoadoutData setVariable ["marksmanRifles", [
["srifle_DMR_06_camo_F", "", "", "optic_MRCO", ["10Rnd_Mk14_762x51_Mag"], [], ""],
["srifle_DMR_06_olive_F", "", "", "optic_MRCO", ["10Rnd_Mk14_762x51_Mag"], [], ""]
]];
_militiaLoadoutData setVariable ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_lrps", [], [], ""]
]];
_militiaLoadoutData setVariable ["sidearms", ["hgun_ACPC2_F"]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData setVariable ["uniforms", ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"]];
_eliteLoadoutData setVariable ["vests", ["V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"]];			
_eliteLoadoutData setVariable ["backpacks", ["B_Carryall_oli"]];		
_eliteLoadoutData setVariable ["helmets", ["H_HelmetSpecB"]];		
_eliteLoadoutData setVariable ["binoculars", ["Laserdesignator"]];
_eliteLoadoutData setVariable ["longRangeRadios", ["B_RadioBag_01_digi_F"]];				
_eliteLoadoutData setVariable ["missileATLaunchers", [
	["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT", "Titan_AT", "Titan_AP"], [], ""]
]]; 
_eliteLoadoutData setVariable ["ATLaunchers", ["launch_NLAW_F"]];	
_eliteLoadoutData setVariable ["AALaunchers", [
["launch_I_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];

_eliteLoadoutData setVariable ["rifles", [
["arifle_SPAR_02_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData setVariable ["carbines", [
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData setVariable ["grenadeLaunchers", [
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData setVariable ["SMGs", [
["SMG_02_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Yorris", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];
_eliteLoadoutData setVariable ["machineGuns", [
["LMG_Mk200_F", "", "acc_pointer_IR", "optic_tws_mg", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_03_F_blk"]
]];
_eliteLoadoutData setVariable ["marksmanRifles", [
["srifle_EBR_F", "", "acc_pointer_IR", "optic_tws", ["20Rnd_762x51_Mag"], [], "bipod_03_F_blk"]
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
_crewLoadoutData setVariable ["uniforms", ["U_Tank_green_F"]];
_crewLoadoutData setVariable ["vests", ["V_BandollierB_oli"]];
_crewLoadoutData setVariable ["helmets", ["H_HelmetCrew_I"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["U_I_HeliPilotCoveralls"]];
_pilotLoadoutData setVariable ["vests", ["V_TacVest_oli"]];
_pilotLoadoutData setVariable ["helmets", ["H_PilotHelmetHeli_I", "H_CrewHelmetHeli_I"]];


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


	["rifles"] call _fnc_setPrimary;
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

	["rifles"] call _fnc_setPrimary;
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
	["vests"] call _fnc_setVest;
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
	["vests"] call _fnc_setVest;
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

	["rifles"] call _fnc_setPrimary;
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
