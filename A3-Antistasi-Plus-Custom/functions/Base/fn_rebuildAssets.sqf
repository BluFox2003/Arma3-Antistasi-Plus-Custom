
params ["_site", "_position"];

private _leave = false;
private _antennaDead = objNull;

if (_site in outposts) then {
	_antennasDead = antennasDead select {_x inArea _site};
	if (count _antennasDead > 0) then {
		_antennaDead = _antennasDead select 0;
	};
};

switch (true) do {
	case (_site in citiesX): {
		[0, 10, _position] remoteExec ["A3A_fnc_citySupportChange",2];
    	[Occupants, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
    	[Invaders, 10, 30] remoteExec ["A3A_fnc_addAggression",2];

		destroyedSites = destroyedSites - [_site];
		publicVariable "destroyedSites";

		private _name = [_site] call A3A_fnc_localizar;
		[
			"SUCCESS",
			"Rebuild Assets",
			parseText format ["%1 has been rebuilt.", _name],
			30
		] spawn SCRT_fnc_ui_showMessage;
	};

	case (!isNull _antennaDead): {
		private _militaryBuildings = nearestObjects [_position, listMilBld, 500,  true];

		{
			[_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2];
		} forEach _militaryBuildings;

		[_antennaDead] remoteExec ["A3A_fnc_rebuildRadioTower", 2];

		private _name = [_site] call A3A_fnc_localizar;
		[
			"SUCCESS",
			"Rebuild Assets",
			parseText format ["%1 and it's radiotower has been rebuilt.", _name],
			30
		] spawn SCRT_fnc_ui_showMessage;
	};

	default {
		private _militaryBuildings = nearestObjects [_position, listMilBld, 500,  true];

		{
			[_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2];
		} forEach _militaryBuildings;

		private _name = [_site] call A3A_fnc_localizar;
		[
			"SUCCESS",
			"Rebuild Assets",
			parseText format ["%1 has been rebuilt.", _name],
			30
		] spawn SCRT_fnc_ui_showMessage;
	};
};

[0,-5000] remoteExec ["A3A_fnc_resourcesFIA",2];
