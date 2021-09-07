[//Loadout
	[//Primary Weapon
		"CUP_arifle_MG36_wdl",								//Weapon
		"",													//Muzzle
		"",									//Rail
		"CUP_optic_ZeissZPoint",						    			//Sight
		["CUP_100Rnd_556x45_BetaCMag_wdl",100],						//Primary Magazine
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
		"CUP_hgun_M17_Black",									//Weapon
		"muzzle_snds_L",									//Muzzle
		"CUP_acc_Glock17_Flashlight",													//Rail
		"optic_MRD_black",													//Sight
		["CUP_21Rnd_9x19_M17_Black", 21],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform

		"CUP_U_B_GER_Flecktarn_1",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"CUP_V_B_GER_PVest_Fleck_MG_LT",										//Vest
		[//Inventory
			["CUP_NVG_PVS7",1],
			["SmokeShell",2,1],
			["CUP_HandGrenade_M67",1,1],
			["CUP_21Rnd_9x19_M17_Black",1,21],
			["CUP_30Rnd_556x45_G36_wdl",4,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

    [//Backpack
		"CUP_B_GER_Pack_Flecktarn",								//Backpack
		[//Inventory
			["CUP_100Rnd_556x45_BetaCMag_wdl",2,100]
		]
	],

		"CUP_H_Ger_M92_Cover",
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
