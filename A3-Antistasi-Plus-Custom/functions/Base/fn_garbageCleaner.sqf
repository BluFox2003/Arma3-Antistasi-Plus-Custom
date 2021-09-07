// Do not localise timeSpan, it is broadcast to all connected clients.
private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
["Garbage Cleaner","Please wait for GC to finish.<br/>Last GC was " + _timeSinceLastGC + " ago."] remoteExec ["A3A_fnc_customHint", 0];
[2, "Cleaning garbage...", _filename] call A3A_fnc_log;


private _rebelSpawners = allUnits select { side group _x == teamPlayer && {_x getVariable ["spawner",false]} };

private _fnc_distCheck = {
	params["_object", "_dist"];
	private _inRange = { if (_x distance _object <= _dist) exitWith {1}; false } count _rebelSpawners;
	if (_inRange == 0) then { deleteVehicle _object };
};


{ deleteVehicle _x } forEach allDead;
{ deleteVehicle _x } forEach (allMissionObjects "WeaponHolder");
{ deleteVehicle _x } forEach (allMissionObjects "WeaponHolderSimulated");
{ if (isNull attachedTo _x) then { [_x, distanceSPWN1] call _fnc_distCheck } } forEach (allMissionObjects NATOSurrenderCrate);// Surrender boxes NATO
{ if (isNull attachedTo _x) then { [_x, distanceSPWN1] call _fnc_distCheck } } forEach (allMissionObjects CSATSurrenderCrate);// Surrender boxes CSAT
{ deleteVehicle _x } forEach (allMissionObjects "Leaflet_05_F");				// Drone drop leaflets
{ deleteVehicle _x } forEach (allMissionObjects "Ejection_Seat_Base_F");		// All vanilla ejection seats
{ deleteVehicle _x } forEach (allMissionObjects "Land_CampingTable_F");
{ deleteVehicle _x } forEach (allMissionObjects "Land_CampingTable_small_F");
{ deleteVehicle _x } forEach (allMissionObjects "Box_Syndicate_WpsLaunch_F");
{ deleteVehicle _x } forEach (allMissionObjects "Bo_Mk82_MI08");

private _rebelPlayers = (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
private _lootCrates = (allMissionObjects lootCrate) select {
	private _crate = _x;
	private _isOnHq = (getMarkerPos "Synd_HQ") distance2D _crate < 50;
	private _isPlayersNear = _rebelPlayers findIf {_crate distance2D _x < 100} != -1;
	!_isOnHq && !_isPlayersNear && (isNull attachedTo _crate)
};

if (!isNil "_lootCrates" && {count _lootCrates > 0}) then {
	{
		deleteVehicle _x;
	} forEach _lootCrates;
};

{
	private _moneyItem = _x;
	{
		deleteVehicle _x;
	} forEach (allMissionObjects _moneyItem);
} forEach arrayMoneyLand;

{
	private _belongingItem = _x;
	{
		deleteVehicle _x;
	} forEach (allMissionObjects _belongingItem);
} forEach belongings;

if (A3A_hasACE) then {
	{ deleteVehicle _x } forEach (allMissionObjects "ACE_bodyBagObject");
	{ deleteVehicle _x } forEach (allMissionObjects "UserTexture1m_F");						// ACE spraycan tags
	{ deleteVehicle _x } forEach (allMissionObjects "ace_cookoff_Turret_MBT_01");			//MBT turret wrecks
	{ deleteVehicle _x } forEach (allMissionObjects "ace_cookoff_Turret_MBT_02");
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "ACE_envelope_big");		// ACE trench objects
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "ACE_envelope_small");
};

// Base type for trenches is Base_Bag_F, so we can't use that
if (isClass (configFile >> "CfgVehicles" >> "GRAD_envelope_short")) then {
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "GRAD_envelope_short");	// GRAD trench objects
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "GRAD_envelope_giant");
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "GRAD_envelope_vehicle");
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "GRAD_envelope_long");
};

if (A3A_hasRHS) then {
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_a10_acesII_seat");		// Ejection seat for A-10 and F-22
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_a10_canopy");			// other canopies delete on ground contact
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_k36d5_seat");			// AFRF ejection seat
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_vs1_seat");			// another dumb ejection seat
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_door_pilot");			// another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_door_gunner");		// another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_wing_left");			// another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_wing_right");			// another garbage piece not being cleaned

};

// Do not localise timeSpan, it is broadcast to all connected clients.
["Garbage Cleaner","Garbage Deleted.<br/>Last GC was " + _timeSinceLastGC + " ago."] remoteExec ["A3A_fnc_customHint", 0];
missionNamespace setVariable ["A3A_lastGarbageCleanTime",serverTime,true];
[2, "Garbage clean completed", _filename] call A3A_fnc_log;
