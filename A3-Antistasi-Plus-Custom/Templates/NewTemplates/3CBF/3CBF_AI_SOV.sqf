//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Red Army"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Red Army Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_CW_SOV"] call _fnc_saveToTemplate; 						
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_CW_SOV\Flag\cw_sov_flag_co.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "UK3CB_Marker_CW_SOV"] call _fnc_saveToTemplate; 			

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////
["baseSoldiers", [ // Cases matter. Lower case here because allVariables on namespace returns lowercase
	["militia_squadleader", "rhs_msv_sergeant"],
	["militia_rifleman", "rhs_msv_rifleman"],
	["militia_radioman", "rhs_msv_rifleman"],
	["militia_medic", "rhs_msv_medic"],
	["militia_engineer", "rhs_msv_engineer"],
	["militia_explosivesexpert", "rhs_msv_rifleman"],
	["militia_grenadier", "rhs_msv_grenadier"],
	["militia_lat", "rhs_msv_LAT"],
	["militia_at", "rhs_msv_at"],
	["militia_aa", "rhs_msv_aa"],
	["militia_machinegunner", "rhs_msv_machinegunner"],
	["militia_marksman", "rhs_msv_marksman"],
	["militia_sniper", "rhs_msv_marksman"],

	["military_squadleader", "rhs_msv_emr_sergeant"],
	["military_rifleman", "rhs_msv_emr_rifleman"],
	["military_radioman", "rhs_msv_emr_rifleman"],
	["military_medic", "rhs_msv_emr_medic"],
	["military_engineer", "rhs_msv_emr_engineer"],
	["military_explosivesexpert", "rhs_msv_emr_rifleman"],
	["military_grenadier", "rhs_msv_emr_grenadier"],
	["military_lat", "rhs_msv_emr_LAT"],
	["military_at", "rhs_msv_emr_at"],
	["military_aa", "rhs_msv_emr_aa"],
	["military_machinegunner", "rhs_msv_emr_machinegunner"],
	["military_marksman", "rhs_msv_emr_marksman"],
	["military_sniper", "rhs_msv_emr_marksman"],

	["elite_squadleader", "rhs_msv_emr_sergeant"],
	["elite_rifleman", "rhs_msv_emr_rifleman"],
	["elite_radioman", "rhs_msv_emr_rifleman"],
	["elite_medic", "rhs_msv_emr_medic"],
	["elite_engineer", "rhs_msv_emr_engineer"],
	["elite_explosivesexpert", "rhs_msv_emr_rifleman"],
	["elite_grenadier", "rhs_msv_emr_grenadier"],
	["elite_lat", "rhs_msv_emr_LAT"],
	["elite_at", "rhs_msv_emr_at"],
	["elite_aa", "rhs_msv_emr_aa"],
	["elite_machinegunner", "rhs_msv_emr_machinegunner"],
	["elite_marksman", "rhs_msv_emr_marksman"],
	["elite_sniper", "rhs_msv_emr_marksman"],

	["sf_squadleader", "rhs_msv_emr_sergeant"],
	["sf_rifleman", "rhs_msv_emr_rifleman"],
	["sf_radioman", "rhs_msv_emr_rifleman"],
	["sf_medic", "rhs_msv_emr_medic"],
	["sf_engineer", "rhs_msv_emr_engineer"],
	["sf_explosivesexpert", "rhs_msv_emr_rifleman"],
	["sf_grenadier", "rhs_msv_emr_grenadier"],
	["sf_lat", "rhs_msv_emr_LAT"],
	["sf_at", "rhs_msv_emr_at"],
	["sf_aa", "rhs_msv_emr_aa"],
	["sf_machinegunner", "rhs_msv_emr_machinegunner"],
	["sf_marksman", "rhs_msv_emr_marksman"],
	["sf_sniper", "rhs_msv_emr_marksman"],

	["other_crew", "rhs_msv_emr_crew"],
	["other_unarmed", "rhs_msv_emr_rifleman"],
	["other_official", "rhs_msv_emr_officer"],
	["other_traitor", "O_G_officer_F"],
	["other_pilot", "rhs_pilot_combat_heli"],
	["police_squadleader", "rhs_mvd_izlom_sergeant"],
	["police_standard", "rhs_mvd_izlom_rifleman"]
]] call _fnc_saveToTemplate;


