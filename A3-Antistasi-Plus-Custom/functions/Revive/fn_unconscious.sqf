private ["_unit","_groupX","_groups","_isLeader","_dummyGroup","_bleedOut","_suicide","_saveVolume","_helpX","_helped","_textX","_isPlayer","_camTarget","_saveVolumeVoice"];

#define KEY_R 19

_unit = _this select 0;

_bleedOut = time + 450;
_isPlayer = false;
_playersX = false;
_inPlayerGroup = false;
_unit setBleedingremaining 300;
_injurer = _this select 1;

if (isPlayer _unit) then {
	_isPlayer = true;

	_unit spawn {
		sleep 5;
		_this allowDamage true;
	};
	closeDialog 0;
	if (!isNil "respawnMenu") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu]};
	respawnMenu = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		_handled = false;
		if (_this select 1 == KEY_R) then {
			if (player getVariable ["incapacitated",false]) then {
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
				[player] spawn A3A_fnc_respawn;
			};
		};

		_handled;
	}];
	if (_injurer != Invaders) then {
		[_unit,true] remoteExec ["setCaptive",0,_unit];
		_unit setCaptive true
	};

	openMap false;

	{
		if ((!isPlayer _x) and (vehicle _x != _x) and (_x distance _unit < 50)) then {unassignVehicle _x; [_x] orderGetIn false}
	} forEach units group _unit;
}
else {
	if ({isPlayer _x} count units  group _unit > 0) then {_inPlayerGroup = true};
	_unit stop true;
	if (_inPlayerGroup) then {
		[_unit,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_unit];

		if (_injurer != Invaders) then {
			[_unit,true] remoteExec ["setCaptive",0,_unit];
			_unit setCaptive true
		};
	}
	else {
		if ({if ((isPlayer _x) and (_x distance _unit < distanceSPWN2)) exitWith {1}} count allUnits != 0) then {
				_playersX = true;
				[_unit,"heal"] remoteExec ["A3A_fnc_flagaction",0,_unit];
			if (_unit != petros) then {
				if (_injurer != Invaders) then {
					[_unit,true] remoteExec ["setCaptive",0,_unit];
					_unit setCaptive true
				}
			};
		};
	};
};

_unit setFatigue 1;
sleep 2;
if (_isPlayer) then {
	group _unit setCombatMode "YELLOW";
	[_unit,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_unit];

	if (isDiscordRichPresenceActive) then {
		private _possibleMarkers = outposts + airportsX + resourcesX + factories + seaports + milbases + ["NATO_carrier", "CSAT_carrier"];
		private _nearestMarker = [_possibleMarkers, player] call BIS_fnc_nearestPosition;
		private _locationName = [_nearestMarker] call A3A_fnc_localizar;

		if(player distance2D (getMarkerPos _nearestMarker) < 300) then {
			[["UpdateState", format ["Lays unconscious at the %1", _locationName]]] call SCRT_fnc_misc_updateRichPresence;
		} else {
			[["UpdateState", "Lays unconscious in the middle of nowhere"]] call SCRT_fnc_misc_updateRichPresence;
		};
	};
};


while {(time < _bleedOut) && (_unit getVariable ["incapacitated",false]) && (alive _unit) && (!(_unit getVariable ["respawning",false]))} do {
	if (random 10 < 1) then {playSound3D [(selectRandom injuredSounds),_unit,false, getPosASL _unit, 1, 1, 50];};
	if (_isPlayer) then {
		_helped = _unit getVariable ["helped",objNull];
		if (isNull _helped) then {
			_helpX = [_unit] call A3A_fnc_askHelp;
			if (isNull _helpX) then {
				_textX = format ["<t size='0.6'>There is no AI near to help you.<t size='0.5'><br/>Press R to Respawn</t></t>"];
			}
			else {
				if (_helpX != _unit) then {_textX = format ["<t size='0.6'>%1 is on the way to help you.<t size='0.5'><br/>Press R to Respawn</t></t>",name _helpX]} else {_textX = "<t size='0.6'>Wait until you get assistance or<t size='0.5'><br/>Press R to Respawn</t></t>"};
			};
		}
		else {
			if (!isNil "_helpX") then {
				if (!isNull _helpX) then {_textX = format ["<t size='0.6'>%1 is on the way to help you.<t size='0.5'><br/>Press R to Respawn</t></t>",name _helpX]} else {_textX = "<t size='0.6'>Wait until you get assistance or<t size='0.5'><br/>Press R to Respawn</t></t>"};
			}
			else {
				_textX = "<t size='0.6'>Wait until you get assistance or<t size='0.5'><br/>Press R to Respawn</t></t>";
			};
		};
		[_textX,0,0,3,0,0,4] spawn bis_fnc_dynamicText;
		if (_unit getVariable "respawning") exitWith {};
	}
	else {
		if (_inPlayerGroup) then {
			if (autoHeal) then {
				_helped = _unit getVariable ["helped",objNull];
				if (isNull _helped) then {[_unit] call A3A_fnc_askHelp;};
			};
		}
		else {
			_helped = _unit getVariable ["helped",objNull];
			if (isNull _helped) then {[_unit] call A3A_fnc_askHelp;};
		};
	};
	sleep 3;
	if !(isNull attachedTo _unit) then {_bleedOut = _bleedOut + 4};
};

if (_isPlayer) then {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
	if (isMultiplayer) then {[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",0,_unit]};
}
else {
	_unit stop false;
	if (_inPlayerGroup or _playersX) then {
		[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",0,_unit];
	};
};

if (captive _unit) then {[_unit,false] remoteExec ["setCaptive",0,_unit]; _unit setCaptive false};
_unit setVariable ["overallDamage",damage _unit];
if (_isPlayer and (_unit getVariable ["respawn",false])) exitWith {};

if (time > _bleedOut) exitWith {
	if (_isPlayer) then {
		[_unit] call A3A_fnc_respawn
	}
	else {
		_unit setDamage 1;
	};
};

if (alive _unit) then {
	_unit setUnconscious false;
	_unit setBleedingRemaining 0;
	_unit switchMove "unconsciousoutprone";

	if (isPlayer _unit) then {
		[] call SCRT_fnc_misc_updateRichPresence;
	};
};