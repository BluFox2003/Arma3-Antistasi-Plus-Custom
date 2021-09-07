[//Loadout
	[//Primary Weapon
		"LMG_Mk200_khk_F",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"optic_Holosight",							//Sight
		["200Rnd_65x39_cased_Box",200],			//Primary Magazine
		[],													//Secondary Magazine
		"Bipod_01_F_BLK"									//Bipod
	],

	[//Launcher
		"",													//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		[],													//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Secondary Weapon
		"hgun_P07_F",									//Weapon
		"Muzzle_SNDS_L",									//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		selectRandom										//Uniform
		["U_B_E_CombatUniform_wdl", "U_B_E_CombatUniform_vest_wdl", "U_B_E_CombatUniform_tshirt_wdl"],
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		selectRandom										//Vest
		["V_PlateCarrierIA1_oli", "V_PlateCarrierIA2_oli"],
		[//Inventory
			["NVGoggles_INDEP",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",2,17],
			["200Rnd_65x39_cased_Box",2,200],
			[]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[],

		selectRandom										//Headgear
		["H_Booniehat_wdl", "H_MilCap_wdl", "H_HelmetB_plain_wdl", "H_HelmetB_light_wdl", "H_HelmetB_green", "H_Cap_usblack"],
		"",													//Facewear

	[//Binocular
		"Binocular",													//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[//Item
		"ItemMap",											//Map
    "ItemGPS",											//Terminal
		["TF_ANPRC152"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		"ItemWatch",										//Watch
		""													//Goggles
	]
];
