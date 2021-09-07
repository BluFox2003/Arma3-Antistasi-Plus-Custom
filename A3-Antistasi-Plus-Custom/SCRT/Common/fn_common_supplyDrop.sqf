params ["_plane", "_payload", "_supportType"];

private _filename = "fn_common_supplyDrop";
[3, format ["Executing on: %1", clientOwner], _filename, true] call A3A_fnc_log;
private _planeVehicle = vehicle _plane;

sleep random 5;

[3, format ["Dropping cargo at %1 (near %2)", getPos _planeVehicle, text nearestLocation [getPos _planeVehicle, "NameCity"]], _filename, true] call A3A_fnc_log;
if (alive _planeVehicle) then {

    private _supplyDrop = createVehicle [_payload, [getPos _planeVehicle select 0, getPos _planeVehicle select 1, (getPos _planeVehicle select 2)- 5], [], 0, "NONE"];
    waituntil {!isnull _supplyDrop};
    sleep 1.5;

    private _paraPos = nil;

    switch(_supportType) do {
        case ("STATIC_MG_AIRDROP"): {
            clearItemCargoGlobal _supplyDrop;
            clearMagazineCargoGlobal _supplyDrop;
            clearWeaponCargoGlobal _supplyDrop;
            clearBackpackCargoGlobal _supplyDrop;
            _supplyDrop addBackpackCargoGlobal [MGStaticSDKB, 1];
            _supplyDrop addBackpackCargoGlobal [supportStaticsSDKB2, 1];
            _paraPos = [0, 0, -0.2];
        };
        case ("VEH_AIRDROP"): {
            _paraPos = [0, 0, -0.1];
        };
        case ("LOOTCRATE_AIRDROP"): {
            clearItemCargoGlobal _supplyDrop;
            clearMagazineCargoGlobal _supplyDrop;
            clearWeaponCargoGlobal _supplyDrop;
            clearBackpackCargoGlobal _supplyDrop;
            [_supplyDrop] call SCRT_fnc_loot_addLootCrateActions;
            _paraPos = [0, 0, -0.2];
        };
        default {
            _supplyDrop remoteExecCall ["SCRT_fnc_common_fillSupplyDrop", 2];
            [_supplyDrop] call A3A_fnc_logistics_addLoadAction;
            _paraPos = [0, 0, -0.6];
        };
    };

    private _para = createVehicle ["B_parachute_02_F", [0,0,0], [], 0, "NONE"];
    _para setDir getDir _supplyDrop;
    _para setPos getPos _supplyDrop;
    _supplyDrop attachTo [_para, _paraPos];

    [_supplyDrop, _para] spawn {
        params ["_obj","_para"];

        private _smokeShellVariants = ["SmokeShellRed", "SmokeShellGreen", "SmokeShellYellow", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"];

        waitUntil {
            sleep 0.01;
            ((position _obj) select 2) < 2 
            || 
            isNull _para 
            || 
            (count (lineIntersectsWith [getPosASL _obj, (getPosASL _obj) vectorAdd [0, 0, -0.5], _obj, _para])) > 0
        };
            
        _para disableCollisionWith _obj;
        _obj setVectorUp [0,0,1];
        _obj setVelocity [0,0,0];
        detach _obj;
        
        // mark landing with smoke
        _smokeShell = (selectRandom _smokeShellVariants) createVehicle (position _obj);

        if(sunOrMoon < 1) then {
            private _chemlightVariants = ["Chemlight_green", "Chemlight_red", "Chemlight_yellow", "Chemlight_blue"];
            _chemLight = (selectRandom _chemlightVariants) createVehicle (position _obj);
        };
        
        if (!isNull _para) then {deleteVehicle _para};
    };
};
