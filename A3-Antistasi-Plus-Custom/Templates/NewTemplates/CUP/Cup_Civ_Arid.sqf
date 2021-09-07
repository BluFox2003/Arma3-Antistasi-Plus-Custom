//////////////////////////////
//   Civilian Information   //
//////////////////////////////

["uniforms", [
	"CUP_O_TKI_Khet_Partug_01",
	"CUP_O_TKI_Khet_Partug_02",
	"CUP_O_TKI_Khet_Partug_03",
	"CUP_O_TKI_Khet_Partug_04",
	"CUP_O_TKI_Khet_Partug_05",
	"CUP_O_TKI_Khet_Partug_06",
	"CUP_O_TKI_Khet_Partug_07",
	"CUP_O_TKI_Khet_Partug_08",
	"CUP_O_TKI_Khet_Jeans_01",
	"CUP_O_TKI_Khet_Jeans_02",
	"CUP_O_TKI_Khet_Jeans_03",
	"CUP_O_TKI_Khet_Jeans_04"
]] call _fnc_saveToTemplate;

["headgear", [
	"CUP_H_TKI_Lungee_Open_01",
	"CUP_H_TKI_Lungee_Open_02",
	"CUP_H_TKI_Lungee_Open_03",
	"CUP_H_TKI_Lungee_Open_04",
	"CUP_H_TKI_Lungee_Open_05",
	"CUP_H_TKI_Lungee_Open_06",
	"CUP_H_TKI_Pakol_1_01",
	"CUP_H_TKI_Pakol_1_02",
	"CUP_H_TKI_Pakol_1_03",
	"CUP_H_TKI_Pakol_1_04",
	"CUP_H_TKI_Pakol_1_05",
	"CUP_H_TKI_Pakol_1_06",
	"CUP_H_TKI_Pakol_1_07",
	"CUP_H_TKI_Pakol_1_08",
	"CUP_H_TKI_Pakol_1_09",
	"CUP_H_TKI_Pakol_1_10",
	"CUP_H_TKI_Pakol_1_11",
	"CUP_H_TKI_Pakol_1_12",
	"CUP_H_TKI_SkullCap_01",
	"CUP_H_TKI_SkullCap_02",
	"CUP_H_TKI_SkullCap_03",
	"CUP_H_TKI_SkullCap_04",
	"CUP_H_TKI_SkullCap_05",
	"CUP_H_TKI_SkullCap_06"
]] call _fnc_saveToTemplate;

["vehiclesCivCar", [
		"C_Quadbike_01_F", 0.3
		,"CUP_C_TT650_CIV", 0.2
		,"CUP_C_Skoda_CR_CIV", 1.0
		,"CUP_C_Volha_CR_CIV", 1.0
		,"CUP_C_Lada_CIV", 1.0
		,"CUP_C_Lada_TK_CIV", 1.0
		,"CUP_C_UAZ_Unarmed_TK_CIV", 0.8
		,"CUP_C_UAZ_Open_TK_CIV", 0.8
		,"CUP_C_LR_Transport_CTK", 0.5
		,"CUP_O_Hilux_unarmed_CR_CIV", 0.5
		,"CUP_C_Datsun_Covered", 0.5
		,"CUP_C_Datsun_Plain", 0.5
		,"CUP_C_Datsun_Tubeframe", 0.5
		,"CUP_C_S1203_CIV_CR", 0.4
		,"CUP_C_SUV_TK", 0.3
		,"CUP_C_SUV_CIV", 0.3
		,"CUP_C_Ikarus_Chernarus", 0.3
		,"CUP_C_Bus_City_CRCIV", 0.3
	]
] call _fnc_saveToTemplate; 			//this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", [
		"CUP_C_Ural_Civ_03", 0.3
		,"CUP_C_Ural_Open_Civ_03", 0.3
		,"CUP_C_V3S_Open_TKC", 0.3	
		,"CUP_C_Tractor_Old_CIV", 0.3
		,"CUP_C_Tractor_CIV", 0.3		
	]
] call _fnc_saveToTemplate; 			//this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", ["not_supported"]] call _fnc_saveToTemplate; 			//this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", [
	"CUP_C_Fishing_Boat_Chernarus", 1.0
	,"CUP_C_PBX_CIV", 1.0
	,"CUP_C_Zodiac_CIV", 1.0
	]
] call _fnc_saveToTemplate; 			//this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

["vehiclesCivRepair", ["C_Offroad_01_repair_F", 0.3
	,"C_Van_02_service_F", 0.3				// orange
	,"C_Truck_02_box_F", 0.1]] call _fnc_saveToTemplate;			//this line determines civilian repair vehicles

["vehiclesCivMedical", ["C_Van_02_medevac_F", 0.1]] call _fnc_saveToTemplate;			//this line determines civilian medic vehicles

["vehiclesCivFuel", [
        "C_Van_01_fuel_F", 0.2
        ,"C_Truck_02_fuel_F", 0.1
	]
] call _fnc_saveToTemplate;			//this line determines civilian fuel vehicles
