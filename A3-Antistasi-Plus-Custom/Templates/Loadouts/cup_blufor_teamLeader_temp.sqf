[//Loadout
	[//Primary Weapon
		"CUP_arifle_AK107_GL",								//Weapon
		"",													//Muzzle
		"CUP_acc_ANPEQ_15_Black",													//Rail
		"CUP_optic_1p63",							//Sight
		["CUP_30Rnd_545x39_AK74M_M",30],						//Primary Magazine
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
			["CUP_30Rnd_545x39_AK74M_M",5,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
		"CUP_B_USMC_AssaultPack",							//Backpack
		[//Inventory
            ["CUP_1Rnd_HE_GP25_M",7,1],
            ["CUP_IlumFlareWhite_GP25_M",3,1],
            ["CUP_1Rnd_SMOKE_GP25_M",3,1]
		]
	],

		"CUP_H_CDF_H_PASGT_MNT",
		"",													//Facewear

	[//Binocular
		"Rangefinder",										//Binocular
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
