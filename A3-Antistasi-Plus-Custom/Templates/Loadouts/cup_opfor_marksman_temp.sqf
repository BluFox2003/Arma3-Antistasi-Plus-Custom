[//Loadout
	[//Primary Weapon
		"CUP_srifle_SVD",								//Weapon
		"",													//Muzzle
		"",									//Rail
		"CUP_optic_PSO_1",						    			//Sight
		["CUP_10Rnd_762x54_SVD_M",10],						//Primary Magazine
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

		"CUP_U_O_RUS_Summer_VDV",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"CUP_Vest_RUS_6B45_Sh117_Summer",										//Vest
		[//Inventory
			["NVGoggles",1],
			["SmokeShell",2,1],
			["CUP_HandGrenade_RGD5",1,1],
			["CUP_8Rnd_9x18_Makarov_M",2,8],
			["CUP_10Rnd_762x54_SVD_M",10,10]
		]
		+ _aceFlashlight
		+ _aceM84
	],

    [//Backpack
	],

		selectRandom										//Headgear
		["CUP_H_RUS_6B27_cover_Summer", "CUP_H_RUS_6B27_cover_Summer_goggles", "CUP_H_RUS_6B27_cover_Summer_headset_goggles", "CUP_H_RUS_6B27_cover_Summer_headset"],
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
		["tf_fadak"] call _fnc_tfarRadio,				//Radio
        "ItemCompass",										//Compass
        "ItemWatch",										//Watch
        ""													//Goggles
	]
];
