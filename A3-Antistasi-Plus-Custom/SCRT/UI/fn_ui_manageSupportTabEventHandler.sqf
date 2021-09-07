params ["_mode"];


if(_mode == "ADD") then {
    [
        "supportMap",
        "onMapSingleClick",
        {
            if(!isNil "isSupportMarkerPlacingLocked" && {isSupportMarkerPlacingLocked}) exitWith {};

            playSound "readoutClick";

            if (isNil "supportMarkerOrigin") then {
                if (supportType == "PARADROP") then {
                    private _nearMarker = [forbiddenParadropZones, _pos] call BIS_fnc_nearestPosition;
                    if ((getMarkerPos _nearMarker) distance2D _pos < 500) then {
                        [
                            "FAIL",
                            "Paradrop",  
                            parseText "Too close to enemy marker, choose different location", 
                            30
                        ] spawn SCRT_fnc_ui_showMessage;
                    } else {
                        supportMarkerOrigin = createMarkerLocal ["BRStart", _pos];
                        supportMarkerOrigin setMarkerShapeLocal "ICON";
                        supportMarkerOrigin setMarkerTypeLocal "hd_destroy";
                    };
                } else {                   
                    supportMarkerOrigin = createMarkerLocal ["BRStart", _pos];
                    supportMarkerOrigin setMarkerShapeLocal "ICON";
                    supportMarkerOrigin setMarkerTypeLocal "hd_destroy";
                };

                switch (supportType) do {
                    case ("SUPPLY"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorBlue";
                        supportMarkerOrigin setMarkerTextLocal "Supply Run Init";
                    };
                    case ("SMOKE");
                    case ("FLARE"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorGrey";
                        supportMarkerOrigin setMarkerTextLocal "Barrage";
                    };
                    case ("STATIC_MG_AIRDROP"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorBrown";
                        supportMarkerOrigin setMarkerTextLocal "HMG Airdrop Init";
                    };
                    case ("VEH_AIRDROP"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorBrown";
                        supportMarkerOrigin setMarkerTextLocal "Light Vehicle Airdrop Init";
                    };
                    case ("LOOTCRATE_AIRDROP"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorYellow";
                        supportMarkerOrigin setMarkerTextLocal "Loot Crate Airdrop Init";
                    };
                    case ("RECON"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorOrange";
                        supportMarkerOrigin setMarkerTextLocal "Recon Plane Init";
                    };
                    case ("PARADROP"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorGrey";
                        supportMarkerOrigin setMarkerTextLocal "Paradrop Init";
                    };
                    case ("LOOTHELI"): {
                        supportMarkerOrigin setMarkerColorLocal "colorCivilian";
                        supportMarkerOrigin setMarkerTextLocal "Loot Helicopter Init";
                    };
                    default {
                        supportMarkerOrigin setMarkerColorLocal "ColorRed";
                        supportMarkerOrigin setMarkerTextLocal "Bomb Run Init";
                    };
                };
            } else {
                if !(supportType in ["SMOKE", "FLARE"]) then {
                    if (supportType == "PARADROP") then {
                        private _nearMarker = [forbiddenParadropZones, _pos] call BIS_fnc_nearestPosition;
                        if ((getMarkerPos _nearMarker) distance2D _pos < 500) then {
                            [
                                "FAIL",
                                "Paradrop",  
                                parseText "Too close to enemy marker, choose different location", 
                                30
                            ] spawn SCRT_fnc_ui_showMessage;
                        } else {
                            supportMarkerDestination = createMarkerLocal ["BRFin", _pos];
                            supportMarkerDestination setMarkerShapeLocal "ICON";
                            supportMarkerDestination setMarkerTypeLocal "hd_destroy";
                        };
                    } else {                   
                        supportMarkerDestination = createMarkerLocal ["BRFin", _pos];
                        supportMarkerDestination setMarkerShapeLocal "ICON";
                        supportMarkerDestination setMarkerTypeLocal "hd_destroy";
                    };

                    switch (supportType) do {
                        case ("SUPPLY"): {
                            supportMarkerDestination setMarkerColorLocal "ColorBlue";
                            supportMarkerDestination setMarkerTextLocal "Supply Run Exit";
                        };
                        case ("STATIC_MG_AIRDROP"): {
                            supportMarkerDestination setMarkerColorLocal "ColorBrown";
                            supportMarkerDestination setMarkerTextLocal "HMG Airdrop Exit";
                        };
                        case ("VEH_AIRDROP"): {
                            supportMarkerDestination setMarkerColorLocal "ColorBrown";
                            supportMarkerDestination setMarkerTextLocal "Light Vehicle Airdrop Exit";
                        };
                        case ("LOOTCRATE_AIRDROP"): {
                            supportMarkerDestination setMarkerColorLocal "ColorYellow";
                            supportMarkerDestination setMarkerTextLocal "Loot Crate Airdrop Exit";
                        };
                        case ("RECON"): {
                            supportMarkerDestination setMarkerColorLocal "ColorOrange";
                            supportMarkerDestination setMarkerTextLocal "Recon Plane Search Area";
                        };
                        case ("PARADROP"): {
                            supportMarkerDestination setMarkerColorLocal "ColorGrey";
                            supportMarkerDestination setMarkerTextLocal "Paradrop Exit";
                        };
                        case ("LOOTHELI"): {
                            supportMarkerDestination setMarkerColorLocal "colorCivilian";
                            supportMarkerDestination setMarkerTextLocal "Loot Helicopter Search Area";
                            private _areaMarker = createMarkerLocal ["LootHeliAreaMarker", _pos];
                            _areaMarker setMarkerShapeLocal "ELLIPSE";
                            _areaMarker setMarkerSizeLocal [250,250];
                            _areaMarker setMarkerTypeLocal "hd_warning";
                            _areaMarker setMarkerColorLocal "colorCivilian";
                            _areaMarker setMarkerBrushLocal "Grid";
                        };
                        default {
                            supportMarkerDestination setMarkerColorLocal "ColorRed";
                            supportMarkerDestination setMarkerTextLocal "Bomb Run Exit";
                        };
                    };
                } else {
                    deleteMarkerLocal supportMarkerDestination;
                };
            };
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["supportMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};