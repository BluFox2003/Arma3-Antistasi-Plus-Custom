[//Loadout
	[//Primary Weapon
		"CUP_arifle_G36A3_grip_wdl",								//Weapon
		"",													//Muzzle
		"CUP_acc_ANPEQ_15_Flashlight_OD_L",									//Rail
		"CUP_optic_ZeissZPoint_wood",						    			//Sight
		["CUP_30Rnd_556x45_G36_wdl",30],						//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Launcher
		"CUP_launch_HCPF3",													//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["CUP_PTFHC_M",1],													//Primary Magazine
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

		"CUP_U_B_GER_Flecktarn_3",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"CUP_V_B_GER_PVest_Fleck_RFL_LT",										//Vest
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
		"",								//Backpack
		[]
	],

		"CUP_H_CCUP_H_Ger_M92_CoverDF_H_PASGT_MNT",
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

