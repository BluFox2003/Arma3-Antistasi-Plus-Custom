//Mission: Logistic supplies
if (!isServer and hasInterface) exitWith{};
private ["_markerX","_difficultX","_leave","_contactX","_groupContact","_tsk","_posHQ","_citiesX","_city","_radiusX","_positionX","_posHouse","_nameDest","_timeLimit","_dateLimit","_dateLimitNum","_pos","_truckX","_countX", "_holdTime"];

_markerX = _this select 0;

private _side = if (gameMode == 4) then {Invaders} else {Occupants};

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getMarkerPos _markerX;

_timeLimit = if (_difficultX) then {30 * settingsTimeMultiplier} else {60 * settingsTimeMultiplier};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;
_holdTime = if(_difficultX) then {4} else {2};
_taskDescription = format ["%1 population is in need of supplies. We may improve our relationship with that city if we are the ones who provide them. I have placed a crate with supplies near our HQ. Deliver the crate to %1 city center, hold it there for %3 minutes and it's done. Do this before %2.",_nameDest,_displayTime, _holdTime];

private _taskId = "SUPP" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_taskDescription,"City Supplies",_markerX],_positionX,false,0,true,"Heal",true] call BIS_fnc_taskCreate;
[_taskId, "SUPP", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

//Creating the box
_pos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1,50,"C_Van_01_box_F"];
_truckX = "Land_FoodSacks_01_cargo_brown_F" createVehicle _pos;
_truckX enableRopeAttach true;
_truckX allowDamage false;
[_truckX] call A3A_fnc_logistics_addLoadAction;
_truckX addAction ["Delivery infos",
	{
		_text = format ["Deliver this box to %1, unload it to start distributing to people",(_this select 0) getVariable "destinationX"]; //This need a rework
		["Logistics Mission", _text] remoteExecCall ["A3A_fnc_customHint",_this select 2];	//This need a rework
	},
	nil,
	0,
	false,
	true,
	"",
	"(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"
];
[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
//{_x reveal _truckX} forEach (allPlayers - (entities "HeadlessClient_F"));
_truckX setVariable ["destinationX",_nameDest,true];

[_truckX,"Supply Box"] spawn A3A_fnc_inmuneConvoy;

_mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [50,50];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;

private _squad = if (_side == Invaders) then {CSATSquad} else {NATOSquad};
_typeGroup = if (random 10 < tierWar) then {
	_squad call SCRT_fnc_unit_selectInfantryTier
} else {
	[policeOfficer,policeGrunt,policeGrunt,policeGrunt,policeGrunt,policeGrunt,policeGrunt,policeGrunt]
};
_groupX = [_positionX,_side, _typeGroup] call A3A_fnc_spawnGroup;
_nul = [leader _groupX, _mrk, "SAFE","SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX;

waitUntil {
    sleep 1;
    private _players = (call BIS_fnc_listPlayers) select { side _x == teamPlayer || {side _x == civilian}};
    (_players findIf {_x distance _positionX < 40} != -1) || {dateToNumber date > _dateLimitNum || {isNull _truckX}}
};

[2, "Rebels in area, spawning additional group.", "LOG_Supplies", true] call A3A_fnc_log; 
private _group2Position = [_positionX, 650, 1000, 0, 0] call BIS_fnc_findSafePos;
_groupX2 = [_group2Position, _side, _typeGroup] call A3A_fnc_spawnGroup;

private _groupX2WP = _groupX2 addWaypoint [(position _truckX), 5];
_groupX2WP setWaypointType "MOVE";
_groupX2WP setWaypointCombatMode "YELLOW";
_groupX2WP setWaypointSpeed "FULL";

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or ((_truckX distance _positionX < 40) and (isNull attachedTo _truckX) and (isNull ropeAttachedTo _truckX)) or (isNull _truckX)};
_bonus = if (_difficultX) then {2} else {1};
if ((dateToNumber date > _dateLimitNum) or (isNull _truckX)) then {
	[_taskId, "SUPP", "FAILED"] call A3A_fnc_taskSetState;
	[5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
} else {
	_countX = 120*_bonus;
	{
		_friendX = _x;
		if (captive _friendX) then {
			[_friendX,false] remoteExec ["setCaptive",0,_friendX];
			_friendX setCaptive false;
		};
		{
			if ((side _x == _side) and (_x distance _positionX < distanceSPWN)) then {
				if (_x distance _positionX < 300) then {_x doMove _positionX} else {_x reveal [_friendX,4]};
			};
			if ((side _x == civilian) and (_x distance _positionX < 300) and (vehicle _x == _x)) then {
				_x doMove position _truckX
			};
		} forEach allUnits;
	} forEach ([300,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);

	while {(_countX > 0) and (dateToNumber date < _dateLimitNum) and !(isNull _truckX)} do {
		while {
			(_countX > 0) 
			and (_truckX distance _positionX < 40)
			and ({[_x] call A3A_fnc_canFight} count ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits) == count ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)) 
			and ({(side _x == _side) and (_x distance _truckX < 50)} count allUnits == 0) 
			and (dateToNumber date < _dateLimitNum) 
			and (isNull attachedTo _truckX)
		} do {
			_formatX = format ["Keep the area clear of hostiles for %1 more seconds", _countX];
			{
				if (isPlayer _x) then {[petros,"hint",_formatX,"Logistics Mission"] remoteExec ["A3A_fnc_commsMP",_x]}
			} forEach ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
			sleep 1;
			_countX = _countX - 1;
		};
		if (_countX > 0) then {
			_countX = 120*_bonus;//120
			if (((_truckX distance _positionX > 40) 
				or (not([80,1,_truckX,teamPlayer] call A3A_fnc_distanceUnits)) 
				or ({(side _x == _side) and (_x distance _truckX < 50)} count allUnits != 0)) and (alive _truckX)) 
			then {
				{
					[petros,"hint","Stay close to the crate, and clean all BLUFOR presence in the surroundings or count will restart", "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",_x]
				} forEach ([100,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)
			};
			waitUntil {
				sleep 1;
				((_truckX distance _positionX < 40) 
				and ([80,1,_truckX,teamPlayer] call A3A_fnc_distanceUnits) 
				and ({(side _x == _side) 
				and (_x distance _truckX < 50)} count allUnits == 0)) or (dateToNumber date > _dateLimitNum) or (isNull _truckX)
			};
		};
		if (_countX < 1) exitWith {};
	};

	if ((dateToNumber date < _dateLimitNum) and !(isNull _truckX)) then {
		[petros,"hint","Supplies Delivered", "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
		[_taskId, "SUPP", "SUCCEEDED"] call A3A_fnc_taskSetState;
		{ [35 * _bonus, _x] call A3A_fnc_playerScoreAdd } forEach (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};
		[10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		[-15*_bonus,15*_bonus,_markerX] remoteExec ["A3A_fnc_citySupportChange",2];
		[
			3,
			"Rebels won a supply mission",
			"aggroEvent",
			true
		] call A3A_fnc_log;
		[_side, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
	}
	else {
		[_taskId, "SUPP", "FAILED"] call A3A_fnc_taskSetState;
		[5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};
};

_ecpos = getpos _truckX;
deleteVehicle _truckX;
_emptybox = "Land_Pallet_F" createVehicle _ecpos;
[_emptybox] spawn A3A_fnc_postmortem;

[_groupX] spawn A3A_fnc_groupDespawner;
[_groupX2] spawn A3A_fnc_groupDespawner;

deleteMarkerLocal _mrk;

[_taskId, "SUPP", 900] spawn A3A_fnc_taskDelete;
