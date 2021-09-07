//////////////////////////
//   Side Information   //
//////////////////////////
["name", "TKA"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "TKA Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_TKA_B_Army"] call _fnc_saveToTemplate; 						
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_b_army_co.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "UK3CB_Marker_TKA_B_Army"] call _fnc_saveToTemplate; 			

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

["vehiclesBasic", ["UK3CB_TKA_B_YAVA"]] call _fnc_saveToTemplate; 			
["vehiclesLightUnarmed", ["UK3CB_TKA_B_BRDM2_UM", "UK3CB_TKA_B_M1025", "UK3CB_TKA_B_M998_2DR", "UK3CB_TKA_B_BTR40", "UK3CB_TKA_B_M998_4DR"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed", ["UK3CB_TKA_B_Ural_Zu23","UK3CB_TKA_B_M1117","UK3CB_TKA_B_BTR40_MG", "UK3CB_TKA_B_BRDM2", "UK3CB_TKA_B_BRDM2_ATGM", "UK3CB_TKA_B_BRDM2_HQ", "UK3CB_TKA_B_LR_SF_M2", "UK3CB_TKA_B_M1025_M2", "UK3CB_TKA_B_MaxxPro_M2"]] call _fnc_saveToTemplate; 		
["vehiclesTrucks", ["UK3CB_TKA_B_Kamaz_Open", "UK3CB_TKA_B_Kamaz_Closed"]] call _fnc_saveToTemplate; 			
["vehiclesCargoTrucks", ["UK3CB_TKA_B_Ural_Recovery"]] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["UK3CB_TKA_B_Ural_Ammo","UK3CB_TKA_B_Kamaz_Ammo"]] call _fnc_saveToTemplate; 		
["vehiclesRepairTrucks", ["UK3CB_TKA_B_Ural_Repair", "UK3CB_TKA_B_Kamaz_Repair"]] call _fnc_saveToTemplate; 		
["vehiclesFuelTrucks", ["UK3CB_TKA_B_Kamaz_Fuel", "UK3CB_TKA_B_Ural_Fuel"]] call _fnc_saveToTemplate;		
["vehiclesMedical", ["UK3CB_TKA_B_M113_AMB"]] call _fnc_saveToTemplate;			
["vehiclesAPCs", ["UK3CB_TKA_B_BMP1", "UK3CB_TKA_B_BMP2", "UK3CB_TKA_B_BTR60", "UK3CB_TKA_B_MTLB_ZU23"]] call _fnc_saveToTemplate; 				
["vehiclesTanks", ["UK3CB_TKA_B_T72A", "UK3CB_TKA_B_T72B", "UK3CB_TKA_B_T72BM"]] call _fnc_saveToTemplate; 			
["vehiclesAA", ["UK3CB_TKA_B_ZsuTank"]] call _fnc_saveToTemplate; 				
["vehiclesLightAPCs", ["UK3CB_KDF_B_BMD1"]] call _fnc_saveToTemplate;			
["vehiclesIFVs", []] call _fnc_saveToTemplate;				

["vehiclesSam", ["",""]] call _fnc_saveToTemplate; 	//this line determines SAM systems, order: radar, SAM

["vehiclesTransportBoats", ["UK3CB_TKA_B_RHIB"]] call _fnc_saveToTemplate; 	
["vehiclesGunBoats", ["UK3CB_TKA_B_RHIB_Gunboat"]] call _fnc_saveToTemplate; 			
["vehiclesAmphibious", ["UK3CB_TKA_B_BTR60", "UK3CB_TKA_B_M113_M2", "UK3CB_TKA_B_M113_M240"]] call _fnc_saveToTemplate; 		

["vehiclesPlanesCAS", ["UK3CB_TKA_B_Su25SM", "UK3CB_TKA_B_L39_CAS"]] call _fnc_saveToTemplate; 		
["vehiclesPlanesAA", ["UK3CB_TKA_B_L39_AA"]] call _fnc_saveToTemplate; 			
["vehiclesPlanesTransport", ["UK3CB_TKA_B_C130J"]] call _fnc_saveToTemplate; 	

["vehiclesHelisLight", ["UK3CB_TKA_B_UH1H_M240"]] call _fnc_saveToTemplate; 		
["vehiclesHelisTransport", ["UK3CB_TKA_B_UH1H_M240", "UK3CB_TKA_B_Mi8"]] call _fnc_saveToTemplate; 	
["vehiclesHelisAttack", ["UK3CB_TKA_B_Mi_24P", "UK3CB_TKA_B_Mi_24V", "UK3CB_TKA_B_Mi8AMTSh", "UK3CB_TKA_B_UH1H_GUNSHIP"]] call _fnc_saveToTemplate; 		

["vehiclesArtillery", [
["UK3CB_TKA_B_BM21", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate; 		

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate; 				
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate; 				

["vehiclesMilitiaLightArmed", ["UK3CB_TKA_B_Hilux_Dshkm", "UK3CB_TKA_B_Hilux_Spg9"]] call _fnc_saveToTemplate; 
["vehiclesMilitiaTrucks", ["UK3CB_TKA_B_Ural_Open", "UK3CB_TKA_B_Ural"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_TKA_B_Hilux_Closed", "UK3CB_TKA_B_Hilux_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaApcs", ["UK3CB_TKA_B_MTLB_PKT", "UK3CB_TKA_B_M113_M2", "UK3CB_TKA_B_M113_M240"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTanks", ["UK3CB_TKA_B_T34", "UK3CB_TKA_B_T55"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_TKP_B_Datsun_Pickup", "UK3CB_TKP_B_Hilux_Closed", "UK3CB_TKP_B_Hilux_Open", "UK3CB_TKP_B_Lada_Police", "UK3CB_TKP_B_LandRover_Open", "UK3CB_TKP_B_LandRover_Closed", "UK3CB_TKP_B_UAZ_Closed", "UK3CB_TKP_B_UAZ_Open"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_TKA_B_DSHKM"]] call _fnc_saveToTemplate; 					
["staticAT", ["RHS_TOW_TriPod_D"]] call _fnc_saveToTemplate; 					
["staticAA", ["rhsgref_cdf_b_Igla_AA_pod", "rhsgref_cdf_b_ZU23", "RHS_Stinger_AA_pod_USMC_WD"]] call _fnc_saveToTemplate; 					
["staticMortars", ["UK3CB_TKA_B_2b14_82mm"]] call _fnc_saveToTemplate;
["staticHowitzers", ["UK3CB_TKA_B_D30"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["baggedMGs", [["RHS_DShkM_Gun_Bag", "RHS_DShkM_TripodHigh_Bag"]]] call _fnc_saveToTemplate; 				
["baggedAT", [["rhs_Tow_Gun_Bag", "rhs_TOW_Tripod_Bag"]]] call _fnc_saveToTemplate; 					
["baggedAA", []] call _fnc_saveToTemplate; 					
["baggedMortars", [["RHS_Podnos_Gun_Bag", "RHS_Podnos_Bipod_Bag"]]] call _fnc_saveToTemplate; 			


["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;


["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", [
	["rhs_usaf_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["rhs_usaf_medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["rhs_usaf_machineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["rhs_usaf_marksman"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["rhs_usaf_AT"] call A3A_fnc_getLoadout,
	//AT2
	["rhs_usaf_rifleman"] call A3A_fnc_getLoadout
]] call _fnc_saveToTemplate;
["pvpVehicles", ["rhsusf_m1240a1_usarmy_wd","rhsusf_M1220_M153_M2_usarmy_wd"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
//     "Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData setVariable ["rifles", []];
_loadoutData setVariable ["carbines", []];
_loadoutData setVariable ["grenadeLaunchers", []];
_loadoutData setVariable ["SMGs", []];
_loadoutData setVariable ["machineGuns", []];
_loadoutData setVariable ["marksmanrifles", []];
_loadoutData setVariable ["sniperrifles", []];
_loadoutData setVariable ["AALaunchers", []];
_loadoutData setVariable ["ATLaunchers", []];
_loadoutData setVariable ["lightATLaunchers", []];
_loadoutData setVariable ["sidearms", []];
_loadoutData setVariable ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData setVariable ["APMines", ["rhsusf_mine_m14_mag"]]; 
_loadoutData setVariable ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData setVariable ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData setVariable ["antiInfantryGrenades", []];
_loadoutData setVariable ["antiTankGrenades", []];
_loadoutData setVariable ["smokeGrenades", ["rhs_mag_an_m8hc"]]; 			
_loadoutData setVariable ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];	

_loadoutData setVariable ["maps", ["ItemMap"]];				
_loadoutData setVariable ["watches", ["ItemWatch"]];		
_loadoutData setVariable ["compasses", ["ItemCompass"]];	
_loadoutData setVariable ["radios", ["ItemRadio"]];			
_loadoutData setVariable ["gpses", ["ItemGPS"]];			
_loadoutData setVariable ["NVGs", ["UK3CB_ANPVS7"]];						
_loadoutData setVariable ["binoculars", ["Binocular"]];		
_loadoutData setVariable ["Rangefinder", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData setVariable ["uniforms", []];					
_loadoutData setVariable ["MGvests", []];						
_loadoutData setVariable ["MEDvests", []];
_loadoutData setVariable ["SLvests", []];
_loadoutData setVariable ["SNIvests", []];
_loadoutData setVariable ["GLvests", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["backpacks", []];	
_loadoutData setVariable ["Medbackpacks", ["UK3CB_TKC_C_B_Sidor_MED"]];				
_loadoutData setVariable ["Atbackpacks", []];
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
_loadoutData setVariable ["items_explosivesExpert_extras", ["Toolkit", "MineDetector", "ACE_Clacker", "ACE_DefusalKit"]];
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
_sfLoadoutData setVariable ["uniforms", ["UK3CB_TKA_B_U_CombatUniform_01_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_01_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_02_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_02_DES_MARPAT"]];
_sfLoadoutData setVariable ["vests", ["UK3CB_V_Chestrig_Tan", "UK3CB_TKA_B_V_GA_LITE_TAN", "UK3CB_TKA_B_V_GA_HEAVY_TAN"]];
_sfLoadoutData setVariable ["backpacks", ["UK3CB_TKA_B_B_RIF"]];
_sfLoadoutData setVariable ["helmets", ["UK3CB_TKA_B_H_DES_MARPAT"]];
_sfLoadoutData setVariable ["NVGs", ["rhsusf_ANPVS_14"]];
_sfLoadoutData setVariable ["binoculars", ["Laserdesignator"]];
_sfLoadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]]; 
_sfLoadoutData setVariable ["AALaunchers", ["rhs_weap_igla"]];
_sfLoadoutData setVariable ["Atbackpacks", ["B_Carryall_khk"]];
_sfLoadoutData setVariable ["longRangeRadios", ["UK3CB_B_B_Radio_Backpack"]];	

_sfLoadoutData setVariable ["rifles", [
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""]
]];
_sfLoadoutData setVariable ["carbines", [ 
["rhs_weap_m4a1_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_RX01_NoFilter_tan", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],
["rhs_weap_m4a1_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_ACOG_d", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],				
["rhs_weap_m4a1_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_eotech_552_d", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""]
]];
_sfLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_m4a1_m203s_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_RX01_NoFilter_tan", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_ACOG_d", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_eotech_552_d", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData setVariable ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData setVariable ["marksmanrifles", [
["rhs_weap_sr25_d", "rhsusf_acc_SR25S_d", "rhsusf_acc_anpeq15side", "rhsusf_acc_ACOG_d", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], ""],
["rhs_weap_sr25_d", "rhsusf_acc_SR25S_d", "rhsusf_acc_anpeq15side", "rhsusf_acc_M8541_d", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], ""],
["rhs_weap_sr25_ec_d", "rhsgref_sdn6_suppressor", "rhsusf_acc_anpeq15side", "rhsusf_acc_ACOG_d", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], ""],
["rhs_weap_sr25_ec_d", "rhsgref_sdn6_suppressor", "rhsusf_acc_anpeq15side", "rhsusf_acc_M8541_d", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], ""]
]];
_sfLoadoutData setVariable ["sniperrifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_sfLoadoutData setVariable ["lightATLaunchers", ["rhs_weap_m72a7"]];
_sfLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_1", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_1", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_1", ["rhs_rpg7_TBG7V_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_sfLoadoutData setVariable ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData setVariable ["uniforms", ["UK3CB_TKA_B_U_CombatUniform_01_WDL", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_01_WDL", "UK3CB_TKA_B_U_CombatUniform_02_WDL", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_02_WDL"]];		
_militaryLoadoutData setVariable ["vests", ["UK3CB_TKA_B_V_GA_LITE_TAN", "UK3CB_TKA_B_V_GA_LITE_WDL", "UK3CB_V_Chestrig_WDL_01"]];							
_militaryLoadoutData setVariable ["SLvests", ["UK3CB_TKA_B_V_GA_HEAVY_TAN", "UK3CB_TKA_B_V_GA_HEAVY_WDL"]];
_militaryLoadoutData setVariable ["backpacks", ["B_Carryall_khk", "B_FieldPack_khk"]];		
_militaryLoadoutData setVariable ["helmets", ["UK3CB_TKA_B_H_WDL", "UK3CB_CW_US_B_LATE_H_PASGT_02_WDL", "UK3CB_TKA_B_H_BoonieHat_WDL"]];		
_militaryLoadoutData setVariable ["AALaunchers", ["rhs_weap_igla"]];
_militaryLoadoutData setVariable ["Atbackpacks", ["B_Carryall_khk"]];
_militaryLoadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_grenade_mkii_mag"]]; 
_militaryLoadoutData setVariable ["longRangeRadios", ["UK3CB_B_B_Radio_Backpack"]];	
_militaryLoadoutData setVariable ["lightATLaunchers", ["rhs_weap_m72a7"]];
_militaryLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VS_mag", "rhs_rpg7_PG7VS_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VS_mag", "rhs_rpg7_PG7VS_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];

_militaryLoadoutData setVariable ["rifles", [
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M441_HE", "rhs_mag_m661_green", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData setVariable ["machineGuns", [
["rhs_weap_fnmag", "", "", "", ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m249", "", "", "", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], ""]
]];
_militaryLoadoutData setVariable ["marksmanrifles", [
["UK3CB_SVD_OLD_NPZ", "", "", "rhsusf_acc_ACOG", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "UK3CB_SVD_10rnd_762x54_RT"], [], ""]
]];
_militaryLoadoutData setVariable ["sniperrifles", [
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], ""],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], ""],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], ""]
]];
_militaryLoadoutData setVariable ["sidearms", ["rhsusf_weap_m9"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData setVariable ["uniforms", ["UK3CB_TKP_B_U_CombatUniform_TAN"]];
_policeLoadoutData setVariable ["vests", ["UK3CB_ANP_B_V_TacVest_BLU", "UK3CB_ANP_B_V_TacVest_Tan", "UK3CB_TKP_B_V_GA_LITE_BLK"]];
_policeLoadoutData setVariable ["helmets", ["UK3CB_TKP_B_H_Beret", "UK3CB_TKP_B_H_Patrolcap_TAN"]];
_policeLoadoutData setVariable ["SMGs", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData setVariable ["sidearms", ["rhs_weap_makarov_pm", "rhs_weap_tt33"]]; 

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData setVariable ["uniforms", ["UK3CB_TKP_B_U_QRF_CombatUniform_TAN", "UK3CB_TKP_B_U_QRF_CombatUniform_Shortsleeve_TAN"]];
_militiaLoadoutData setVariable ["vests", ["rhs_6b2_chicom", "rhs_6b2_RPK", "rhs_chicom_khk"]];
_militiaLoadoutData setVariable ["backpacks", ["rhs_sidor", "rhs_rd54_vest"]];		
_militiaLoadoutData setVariable ["helmets", ["UK3CB_TKA_I_H_SSh68_Khk", "UK3CB_TKA_I_H_Patrolcap_OLI"]];
_militiaLoadoutData setVariable ["AALaunchers", ["rhs_weap_igla"]];
_militiaLoadoutData setVariable ["Atbackpacks", ["rhs_rpg_at"]];
_militiaLoadoutData setVariable ["longRangeRadios", ["rhs_r148"]];	
_militiaLoadoutData setVariable ["lightATLaunchers", ["rhs_weap_rpg18"]];
_militiaLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""],
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""]
]];

