private _fileName = "loot_createLootCrate";

if (!isNil "isRallyPointPlaced" && {isRallyPointPlaced}) then {
    private _hqMarkerPos = getMarkerPos "Synd_HQ";
    private _rallyPointMarkerPos = getMarkerPos "RallyPointMarker";

    if (player distance2D _hqMarkerPos > 50 && {player distance2D _rallyPointMarkerPos > 50}) exitWith {
        ["Rally Point", "Rally point can be abolished only on HQ or near the Rally Point itself."] call SCRT_fnc_misc_showDeniedActionHint;
    };

    private _cost = [rallyPoint] call A3A_fnc_vehiclePrice;
    private _remainingTravels = rallyPointRoot getVariable ["remainingTravels", 0];
    if (_remainingTravels > 0) then {
        private _finalCost = _cost * _remainingTravels;
        if (_finalCost < 100) then {
            _finalCost = 100;
        };
        
        [0, round (_finalCost/1.3)] remoteExec ["A3A_fnc_resourcesFIA",2];
    };

    isRallyPointPlaced = false;
    publicVariable "isRallyPointPlaced";

    {
        deleteVehicle _x;
    } forEach rallyProps;

    rallyProps = nil;
    publicVariable "rallyProps";

    deleteVehicle rallyPointRoot;
    rallyPointRoot = nil;
    publicVariable "rallyPointRoot";

    deleteMarker rallyPointMarker;
    deleteMarker "RallyPointMarker";
    publicVariable "rallyPointMarker";

    private _announceText = format ["<t size='0.6'><t size='0.6' color='#008000'>Rally point </t> has been abolished.</t>"];
    [petros, "support", _announceText] remoteExec ["A3A_fnc_commsMP", 0];
} else {
    private _cost = [rallyPoint] call A3A_fnc_vehiclePrice;
    private _finalCost = _cost * rallyPointSpawnCount;
    private _resourcesFIA = server getVariable "resourcesFIA";    

    if (_resourcesFIA < _finalCost) exitWith {
        ["Rally Point", format ["Not enough money to place rally point, need %1 to proceed.", str _finalCost]] call SCRT_fnc_misc_showDeniedActionHint;
    };

    if ([player, 50] call A3A_fnc_enemyNearCheck) exitWith {
        ["Rally Point", "You cannot establish rally point when enemies are surrounding you."] call SCRT_fnc_misc_showDeniedActionHint;
    };

    if (player != theBoss) exitWith {
        ["Rally Point", "Only commander can establish rally points."] call SCRT_fnc_misc_showDeniedActionHint;
    };

    vehiclePurchase_cost = _finalCost;

    private _extraMessage = format  ["Select rally point position.<br/>Price: %1€<br/>", vehiclePurchase_cost];
    [rallyPoint, "CREATERALLYPOINT", _extraMessage, "Rally Point"] call A3A_fnc_vehPlacementBegin;
};