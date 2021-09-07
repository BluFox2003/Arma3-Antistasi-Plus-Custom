//////////////////////////////
//   Civilian Information   //
//////////////////////////////

["uniforms", [
	"UK3CB_ADC_C_Shorts_U_05",
    "UK3CB_ADC_C_Shorts_U_01",
    "UK3CB_ADC_C_Shorts_U_06",
    "UK3CB_ADC_C_Shorts_U_03",
    "UK3CB_CHC_C_U_VILL_01",
    "UK3CB_CHC_C_U_VILL_03",
    "UK3CB_CHC_C_U_VILL_04",
    "UK3CB_CHC_C_U_POLITIC_01",
    "UK3CB_CHC_C_U_POLITIC_02",
    "UK3CB_CHC_C_U_POLITIC_03",
    "UK3CB_CHC_C_U_Overall_02",
    "UK3CB_ADC_C_Hunter_U_06",
    "UK3CB_ADC_C_Hunter_U_08",
    "UK3CB_ADC_C_Hunter_U_07",
    "UK3CB_CHC_C_U_DOC_01",
    "UK3CB_CHC_C_U_PROF_04",
    "UK3CB_CHC_C_U_PROF_01",
    "UK3CB_CHC_C_U_COACH_03",
    "UK3CB_CHC_C_U_COACH_05",
    "UK3CB_CHC_C_U_COACH_02",
    "UK3CB_CHC_C_U_COACH_04",
	"UK3CB_ADC_C_Hunter_U_02",
	"UK3CB_ADC_C_Hunter_U_05",
	"U_C_Poloshirt_blue",
	"U_C_Man_casual_1_F",
    "U_C_Man_casual_2_F",
    "U_C_Man_casual_3_F",
    "U_C_Man_casual_4_F",
    "U_C_Man_casual_5_F",
    "U_C_Man_casual_6_F",
    "U_C_ArtTShirt_01_v1_F",
    "U_C_ArtTShirt_01_v2_F",
    "U_C_ArtTShirt_01_v3_F",
    "U_C_ArtTShirt_01_v4_F",
    "U_C_ArtTShirt_01_v5_F",
    "U_C_ArtTShirt_01_v6_F",
    "U_NikosBody",
    "U_NikosAgedBody",
    "U_C_Journalist",
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_redwhite",
    "U_OrestesBody",
    "U_C_Poor_1",
    "U_C_WorkerCoveralls",
    "U_C_HunterBody_grn",
    "U_C_Uniform_Farmer_01_F",
    "U_I_L_Uniform_01_tshirt_skull_F",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_I_L_Uniform_01_tshirt_sport_F",
    "U_C_Scientist",
    "U_C_Uniform_Scientist_02_formal_F",
    "U_C_Uniform_Scientist_02_F",
    "U_C_Uniform_Scientist_01_F",
    "UK3CB_CHC_C_U_CAN_01"
]] call _fnc_saveToTemplate;