_militiaLoadoutData setVariable ["rifles", [
["rhs_weap_ak74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_m70b1", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""],
["rhs_weap_m70ab2", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""],
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A1_LSW", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData setVariable ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""]
]]; 					
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m661_green", "rhs_mag_m714_White"], ""]
]]; 									
_militiaLoadoutData setVariable ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["UK3CB_RPK", "", "", "", ["UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_RT"], [], ""],
["UK3CB_RPK_74", "", "", "", ["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]]; 				
_militiaLoadoutData setVariable ["marksmanrifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "UK3CB_SVD_10rnd_762x54_RT"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_anpvs2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""]
]]; 			
_militiaLoadoutData setVariable ["sniperrifles", [
["rhs_weap_m38_rail", "", "", "optic_MRCO", [], [], ""]
]]; 				
_militiaLoadoutData setVariable ["sidearms", ["rhs_weap_makarov_pm", "rhs_weap_tt33"]]; 					
_militiaLoadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhssaf_mag_br_m75", "rhssaf_mag_br_m84"]];


/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData setVariable ["uniforms", ["UK3CB_TKA_B_U_CombatUniform_01_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_01_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_02_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_02_DES_MARPAT"]];
_eliteLoadoutData setVariable ["vests", ["UK3CB_TKA_B_V_GA_LITE_TAN", "UK3CB_TKA_B_V_GA_HEAVY_TAN"]];
_eliteLoadoutData setVariable ["backpacks", ["UK3CB_TKA_B_B_RIF"]];
_eliteLoadoutData setVariable ["helmets", ["UK3CB_TKA_B_H_DES_MARPAT"]];
_eliteLoadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]]; 
_eliteLoadoutData setVariable ["AALaunchers", ["rhs_weap_igla"]];
_eliteLoadoutData setVariable ["Atbackpacks", ["B_Carryall_khk"]];
_eliteLoadoutData setVariable ["longRangeRadios", ["UK3CB_B_B_Radio_Backpack"]];	
_eliteLoadoutData setVariable ["lightATLaunchers", ["rhs_weap_m72a7"]];
_eliteLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_1", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_1", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_1", ["rhs_rpg7_TBG7V_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];

