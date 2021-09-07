params ["_typeX", "_site"];

private ["_garrison","_costs","_hr","_size"];

private _watchpostFIA = if (_site in watchpostsFIA) then {true} else {false};
private _roadblockFIA = if (_site in roadblocksFIA) then {true} else {false};
private _aapostFIA = if (_site in aapostsFIA) then {true} else {false};
private _atpostFIA = if (_site in atpostsFIA) then {true} else {false};
private _mortarpostFIA = if (_site in mortarpostsFIA) then {true} else {false};
private _hmgpostFIA = if (_site in hmgpostsFIA) then {true} else {false};

_garrison = if (!_watchpostFIA) then {
	garrison getVariable [_site,[]]
} else {
	SDKSniper
};

if (_typeX == "rem") then {
	if ((count _garrison == 0) and {!(_watchpostFIA) || !(_roadblockFIA) || !(_aapostFIA) || !(_atpostFIA)}) exitWith {
		[
			"FAIL",
			"Disband",  
			parseText "This place has no garrisoned troops to remove.", 
			30
		] spawn SCRT_fnc_ui_showMessage;
	};
	_costs = 0;
	_hr = 0;

	switch (true) do {
		case (_watchpostFIA): {
			_costs = 50;
			_hr = 0;
			{
				_costs = _costs + (server getVariable [_x,0]);
				_hr = _hr + 1; 
			} forEach groupsSDKSniper;
			_costs = round (_costs * 0.75);
		};
		case (_roadblockFIA): {
			_costs = [vehSDKLightArmed] call A3A_fnc_vehiclePrice; //car with mg
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]);
				_hr = _hr + 1;
			} forEach groupsSDKSquad;
			_costs = round (_costs * 0.75);
		};
		case (_aapostFIA): {
			_costs = [staticAAteamPlayer] call A3A_fnc_vehiclePrice; //AA
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]); 
				_hr = _hr +1;
			} forEach [SDKSL,SDKMG,SDKGL,SDKMil,SDKMil];
			_costs = round (_costs * 0.75);
		};
		case (_atpostFIA): {
			_costs = [staticATteamPlayer] call A3A_fnc_vehiclePrice; //AT
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]); 
				_hr = _hr +1;
			} forEach groupsSDKAT;
			_costs = round (_costs * 0.75);
		};
		case (_mortarpostFIA): {
			_costs = [SDKMortar] call A3A_fnc_vehiclePrice; //Mortar
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]); 
				_hr = _hr +1;
			} forEach [SDKSL,SDKMG,SDKMil,SDKMil,SDKMedic];
			_costs = round (_costs * 0.75);
		};
		case (_hmgpostFIA): {
			_costs = [SDKMGStatic] call A3A_fnc_vehiclePrice; //HMG
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]); 
				_hr = _hr +1;
			} forEach [SDKSL,SDKMG,SDKMil,SDKMil,SDKATman,SDKMedic];
			_costs = round (_costs * 0.75);
		};
		default {
			{
				if (_x == staticCrewTeamPlayer) then {
					if (_outpostFIA) then {
						_costs = _costs + ([vehSDKLightArmed] call A3A_fnc_vehiclePrice)
					} else {
						_costs = _costs + ([SDKMortar] call A3A_fnc_vehiclePrice)
					};
				};
				_hr = _hr + 1;
				_costs = _costs + (server getVariable [_x,0]);
			} forEach _garrison;
		};
	};

	[_hr,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

	switch (true) do {
		case (_watchpostFIA): {
			garrison setVariable [_site,nil,true];
			watchpostsFIA = watchpostsFIA - [_site]; publicVariable "watchpostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_roadblockFIA): {
			garrison setVariable [_site,nil,true];
			roadblocksFIA = roadblocksFIA - [_site]; publicVariable "roadblocksFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_aapostFIA): {
			garrison setVariable [_site,nil,true];
			aapostsFIA = aapostsFIA - [_site]; publicVariable "aapostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_atpostFIA): {
			garrison setVariable [_site,nil,true];
			atpostsFIA = atpostsFIA - [_site]; publicVariable "atpostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_mortarpostFIA): {
			garrison setVariable [_site,nil,true];
			mortarpostsFIA = mortarpostsFIA - [_site]; publicVariable "mortarpostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_hmgpostFIA): {
			garrison setVariable [_site,nil,true];
			hmgpostsFIA = hmgpostsFIA - [_site]; publicVariable "hmgpostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		default {
			garrison setVariable [_site,[],true];
			{if (_x getVariable ["markerX",""] == _site) then {deleteVehicle _x}} forEach allUnits;
		};
	};

	[_site] call A3A_fnc_mrkUpdate;

	[
		"SUCCESS",
		"Disband",  
		parseText format ["Garrison removed.<br/>Recovered Money: %1 €<br/>Recovered HR: %2",_costs,_hr], 
		30
	] spawn SCRT_fnc_ui_showMessage;
} else {
	positionXGarr = _site;
	["Garrison", format ["Info%1",[_site] call A3A_fnc_garrisonInfo]] call A3A_fnc_customHint;
	createDialog "garrisonRecruit";
	sleep 1;
	disableSerialization;

	_display = findDisplay 100;

	if (str (_display) != "no display") then {
		_ChildControl = _display displayCtrl 104;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKMil];
		_ChildControl = _display displayCtrl 105;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKMG];
		_ChildControl = _display displayCtrl 126;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKMedic];
		_ChildControl = _display displayCtrl 107;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKSL];
		_ChildControl = _display displayCtrl 108;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKATman];
		_ChildControl = _display displayCtrl 109;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKGL];
		_ChildControl = _display displayCtrl 110;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKSniper];
	};
};