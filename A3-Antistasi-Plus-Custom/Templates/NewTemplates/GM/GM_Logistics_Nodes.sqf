//JNL mounting nodes for cargo and statics.
//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints append [
    ["gm_gc_army_ural375d_cargo" call A3A_fnc_classNameToModel, [
        [1,             [0,0.14,-0.8],         [1,2]],
        [1,             [0,-0.66,-0.8],        [3,4,5,11,9]],
        [1,             [0,-1.4,-0.8],         [6,7]],
        [1,             [0,-2.2,-0.8],         [10,12]],
        [1,             [0,-3,-0.8],           [8,13,14]]
    ]],
    ["gm_pl_army_ural4320_cargo" call A3A_fnc_classNameToModel, [
        [1,             [0,0.14,-0.8],         [1,2]],
        [1,             [0,-0.66,-0.8],        [3,4,5,11,9]],
        [1,             [0,-1.4,-0.8],         [6,7]],
        [1,             [0,-2.2,-0.8],         [10,12]],
        [1,             [0,-3,-0.8],           [8,13,14]]
    ]],
    ["gm_dk_army_u1300l_container" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.2,-1.25],         []],
        [1,             [0,-1,-1.25],        []],
        [1,             [0,-1.8,-1.25],         []]
    ]],
    ["gm_ge_civ_u1300l" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.15,-0.9],         []],
        [1,             [0,-0.95,-0.9],        []],
        [1,             [0,-1.75,-0.9],         []]
    ]],
    ["gm_ge_army_kat1_454_cargo" call A3A_fnc_classNameToModel, [
        [1,             [0,1.6,-0.4],         []],
        [1,             [0,0.8,-0.4],        []],
        [1,             [0,0,-0.4],         []],
        [1,             [0,-0.8,-0.4],        []],
        [1,             [0,-1.6,-0.4],         []],
        [1,             [0,-2.4,-0.4],        []],
        [1,             [0,-3.2,-0.4],         []],
        [1,             [0,-4,-0.4],        []]
    ]],
    ["gm_ge_army_kat1_451_container" call A3A_fnc_classNameToModel, [
        [1,             [0,0.14,-0.85],         [0]],
        [1,             [0,-0.66,-0.85],        [0]],
        [1,             [0,-1.4,-0.85],         [0]],
        [1,             [0,-2.2,-0.85],         [0]],
        [1,             [0,-3,-0.85],           [0]]
    ]],
    ["gm_pl_army_uaz469_cargo" call A3A_fnc_classNameToModel,[
        [1,         [-0.1, -1.65, -1.2],    [4,5]]
    ]],
    ["gm_ge_army_iltis_cargo" call A3A_fnc_classNameToModel,[
        [1,         [-0.15, -1.75, -1.1],    []]
    ]],
    ["gm_ge_bgs_k125" call A3A_fnc_classNameToModel,[
        [1,         [-0.195, -1.005, -0.6],    [0]]
    ]]
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset append [
    ["gm_ge_army_mg3_aatripod" call A3A_fnc_classNameToModel,                   [0, 0, 1.5],            [0, -1, 0],           4,      100],
    ["gm_gc_army_dshkm_aatripod" call A3A_fnc_classNameToModel,                 [0, 0, 1.75],           [0, -1, 0],           4,      100],
    ["gm_ge_army_milan_launcher_tripod" call A3A_fnc_classNameToModel,          [0, 0, 1.2],            [0, -1, 0],           4,      250],
    ["gm_gc_army_fagot_launcher_tripod" call A3A_fnc_classNameToModel,          [0, 0, 1.2],            [0, -1, 0],           4,      250],
    ["gm_gc_army_spg9_tripod" call A3A_fnc_classNameToModel,                    [0, 0, 1.1],            [0, -1, 0],           4,      250]
];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles append ["gm_ge_army_kat1_451_cargo", "gm_ge_army_u1300l_cargo", "gm_ge_army_kat1_451_container", "gm_ge_army_kat1_454_cargo", "gm_gc_army_ural375d_cargo", "gm_gc_bgs_ural4320_cargo", "gm_pl_army_ural4320_cargo"];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array don't add it to the blacklist in this array.
A3A_logistics_weapons append [
    ["gm_gc_army_dshkm_aatripod" call A3A_fnc_classNameToModel,[]],
    ["gm_ge_army_mg3_aatripod" call A3A_fnc_classNameToModel,[]],
    ["gm_gc_army_fagot_launcher_tripod" call A3A_fnc_classNameToModel,[]],
    ["gm_ge_army_milan_launcher_tripod" call A3A_fnc_classNameToModel,[]],
    ["gm_gc_army_spg9_tripod" call A3A_fnc_classNameToModel,[]]
];