_eliteLoadoutData setVariable ["rifles", [
["UK3CB_M16A3", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""]
]];
_eliteLoadoutData setVariable ["carbines", [ 
["rhs_weap_m4a1_carryhandle", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],
["rhs_weap_m4a1_carryhandle", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],				
["rhs_weap_m4a1_carryhandle", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],
["rhs_weap_m4", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],
["rhs_weap_m4", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""],				
["rhs_weap_m4", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], [], ""]
]];
_eliteLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_m4a1_carryhandle_m203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_carryhandle_m203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_carryhandle_m203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_carryhandle_m203S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_carryhandle_m203S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_carryhandle_m203S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM", "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];

_eliteLoadoutData setVariable ["machineGuns", [
["rhs_weap_m249_pip", "", "", "rhsusf_acc_ELCAN", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_RX01_NoFilter", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_eotech_552", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m240B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_eliteLoadoutData setVariable ["marksmanrifles", [
["rhs_weap_sr25", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], ""],
["rhs_weap_sr25", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], ""],
["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], ""],
["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], ""]
]];
_eliteLoadoutData setVariable ["sniperrifles", [
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_eliteLoadoutData setVariable ["sidearms", [
["rhsusf_weap_glock17g4", "", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData setVariable ["uniforms", ["UK3CB_TKA_B_U_CrewUniform_WDL"]];			
_crewLoadoutData setVariable ["vests", ["V_TacVest_khk"]];				
_crewLoadoutData setVariable ["helmets", ["UK3CB_H_Crew_Cap"]];			
_crewLoadoutData setVariable ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["UK3CB_TKA_B_U_J_Pilot_NATO"]];			
_pilotLoadoutData setVariable ["vests", ["V_TacVest_khk"]];			
_pilotLoadoutData setVariable ["helmets", ["rhsusf_hgu56p_green", "rhsusf_hgu56p_mask_green"]];			
_pilotLoadoutData setVariable ["SMGs", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];
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
	[["SLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["antiTankGrenades", 1] call _fnc_addItem;
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
	["antiTankGrenades", 1] call _fnc_addItem;
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
	[["MEDvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["Medbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["carbines"] call _fnc_setPrimary;
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

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 3] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["antiTankGrenades", 3] call _fnc_addItem;
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

	["rifles"] call _fnc_setPrimary;
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

	["carbines"] call _fnc_setPrimary;
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
	[["Atbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["rifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	[selectRandom ["ATLaunchers", "lightATLaunchers"]] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;
	["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_lat_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["antiTankGrenades", 2] call _fnc_addItem;
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
	[["Atbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["rifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	[["missileATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;
	["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_at_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["antiTankGrenades", 2] call _fnc_addItem;
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
	[["Atbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["rifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_aa_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["MGvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_machineGunner_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
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


	["marksmanrifles"] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_marksman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
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
	[["SNIvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["sniperrifles"] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_sniper_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
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

	[["SMGs", "shotguns"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

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

	[["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
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


/////////////////////////////
//  Elite Units  //
/////////////////////////////
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