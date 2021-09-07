private ["_roads","_pos","_positionX","_groupX"];

private _distanceX = 250;

private _markersX = markersX + [respawnTeamPlayer];

if (!isNil "traderMarker") then {
	_markersX = _markersX + [traderMarker];
};

if (!isNil "isRallyPointPlaced" && {isRallyPointPlaced}) then {
	_markersX = _markersX + [rallyPointMarker];
};

_esHC = false;
if !((vehicle player getVariable "SA_Tow_Ropes") isEqualTo objNull) exitWith {
	["Fast Travel", "You cannot Fast Travel with your Tow Rope out or a Vehicle attached"] call SCRT_fnc_misc_showDeniedActionHint;
};
if (count hcSelected player > 1) exitWith {
	["Fast Travel", "You can select one group only to Fast Travel"] call SCRT_fnc_misc_showDeniedActionHint;
};

if (count hcSelected player == 1) then {_groupX = hcSelected player select 0; _esHC = true} else {_groupX = group player};
_checkForPlayer = false;
if ((!_esHC) and limitedFT) then {_checkForPlayer = true};
_boss = leader _groupX;

if ((_boss != player) and (!_esHC)) then {_groupX = player};

if (({isPlayer _x} count units _groupX > 1) and (_esHC)) exitWith {
	["Fast Travel", "You cannot Fast Travel groups commanded by players"] call SCRT_fnc_misc_showDeniedActionHint;
};

if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {["Fast Travel", "You cannot fast travel while being FF Punished."] call A3A_fnc_customHint;};

if (player != player getVariable ["owner",player]) exitWith {
	["Fast Travel", "You cannot Fast Travel while you are controlling AI"] call SCRT_fnc_misc_showDeniedActionHint;
};

if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {
	["Fast Travel", "Nope. Not happening."] call SCRT_fnc_misc_showDeniedActionHint;
};

positionTel = [];

if (_esHC) then {hcShowBar false};
["Fast Travel", "Click on the zone you want to travel"] call A3A_fnc_customHint;
if (!visibleMap) then {openMap true};
onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

private _positionTel = positionTel;
private _earlyEscape = false;

if (count _positionTel > 0) then {
	private _base = [_markersX, _positionTel] call BIS_Fnc_nearestPosition;
	if (!isNil "rallyPointMarker" && {_base == rallyPointMarker}) then {
		[] spawn SCRT_fnc_rally_travelToRallyPoint;
		openMap false;
		_earlyEscape = true;
	};
};

if (_earlyEscape) exitWith {};

private _isEnemiesNearby = false;

if(fastTravelIndividualEnemyCheck) then {
	_isEnemiesNearby = [player,_distanceX] call A3A_fnc_enemyNearCheck;

} else {
	{
		if ([_x,_distanceX] call A3A_fnc_enemyNearCheck) exitWith {_isEnemiesNearby = true}
	} forEach units _groupX;
};

if (_isEnemiesNearby) exitWith {
	["Fast Travel", "You cannot Fast Travel with enemies near the group"] call SCRT_fnc_misc_showDeniedActionHint;
};

private _checkX = false;

if(fastTravelIndividualEnemyCheck) then {
	if ((vehicle player != player) and ((isNull (driver vehicle player)) or (!canMove vehicle player) or (vehicle player isKindOf "Boat"))) then {
		if (!(vehicle player isKindOf "StaticWeapon")) then {
			_checkX = true;
		};
	};
} else {
	{
		if ((vehicle _x!= _x) and ((isNull (driver vehicle _x)) or (!canMove vehicle _x) or (vehicle _x isKindOf "Boat"))) then {
			if (!(vehicle _x isKindOf "StaticWeapon")) then {
				_checkX = true;
			};
		};
	} forEach units _groupX;
};

if (vehicle player != player && {driver vehicle player != player}) exitWith {
	["Fast Travel", "Only drivers can activate fast travel in vehicles."] call SCRT_fnc_misc_showDeniedActionHint;
};

if (_checkX) exitWith {
	["Fast Travel", "You cannot Fast Travel if you don't have a driver in all your vehicles or your vehicles are damaged and cannot move or you (your group) is in a boat"] call SCRT_fnc_misc_showDeniedActionHint;
};