["headgear", [
	"UK3CB_H_Ushanka_Cap_01",
	"UK3CB_H_Villager_Cap_01",
	"UK3CB_H_Worker_Cap_01",
	"H_Bandanna_blu",
    "H_Bandanna_cbr",
    "H_Bandanna_gry",
    "H_Bandanna_khk",
    "H_Bandanna_sand",
    "H_Bandanna_sgg",
    "H_Bandanna_surfer",
    "H_Bandanna_surfer_blk",
    "H_Bandanna_surfer_grn",
    "H_Cap_blk",
    "H_Cap_blu",
    "H_Cap_grn",
    "H_Cap_grn_BI",
    "H_Cap_oli",
    "H_Cap_press",
    "H_Cap_red",
    "H_Cap_surfer",
    "H_Cap_tan",
    "H_StrawHat",
    "H_StrawHat_dark",
    "H_Hat_checker"
]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["UK3CB_CHC_C_Ikarus", 0.1					// bus, dangerously large
	,"UK3CB_TKC_C_Datsun_Civ_Closed", 0.5
	,"UK3CB_TKC_C_Datsun_Civ_Open", 1.0			// cargo capable
	,"UK3CB_TKC_C_Hatchback", 0.5
	,"UK3CB_TKC_C_Hilux_Civ_Closed", 0.5
	,"UK3CB_TKC_C_Hilux_Civ_Open", 0.5			// cargo capable
	,"UK3CB_TKC_C_Lada", 0.5
	,"UK3CB_TKC_C_Lada_Taxi", 0.5
	,"UK3CB_TKC_C_LR_Closed", 0.5		// land rovers
	,"UK3CB_TKC_C_LR_Open", 0.5
	,"UK3CB_TKC_C_Sedan", 0.5
	,"UK3CB_TKC_C_Skoda", 0.5
	,"UK3CB_TKC_C_S1203", 0.5
	,"UK3CB_TKC_C_SUV", 0.3
	,"UK3CB_CHC_C_Pickup", 0.5
	,"UK3CB_TKC_C_UAZ_Closed", 0.5
	,"UK3CB_TKC_C_UAZ_Open", 0.5
	,"UK3CB_TKC_C_Gaz24", 0.5
	,"UK3CB_CHC_C_Octavia", 0.5
	,"UK3CB_CHC_C_Landcruiser", 0.5
	,"C_Van_02_vehicle_F", 0.2				
	,"C_Van_02_transport_F", 0.2
	,"C_Hatchback_01_F", 0.2
	,"C_Hatchback_01_sport_F", 0.1
	,"C_Offroad_01_F", 0.1
	,"C_SUV_01_F", 0.2
	,"UK3CB_C_MMT", 0.1
	,"UK3CB_C_TT650", 0.1
	,"UK3CB_C_OLD_BIKE", 0.1
	,"UK3CB_C_YAVA", 0.3
	,"UK3CB_TKC_C_Golf", 0.5]] call _fnc_saveToTemplate; 			//this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", ["UK3CB_TKC_C_Tractor", 0.2
	,"UK3CB_TKC_C_Tractor_Old", 0.2
	,"UK3CB_TKC_C_Kamaz_Covered", 0.3
	,"UK3CB_TKC_C_Kamaz_Open", 0.3
	,"UK3CB_TKC_C_Ural", 0.3				// Urals
	,"UK3CB_TKC_C_Ural_Open", 0.3
	,"C_Van_01_transport_F", 0.4
	,"C_Van_01_box_F", 0.3
	,"C_Truck_02_transport_F", 0.5
	,"C_Truck_02_covered_F", 0.5
	,"RHS_Ural_Civ_01", 0.2
	,"RHS_Ural_Open_Civ_01", 0.2
	,"RHS_Ural_Civ_03", 0.2
	,"RHS_Ural_Open_Civ_03", 0.2
	,"RHS_Ural_Civ_02", 0.2
	,"RHS_Ural_Open_Civ_02", 0.2
	,"C_Tractor_01_F", 0.3
	,"UK3CB_TKC_C_V3S_Closed", 0.3
	,"UK3CB_TKC_C_V3S_Open", 0.3]] call _fnc_saveToTemplate; 			//this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", ["C_Heli_Light_01_civil_F", 0.4
,"RHS_Mi8amt_civilian", 0.4]] call _fnc_saveToTemplate; 			//this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", ["C_Boat_Civil_01_rescue_F", 0.1			// motorboats
	,"C_Boat_Civil_01_police_F", 0.1
	,"UK3CB_C_Fishing_Boat", 0.3
	,"UK3CB_C_Fishing_Boat_Smuggler_VIV_FFV", 0.1
	,"UK3CB_C_Fishing_Boat_Smuggler", 0.2
	,"UK3CB_C_Fishing_Boat_VIV_FFV", 0.1
	,"UK3CB_C_Small_Boat_Closed", 0.7
	,"UK3CB_C_Small_Boat_Open", 0.8
	,"UK3CB_C_Small_Boat_Wood", 0.9
	,"C_Rubberboat", 1.0					// rescue boat
	,"C_Boat_Transport_02_F", 1.0			// RHIB
	,"C_Scooter_Transport_01_F", 0.5]] call _fnc_saveToTemplate; 			//this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

["vehiclesCivRepair", ["UK3CB_TKC_C_Kamaz_Repair", 0.2
	,"UK3CB_TKC_C_Ural_Repair", 0.2
	,"UK3CB_TKC_C_V3S_Repair", 0.2
	,"C_Van_02_service_F", 0.2			// orange
	,"C_Truck_02_box_F", 0.1]] call _fnc_saveToTemplate;			//this line determines civilian repair vehicles

["vehiclesCivMedical", ["UK3CB_TKC_C_S1203_Amb", 0.1]] call _fnc_saveToTemplate;			//this line determines civilian medic vehicles

["vehiclesCivFuel", ["UK3CB_TKC_C_Kamaz_Fuel", 0.1
	,"UK3CB_TKC_C_Ural_Fuel", 0.1				// Ural
	,"UK3CB_TKC_C_V3S_Refuel", 0.1]] call _fnc_saveToTemplate;			//this line determines civilian fuel vehicles