//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["UK3CB_CHD_O_YAVA"]] call _fnc_saveToTemplate; 			
["vehiclesLightUnarmed", ["UK3CB_ARD_O_GAZ_Vodnik","UK3CB_CW_SOV_O_LATE_BRDM2_UM"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed",["UK3CB_ARD_O_GAZ_Vodnik_Cannon", "UK3CB_ARD_O_GAZ_Vodnik_KVPT", "UK3CB_ARD_O_GAZ_Vodnik_PKT", "UK3CB_CW_SOV_O_LATE_BRDM2", "UK3CB_CW_SOV_O_LATE_BRDM2_ATGM", "UK3CB_CW_SOV_O_LATE_BRDM2_HQ", "UK3CB_CW_SOV_O_LATE_Gaz66_ZU23", "UK3CB_CW_SOV_O_LATE_Ural_Zu23", "UK3CB_CW_SOV_O_LATE_UAZ_AGS30"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["UK3CB_CW_SOV_O_LATE_Gaz66_Covered", "UK3CB_CW_SOV_O_LATE_Gaz66_Open", "UK3CB_CW_SOV_O_LATE_Kraz255_Open", "UK3CB_CW_SOV_O_LATE_Ural", "UK3CB_CW_SOV_O_LATE_Ural_Open", "UK3CB_CW_SOV_O_LATE_Zil131_Open", "UK3CB_CW_SOV_O_LATE_Zil131_Covered"]] call _fnc_saveToTemplate; 			
["vehiclesCargoTrucks", ["UK3CB_CW_SOV_O_LATE_Gaz66_Open_Flatbed", "UK3CB_CW_SOV_O_LATE_Kraz255_Flatbed", "UK3CB_CW_SOV_O_LATE_Ural_Recovery"]] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["UK3CB_CW_SOV_O_LATE_Gaz66_Ammo", "UK3CB_CW_SOV_O_LATE_Ural_Ammo"]] call _fnc_saveToTemplate; 		
["vehiclesRepairTrucks", ["UK3CB_CW_SOV_O_LATE_Gaz66_Repair", "UK3CB_CW_SOV_O_LATE_Ural_Repair"]] call _fnc_saveToTemplate; 		
["vehiclesFuelTrucks", ["UK3CB_CW_SOV_O_LATE_Kraz255_Fuel"]] call _fnc_saveToTemplate;		
["vehiclesMedical", ["UK3CB_CW_SOV_O_LATE_Gaz66_Med"]] call _fnc_saveToTemplate;			
["vehiclesAPCs", ["UK3CB_CW_SOV_O_EARLY_MTLB_ZU23","UK3CB_CW_SOV_O_LATE_MTLB_PKT", "UK3CB_CW_SOV_O_LATE_BTR80a", "UK3CB_CW_SOV_O_LATE_BTR80", "UK3CB_CW_SOV_O_LATE_BTR70", "UK3CB_CW_SOV_O_LATE_BTR60", "UK3CB_CW_SOV_O_LATE_BMP2", "UK3CB_CW_SOV_O_LATE_BMP1", "UK3CB_CW_SOV_O_LATE_BMD1PK", "UK3CB_CW_SOV_O_LATE_BMD1P", "UK3CB_CW_SOV_O_LATE_BMD1"]] call _fnc_saveToTemplate; 				
["vehiclesTanks", ["UK3CB_CW_SOV_O_LATE_T55", "UK3CB_CW_SOV_O_LATE_T72A", "UK3CB_CW_SOV_O_LATE_T72B", "UK3CB_CW_SOV_O_LATE_T72BM", "UK3CB_CW_SOV_O_LATE_T80", "UK3CB_CW_SOV_O_LATE_T80A", "UK3CB_CW_SOV_O_LATE_T80B", "UK3CB_CW_SOV_O_LATE_T80BK", "UK3CB_CW_SOV_O_LATE_T80BVK", "UK3CB_CW_SOV_O_LATE_T80UK", "UK3CB_CW_SOV_O_LATE_T80U"]] call _fnc_saveToTemplate; 			
["vehiclesAA", ["UK3CB_CW_SOV_O_LATE_ZsuTank"]] call _fnc_saveToTemplate; 				
["vehiclesLightAPCs", ["UK3CB_CW_SOV_O_LATE_BMD1", "UK3CB_CW_SOV_O_LATE_BMD1PK", "UK3CB_CW_SOV_O_LATE_BMD2"]] call _fnc_saveToTemplate;			
["vehiclesIFVs", []] call _fnc_saveToTemplate;				

["vehiclesSam", ["",""]] call _fnc_saveToTemplate; 	//this line determines SAM systems, order: radar, SAM


["vehiclesTransportBoats", ["O_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 	
["vehiclesGunBoats", ["UK3CB_CCM_O_Fishing_Boat_Zu23_front"]] call _fnc_saveToTemplate; 			
["vehiclesAmphibious", ["UK3CB_CW_SOV_O_LATE_BTR70", "UK3CB_CW_SOV_O_LATE_BTR80", "UK3CB_CW_SOV_O_LATE_BTR80a"]] call _fnc_saveToTemplate; 		

["vehiclesPlanesCAS", ["UK3CB_CW_SOV_O_LATE_Su25SM","UK3CB_CW_SOV_O_LATE_Su25SM_CAS", "UK3CB_CW_SOV_O_LATE_Su25SM_Cluster", "UK3CB_CW_SOV_O_LATE_Su25SM_KH29"]] call _fnc_saveToTemplate; 		
["vehiclesPlanesAA", ["UK3CB_CW_SOV_O_LATE_MIG29SM", "UK3CB_CW_SOV_O_LATE_MIG29S"]] call _fnc_saveToTemplate; 			
["vehiclesPlanesTransport", ["UK3CB_ADA_O_C130J"]] call _fnc_saveToTemplate; 	

["vehiclesHelisLight", ["UK3CB_CW_SOV_O_LATE_Mi8"]] call _fnc_saveToTemplate; 		
["vehiclesHelisTransport", ["UK3CB_CW_SOV_O_LATE_Mi8", "UK3CB_CW_SOV_O_LATE_Mi8AMT", "UK3CB_CW_SOV_O_LATE_Mi_24V"]] call _fnc_saveToTemplate; 	
["vehiclesHelisAttack", ["UK3CB_CW_SOV_O_LATE_Mi_24V", "UK3CB_CW_SOV_O_LATE_Mi_24P"]] call _fnc_saveToTemplate; 		

["vehiclesArtillery", [
["UK3CB_CW_SOV_O_LATE_2S1", ["rhs_mag_3of56_35"]],
["UK3CB_CW_SOV_O_LATE_2S3", ["rhs_mag_HE_2a33", "rhs_mag_WP_2a33"]],
["UK3CB_CW_SOV_O_LATE_BM21",["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate; 		

["uavsAttack", ["not_supported"]] call _fnc_saveToTemplate;			
["uavsPortable", ["not_supported"]] call _fnc_saveToTemplate; 				


["vehiclesMilitiaLightArmed", ["UK3CB_CW_SOV_O_LATE_VDV_UAZ_MG","UK3CB_CW_SOV_O_LATE_UAZ_SPG9","UK3CB_CW_SOV_O_EARLY_BTR40_MG"]] call _fnc_saveToTemplate; 
["vehiclesMilitiaTrucks", ["UK3CB_CW_SOV_O_LATE_VDV_Gaz66_Open", "UK3CB_CW_SOV_O_LATE_VDV_Gaz66_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_CW_SOV_O_EARLY_BTR40","UK3CB_CW_SOV_O_LATE_VDV_UAZ_Open", "UK3CB_CW_SOV_O_LATE_VDV_UAZ_Closed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaApcs", ["UK3CB_CW_SOV_O_EARLY_BTR60"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTanks", ["UK3CB_CW_SOV_O_EARLY_BMD1K"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_CPD_O_Lada", "UK3CB_CPD_O_GAZ_Vodnik", "UK3CB_CPD_O_Gaz24", "UK3CB_CPD_O_UAZ_Closed", "UK3CB_CPD_O_S1203"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_CW_SOV_O_Late_DSHKM"]] call _fnc_saveToTemplate; 					
["staticAT", ["rhs_Kornet_9M133_2_msv"]] call _fnc_saveToTemplate; 					
["staticAA", ["UK3CB_CW_SOV_O_Late_Igla_AA_pod", "UK3CB_CW_SOV_O_Late_ZU23"]] call _fnc_saveToTemplate; 					
["staticMortars", ["UK3CB_CW_SOV_O_Late_2b14_82mm"]] call _fnc_saveToTemplate;
["staticHowitzers", ["rhs_D30_msv"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate; 			//this line determines available HE-shells for the static mortars - !needs to be comtible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate; 		//this line determines smoke-shells for the static mortar - !needs to be comtible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["baggedMGs", [["RHS_DShkM_Gun_Bag", "RHS_DShkM_TripodHigh_Bag"]]] call _fnc_saveToTemplate; 				
["baggedAT", [["RHS_Kornet_Gun_Bag", "RHS_Kornet_Tripod_Bag"]]] call _fnc_saveToTemplate; 					//this line determines bagged static ATs -- Example: ["baggedAT", [["B_static_AT_F", "B_HMG_01_support_F"]]] -- Array, can contain multiple assets
["baggedAA", []] call _fnc_saveToTemplate; 					//this line determines bagged static ATs -- Example: ["baggedAT", [["B_static_AT_F", "B_HMG_01_support_F"]]] -- Array, can contain multiple assets
["baggedMortars", [["RHS_Podnos_Gun_Bag", "RHS_Podnos_Bipod_Bag"]]] call _fnc_saveToTemplate; 			//this line determines bagged static mortars -- Example: ["baggedMortars", [["B_Mortar_01_F", "B_Mortar_01_support_F"]]] -- Array, can contain multiple assets


["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;


["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", [
	//Team Leader
	["rhs_afrf_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["rhs_afrf_medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["rhs_afrf_machineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["rhs_afrf_marksman"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["rhs_afrf_AT"] call A3A_fnc_getLoadout,
	//AT2
	["rhs_afrf_AT2"] call A3A_fnc_getLoadout
]] call _fnc_saveToTemplate;
["pvpVehicles", ["rhs_tigr_vdv","rhs_uaz_vdv","rhsgref_ins_g_uaz_dshkm_chdkz"]] call _fnc_saveToTemplate;



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
_loadoutData setVariable ["heavyATLaunchers", []];
_loadoutData setVariable ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData setVariable ["sidearms", []];

_loadoutData setVariable ["ATMines", ["rhs_mag_mine_ptm1", "rhs_mine_tm62m_mag"]]; 					
_loadoutData setVariable ["APMines", ["rhs_mine_ozm72_a_mag", "rhs_mine_ozm72_b_mag", "rhs_mine_ozm72_c_mag", "rhs_mag_mine_pfm1", "rhs_mine_pmn2_mag"]]; 					
_loadoutData setVariable ["lightExplosives", ["rhs_ec200_mag"]]; 			
_loadoutData setVariable ["heavyExplosives", ["rhs_ec400_mag"]]; 			

_loadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_rgn", "rhs_mag_rgo"]]; 		
_loadoutData setVariable ["antiTankGrenades", []]; 			
_loadoutData setVariable ["smokeGrenades", ["rhs_mag_rdg2_white", "rhs_mag_rdg2_black"]];
_loadoutData setVariable ["signalsmokeGrenades", ["rhs_mag_nspd"]];	

_loadoutData setVariable ["maps", ["ItemMap"]];				
_loadoutData setVariable ["watches", ["ItemWatch"]];		
_loadoutData setVariable ["compasses", ["ItemCompass"]];	
_loadoutData setVariable ["radios", ["ItemRadio"]];			
_loadoutData setVariable ["gpses", []];			
_loadoutData setVariable ["NVGs", ["NVGoggles_OPFOR"]];						
_loadoutData setVariable ["binoculars", ["Binocular"]];		
_loadoutData setVariable ["Rangefinder", ["Binocular"]];

_loadoutData setVariable ["uniforms", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["ATvests", []];	
_loadoutData setVariable ["SLvests", []];
_loadoutData setVariable ["MGvests", []];	
_loadoutData setVariable ["Medvests", []];
_loadoutData setVariable ["GLvests", []];
_loadoutData setVariable ["backpacks", []];
_loadoutData setVariable ["Medbackpacks", ["rhs_medic_bag"]];
_loadoutData setVariable ["Atbackpacks", ["rhs_rpg_empty"]];
_loadoutData setVariable ["AAbackpacks", ["rhs_rpg_empty"]];
_loadoutData setVariable ["longRangeRadios", ["rhs_r148"]];
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
_sfLoadoutData setVariable ["uniforms", ["rhs_uniform_gorka_1_b","UK3CB_CW_SOV_O_Late_U_Spetsnaz_Uniform_Gorka_01_KLMK", "UK3CB_CW_SOV_O_Late_U_VDV_Spetsnaz_Uniform_Gorka_02_KLMK"]];			
_sfLoadoutData setVariable ["vests", ["rhs_lifchik", "rhs_lifchik_light", "rhs_6b5_spetsodezhda"]];
_sfLoadoutData setVariable ["SLvests", ["rhs_lifchik_NCO", "rhs_6b5_officer_spetsodezhda"]];
_sfLoadoutData setVariable ["backpacks", ["B_Carryall_oli", "rhs_sidor"]];
_sfLoadoutData setVariable ["helmets", ["rhs_beanie_green", "rhs_altyn_novisor", "rhs_altyn_visordown", "rhs_gssh18"]];				
_sfLoadoutData setVariable ["lightATLaunchers", ["rhs_weap_rpg26", "rhs_weap_rshg2"]];
_sfLoadoutData setVariable ["lightATLaunchers", [
["rhs_weap_rpg26", "", "", "",[], [], ""],
["rhs_weap_rshg2", "", "", "",[], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""]
]];	
_sfLoadoutData setVariable ["Atbackpacks", ["rhs_rpg_empty"]];
_sfLoadoutData setVariable ["rifles", [
["rhs_weap_akms", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_U"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1pn34", ["rhs_30Rnd_762x39mm_U"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_U"], [], ""]
]];
_sfLoadoutData setVariable ["carbines", [
["rhs_weap_asval", "", "", "", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""],
["rhs_weap_asval", "", "", "rhs_acc_1p63", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""],
["rhs_weap_asval", "", "", "rhs_acc_ekp1", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData setVariable ["grenadelaunchers", [
["rhs_weap_akms_gp25", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_U"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1pn34", ["rhs_30Rnd_762x39mm_U"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_U"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_VG40OP_white"], ""]
]];
_sfLoadoutData setVariable ["smgs", [ //seems to be they're not used
["rhs_weap_asval", "", "", "", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""],
["rhs_weap_asval", "", "", "rhs_acc_1p63", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""],
["rhs_weap_asval", "", "", "rhs_acc_ekp1", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData setVariable ["machineGuns", [
["rhs_weap_rpk74m", "rhs_acc_tgpa", "", "rhs_acc_nita", ["rhs_45Rnd_545X39_7N22_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]];
_sfLoadoutData setVariable ["marksmanRifles", [
["rhs_weap_vss", "", "", "rhs_acc_pso1m21", ["rhs_10rnd_9x39mm_SP5", "rhs_10rnd_9x39mm_SP5", "rhs_10rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData setVariable ["sidearms", [
["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData setVariable ["uniforms", ["rhs_uniform_afghanka_ttsko", "rhs_uniform_afghanka_winter_ttsko"]];
_militaryLoadoutData setVariable ["vests", ["rhs_6b3", "rhs_6b3_AK"]];
_militaryLoadoutData setVariable ["ATvests", ["rhs_6b3_AK"]];
_militaryLoadoutData setVariable ["MGvests", ["rhs_6b3_RPK"]];	
_militaryLoadoutData setVariable ["SLvests", ["rhs_6b3_off"]];
_militaryLoadoutData setVariable ["GLvests", ["rhs_6b3_VOG", "rhs_6b3_VOG_2"]];
_militaryLoadoutData setVariable ["backpacks", ["rhs_rd54", "rhs_rd54_vest", "rhs_sidor"]];
_militaryLoadoutData setVariable ["helmets", [
"rhs_stsh81_butan", "rhs_ssh68_2", "rhs_fieldcap_m88_ttsko", "rhs_fieldcap_m88_ttsko_back"
]];
_militaryLoadoutData setVariable ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VS_mag", "rhs_rpg7_PG7VS_mag", "rhs_rpg7_PG7VL_mag"], [], ""]
]];
_militaryLoadoutData setVariable ["lightATLaunchers", [
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""]
]];
_militaryLoadoutData setVariable ["Atbackpacks", ["rhs_rpg_6b3"]];

_militaryLoadoutData setVariable ["rifles", [
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_plum_AK","rhs_30Rnd_545x39_7N10_plum_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "", ["rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"], ""]
]];
_militaryLoadoutData setVariable ["machineGuns", [
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "", "",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "", "rhs_acc_1pn34",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militaryLoadoutData setVariable ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", [], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn34", [], [], ""]
]];
_militaryLoadoutData setVariable ["sidearms", ["rhs_weap_makarov_pm"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData setVariable ["uniforms", ["UK3CB_CPD_B_U_CombatUniform_01_Urban"]];
_policeLoadoutData setVariable ["vests", ["UK3CB_ANP_B_V_TacVest_BLU"]];
_policeLoadoutData setVariable ["helmets", ["rhs_omon_cap", "rhs_beret_omon"]];
_policeLoadoutData setVariable ["rifles", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_policeLoadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_fakel", "rhs_mag_fakels", "rhs_mag_plamyam"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData setVariable ["uniforms", ["rhs_uniform_afghanka_boots", "rhs_uniform_afghanka_winter_boots"]];
_militiaLoadoutData setVariable ["vests", ["rhs_6b2_AK", "rhs_6b2_lifchik", "rhs_belt_AK", "rhs_lifchik_light", "rhs_suspender_AK"]];	
_militiaLoadoutData setVariable ["MGvests", ["rhs_6b2_RPK", "rhs_belt_RPK"]];		
_militiaLoadoutData setVariable ["SLvests", ["rhs_6b2_holster", "rhs_lifchik_NCO"]];
_militiaLoadoutData setVariable ["ATvests", ["rhs_6b2_lifchik"]];
_militiaLoadoutData setVariable ["backpacks", ["rhs_rd54"]];
_militiaLoadoutData setVariable ["helmets", ["rhs_ssh68_2", "rhs_ssh60", "rhs_fieldcap_m88", "rhs_fieldcap_m88_back", "rhs_ushanka", "rhs_pilotka"]];
_militiaLoadoutData setVariable ["Atbackpacks", ["rhs_rpg_6b2"]];
_militiaLoadoutData setVariable ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""]
]];
_militiaLoadoutData setVariable ["lightATLaunchers", ["rhs_weap_rpg26", "rhs_weap_rshg2", "rhs_weap_rpg18"]];

_militiaLoadoutData setVariable ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_militiaLoadoutData setVariable ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData setVariable ["SMGs", [
	["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
["rhs_weap_ak74n_2_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_VG40OP_white", "rhs_GRD40_White"], ""]
]];
_militiaLoadoutData setVariable ["machineGuns", [
["UK3CB_RPK", "", "", "",["UK3CB_AK47_45Rnd_Magazine", "UK3CB_AK47_45Rnd_Magazine", "UK3CB_AK47_30Rnd_Magazine_GT"], [], ""],
["UK3CB_RPK_74N", "", "", "",["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]];
_militiaLoadoutData setVariable ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "UK3CB_SVD_10rnd_762x54_GT"], [], ""]
]];
_militiaLoadoutData setVariable ["sniperRifles", ["rhs_weap_m38"]];
_militiaLoadoutData setVariable ["sidearms", ["rhs_weap_makarov_pm"]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData setVariable ["uniforms", ["rhs_uniform_afghanka_vsr_2"]];
_eliteLoadoutData setVariable ["vests", ["rhs_6b5", "rhs_6b5_rifleman"]];
_eliteLoadoutData setVariable ["SLvests", ["rhs_6b5_officer"]];
_eliteLoadoutData setVariable ["backpacks", ["rhs_rd54_flora1", "rhs_sidor"]];
_eliteLoadoutData setVariable ["helmets", ["rhs_6b7_1m"]];		
_eliteLoadoutData setVariable ["lightATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_eliteLoadoutData setVariable ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_eliteLoadoutData setVariable ["Atbackpacks", ["rhs_rpg_empty"]];

_eliteLoadoutData setVariable ["rifles", [
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1pn34", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_nita", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_eliteLoadoutData setVariable ["carbines", [
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1pn34", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_nita", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_eliteLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1pn34", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_nita", ["rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"], ""]
]];
_eliteLoadoutData setVariable ["machineGuns", [
["rhs_weap_rpk74m", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtk1983", "", "rhs_acc_1pn34", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtk1983", "", "rhs_acc_nita", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_eliteLoadoutData setVariable ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn34", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_eliteLoadoutData setVariable ["sidearms", ["rhs_weap_6p53"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData setVariable ["uniforms", ["UK3CB_CW_SOV_O_LATE_U_Crew_Uniform_01_TTSKO"]];			
_crewLoadoutData setVariable ["vests", ["rhs_6b2"]];				
_crewLoadoutData setVariable ["helmets", ["rhs_tsh4"]];			
_crewLoadoutData setVariable ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["UK3CB_CW_SOV_O_LATE_U_H_Pilot_Uniform_01_TTSKO"]];			
_pilotLoadoutData setVariable ["vests", ["rhs_6b2"]];
_pilotLoadoutData setVariable ["helmets", ["rhs_zsh7a_mike_alt", "rhs_zsh7a_mike", "rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];
_pilotLoadoutData setVariable ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
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
	//["antiTankGrenades", 1] call _fnc_addItem;
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
	//["antiTankGrenades", 1] call _fnc_addItem;
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
	[["Medvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	//["antiTankGrenades", 3] call _fnc_addItem;
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
	[["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["Atbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["rifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	[selectRandom ["heavyATLaunchers", "lightATLaunchers"]] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_lat_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	//["antiTankGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["Atbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["rifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["heavyATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_at_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	//["antiTankGrenades", 2] call _fnc_addItem;
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
	[["AAbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["rifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 2] call _fnc_addMagazines;

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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	[["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
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


	["rifles"] call _fnc_setPrimary;
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

	["carbines"] call _fnc_setPrimary;
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
