if(!isNil "supportCooldown" && {supportCooldown}) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "Support regiment is overwhelmed with support requests, wait for a bit.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType in ["NAPALM", "HE", "CLUSTER", "CHEMICAL"] && bombRuns < 1) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "You have not enough Airstrikes to make this request.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType in ["LOOTHELI","SUPPLY", "SMOKE", "FLARE", "VEH_AIRDROP", "LOOTCRATE_AIRDROP", "STATIC_MG_AIRDROP", "RECON", "PARADROP"] && supportPoints < 1) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "You have not enough Support to make this request.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

private _airports = { sidesX getVariable [_x, sideUnknown] == teamPlayer } count airportsX;
if (supportType in ["LOOTHELI","NAPALM", "HE", "CLUSTER", "CHEMICAL", "VEH_AIRDROP", "LOOTCRATE_AIRDROP", "STATIC_MG_AIRDROP", "SUPPLY", "RECON", "PARADROP"] && _airports < 1) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "You need a at least 1 captured airport to make this request.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

private _resourcesFIA = server getVariable "resourcesFIA";
if (supportType == "STATIC_MG_AIRDROP" && {_resourcesFIA < 1000}) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "HQ needs to have at least 1000€ to make this support request.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType == "PARADROP" && {_resourcesFIA < 500}) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "HQ needs to have at least 500€ to make this support request.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType == "LOOTHELI" && {_resourcesFIA < 2000}) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "HQ needs to have at least 2000€ to make this support request.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType in ["VEH_AIRDROP", "LOOTCRATE_AIRDROP"] && {_resourcesFIA < 200}) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "HQ needs to have at 200€ to make this support request.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (!([player] call A3A_fnc_hasRadio)) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "You need a radio in your inventory to be able to give orders to other squads.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (isNil "supportMarkerOrigin") exitWith {
    [
		"FAIL",
		"Support",  
		parseText "You need to specify destination for support.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (!(supportType in ["SMOKE", "FLARE"]) && {isNil "supportMarkerDestination"}) exitWith {
    [
		"FAIL",
		"Support",  
		parseText "You need to specify second point for airplane to perform support action.", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

private _exit = false;
private _exitMessage = "";

if (supportType == "PARADROP") then {
    if ((getMarkerPos "Synd_HQ") distance2D theBoss > 50) exitWith {
        _exit = true;
        _exitMessage = "Commander should be at rebel HQ to be able to launch paradrop plane run.";
    };

    if ([(getMarkerPos "Synd_HQ"), 300] call A3A_fnc_enemyNearCheck) exitWith {
        _exit = true;
        _exitMessage = "You cannot paradrop when enemies are near rebel HQ.";
    };

    private _attendants = [missionNamespace, "paradropAttendants", []] call BIS_fnc_getServerVariable;
    if (_attendants isEqualTo []) exitWith {
        _exit = true;
        _exitMessage = "No players are ready for jump. Make sure that players pressed PARADROP switch button in Game Options menu (O key or map-on-tripod action).";
    };

    _attendants = _attendants apply {_x call BIS_fnc_getUnitByUID};

    private _readyPlayers = _attendants select {
        _x distance2D (getMarkerPos "Synd_HQ") < 50 
        && vehicle _x == _x && {[_x] call A3A_fnc_canFight} 
        && !(!(isNil "placingVehicle") && {placingVehicle})
    };
    if (isNil "_readyPlayers" || {count _readyPlayers == 0}) exitWith {
        _exit = true;
        _exitMessage = "Players who are ready to jump should be alive, on their feet, not doing anything with vehicles and be at the rebel HQ.";
    };
};

if (_exit) exitWith {
    [
        "FAIL",
        "Paradrop",  
        parseText _exitMessage, 
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

switch (supportType) do {
    case ("SUPPLY");
    case ("SMOKE");
    case ("FLARE");
    case ("RECON"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
    };
    case ("VEH_AIRDROP"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        [0,-200] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("LOOTCRATE_AIRDROP"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        [0,-200] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("STATIC_MG_AIRDROP"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        [0,-1000] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("PARADROP"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        [0,-500] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("LOOTHELI"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        [0,-2000] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("NAPALM");
    case ("HE");
    case ("CLUSTER");
    case ("CHEMICAL"): {
        bombRuns = bombRuns - 1;
        publicVariable "bombRuns";
    };
};

[] spawn A3A_fnc_statistics;
[] call SCRT_fnc_ui_updateSupportMenu;

switch (true) do {
    case (supportType == "SMOKE"): {
        [] spawn SCRT_fnc_support_smokeBarrage;
    };
    case (supportType == "FLARE"): {
        [] spawn SCRT_fnc_support_flareBarrage;
    };
    case (supportType == "RECON"): {
        [] spawn SCRT_fnc_support_planeReconRun;
    };
    case (supportType == "PARADROP"): {
        [] remoteExec  ["SCRT_fnc_paradrop_prepare", 2];
        [] spawn SCRT_fnc_support_planeParadropRun;
    };
    case (supportType == "LOOTHELI"): {
        [] spawn SCRT_fnc_support_lootHeli;
    };
    case (supportType == "VEH_AIRDROP");
    case (supportType == "LOOTCRATE_AIRDROP");
    case (supportType == "STATIC_MG_AIRDROP");
    case (supportType == "SUPPLY");
    case (supportType in ["HE", "CLUSTER", "CHEMICAL", "NAPALM"]): {
        [] spawn SCRT_fnc_support_planePayloadedRun;
    };
};

supportCooldown = true;
publicVariable "supportCooldown";
isSupportMarkerPlacingLocked = true;
publicVariable "isSupportMarkerPlacingLocked";

[
    "SUCCESS",
    "Support",  
    parseText "Support has been successfully ordered.", 
    30
] spawn SCRT_fnc_ui_showMessage;

private _timeOut = time + 180;
waitUntil { sleep 1; !isSupportMarkerPlacingLocked || {time > _timeOut} };

supportCooldown = false;
publicVariable "supportCooldown";

[] spawn SCRT_fnc_ui_clearSupport;