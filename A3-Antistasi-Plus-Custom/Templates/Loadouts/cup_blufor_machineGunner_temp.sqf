[//Loadout
	[//Primary Weapon
		"CUP_lmg_Pecheneg",								//Weapon
		"",													//Muzzle
		"",									//Rail
		"CUP_optic_PechenegScope",						    			//Sight
		["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",100],						//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
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
		"CUP_hgun_PB6P9",									//Weapon
		"CUP_muzzle_PB6P9",									//Muzzle
		"",													//Rail
		"",													//Sight
		["CUP_8Rnd_9x18_Makarov_M", 8],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform

		"CUP_U_B_CDF_MNT_1",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"CUP_V_CDF_6B3_2_MNT",										//Vest
		[//Inventory
			["NVGoggles",1],
			["SmokeShell",2,1],
			["CUP_HandGrenade_RGD5",1,1],
			["CUP_8Rnd_9x18_Makarov_M",2,8],
			["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",2,100]
		]
		+ _aceFlashlight
		+ _aceM84
	],

    [//Backpack
		"CUP_B_USMC_AssaultPack",								//Backpack
		[]
	],

		"CUP_H_CDF_H_PASGT_MNT",
		"",													//Facewear

	[//Binocular
		"",										//Binocular
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