if (count _positionTel > 0) then {
	_base = [_markersX, _positionTel] call BIS_Fnc_nearestPosition;
	private _rebelMarkers = if (!isNil "traderMarker") then {["Synd_HQ", traderMarker]} else {["Synd_HQ"]}; 
	
	if (_checkForPlayer && {!(_base in (_rebelMarkers + airportsX + milbases))}) exitWith {
		["Fast Travel", "Player groups are only allowed to Fast Travel to HQ, Airbases, Military Bases and Arms Dealer Store"] call SCRT_fnc_misc_showDeniedActionHint;
	};

	if ((sidesX getVariable [_base,sideUnknown] == Occupants) or (sidesX getVariable [_base,sideUnknown] == Invaders)) exitWith {
		["Fast Travel", "You cannot Fast Travel to an enemy controlled zone"] call A3A_fnc_customHint; openMap [false,false];
	};

	if ([getMarkerPos _base,_distanceX] call A3A_fnc_enemyNearCheck) exitWith {
		["Fast Travel", "You cannot Fast Travel to an area under attack or with enemies in the surrounding"] call SCRT_fnc_misc_showDeniedActionHint; openMap [false,false]
	};

	if (_positionTel distance getMarkerPos _base < 50) then {
		_positionX = [getMarkerPos _base, 10, random 360] call BIS_Fnc_relPos;
		_distanceX = round (((position _boss) distance _positionX)/200);
		//if (!_esHC) then {disableUserInput true; cutText ["Fast traveling, please wait","BLACK",2]; sleep 2;} else {hcShowBar false;hcShowBar true;hint format ["Moving group %1 to destination",groupID _groupX]; sleep _distanceX;};
		_forcedX = false;
		if (!isMultiplayer) then {if (not(_base in forcedSpawn)) then {_forcedX = true; forcedSpawn = forcedSpawn + [_base]}};
		if (!_esHC) then {disableUserInput true; cutText [format ["Fast traveling, travel time: %1s , please wait", _distanceX],"BLACK",1]; sleep 1;} else {hcShowBar false;hcShowBar true;["Fast Travel", format ["Moving group %1 to destination",groupID _groupX]] call A3A_fnc_customHint; sleep _distanceX;};
 		if (!_esHC) then
 			{
 			_timePassed = 0;
 			while {_timePassed < _distanceX} do
 				{
 				cutText [format ["Fast traveling, travel time: %1s , please wait", (_distanceX - _timePassed)],"BLACK",0.0001];
 				sleep 1;
 				_timePassed = _timePassed + 1;
 				}
 			};
		_exit = false;
		if (limitedFT) then
			{
			_vehicles = [];
			{if (vehicle _x != _x) then {_vehicles pushBackUnique (vehicle _x)}} forEach units _groupX;
			{if ((vehicle _x) in _vehicles) exitWith {_checkForPlayer = true}} forEach (call A3A_fnc_playableUnits);
			};
		if (_checkForPlayer && {!(_base in (_rebelMarkers + airportsX + milbases))}) exitWith {
			["Fast Travel", format ["%1 Fast Travel has been cancelled because some player has boarded their vehicle and the destination is not HQ, Airbase, Military Base or Arms Dealer store",groupID _groupX]] call SCRT_fnc_misc_showDeniedActionHint;
		};
		
		{
		_unit = _x;
		if ((!isPlayer _unit) or (_unit == player)) then
			{
			//_unit hideObject true;
			_unit allowDamage false;
			if (_unit != vehicle _unit) then
				{
				if (driver vehicle _unit == _unit) then
					{
					sleep 3;
					_radiusX = 10;
					while {true} do
						{
						_roads = _positionX nearRoads _radiusX;
						if (count _roads > 0) exitWith {};
						_radiusX = _radiusX + 10;
						};
					_road = _roads select 0;
					_pos = position _road findEmptyPosition [10,100,typeOf (vehicle _unit)];
					vehicle _unit setPos _pos;
					};
				if ((vehicle _unit isKindOf "StaticWeapon") and (!isPlayer (leader _unit))) then
					{
					_pos = _positionX findEmptyPosition [10,100,typeOf (vehicle _unit)];
					vehicle _unit setPosATL _pos;
					};
				}
			else
				{
				if (!(_unit getVariable ["incapacitated",false])) then
					{
					_positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
					_unit setPosATL _positionX;
					if (isPlayer leader _unit) then {_unit setVariable ["rearming",false]};
					_unit doWatch objNull;
					_unit doFollow leader _unit;
					}
				else
					{
					_positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
					_unit setPosATL _positionX;
					};
				};
			};
		} forEach units _groupX;
		if (!_esHC) then {disableUserInput false;cutText ["You arrived to destination","BLACK IN",1]} else {["Fast Travel", format ["Group %1 arrived to destination",groupID _groupX]] call A3A_fnc_customHint;};
		if (_forcedX) then {forcedSpawn = forcedSpawn - [_base]};
		sleep 5;
		{_x allowDamage true} forEach units _groupX;
		}
	else
		{
		["Fast Travel", "You must click near marker under your control"] call SCRT_fnc_misc_showDeniedActionHint;
		};
	};
openMap false;