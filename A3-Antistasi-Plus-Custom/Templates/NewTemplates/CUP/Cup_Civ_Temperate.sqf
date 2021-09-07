//////////////////////////////
//   Civilian Information   //
//////////////////////////////

["uniforms", [
		"CUP_U_C_Worker_01", 
		"CUP_U_C_Worker_02",
		"CUP_U_C_Worker_03",
		"CUP_U_C_Worker_04",
		"CUP_U_C_Woodlander_01",
		"CUP_U_C_Woodlander_02",
		"CUP_U_C_Woodlander_03",
		"CUP_U_C_Woodlander_04",
		"CUP_U_C_Villager_01",
		"CUP_U_C_Villager_02",
		"CUP_U_C_Villager_03",
		"CUP_U_C_Villager_04",
		"CUP_U_C_Suit_01",
		"CUP_U_C_Suit_02",
		"CUP_U_C_Suit_03",
		"CUP_U_C_Functionary_jacket_01",
		"CUP_U_C_Functionary_jacket_02",
		"CUP_U_C_Functionary_jacket_03",
		"CUP_U_C_Rocker_01",
		"CUP_U_C_Rocker_02",
		"CUP_U_C_Rocker_03",
		"CUP_U_C_Rocker_04",
		"CUP_U_C_racketeer_01",
		"CUP_U_C_racketeer_02",
		"CUP_U_C_racketeer_03",
		"CUP_U_C_racketeer_04",
		"CUP_U_C_Profiteer_01",
		"CUP_U_C_Profiteer_02",
		"CUP_U_C_Profiteer_03",
		"CUP_U_C_Profiteer_04",
		"CUP_U_C_Pilot_01",
		"CUP_U_C_Mechanic_01",
		"CUP_U_C_Mechanic_02",
		"CUP_U_C_Mechanic_03",
		"CUP_U_C_Labcoat_01",
		"CUP_U_C_Labcoat_02",
		"CUP_U_C_Labcoat_03",
		"CUP_U_C_Fireman_01",
		"CUP_U_C_Priest_01",
		"CUP_U_C_Citizen_01",
		"CUP_U_C_Citizen_02",
		"CUP_U_C_Citizen_03",
		"CUP_U_C_Citizen_04"
	]
] call _fnc_saveToTemplate;

["headgear", [
		"CUP_H_C_Ushanka_01",
		"CUP_H_C_Ushanka_02",
		"CUP_H_C_Ushanka_03",
		"CUP_H_C_Ushanka_04",
		"CUP_H_C_Beanie_01",
		"CUP_H_C_Beanie_02",
		"CUP_H_C_Beanie_03",
		"CUP_H_C_Beanie_04",
		"CUP_H_C_Beret_01",
		"CUP_H_C_Beret_02",
		"CUP_H_C_Beret_03",
		"CUP_H_C_Beret_04"
	]
] call _fnc_saveToTemplate;



["vehiclesCivCar", [ 
		"CUP_C_TT650_CIV", 0.2
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
