params ["_carried", "_carrier"];

if (!alive _carried) exitWith {
	["Carry/Drag", format ["%1 is dead",name _carried]] call A3A_fnc_customHint;
};

if !(_carried getVariable ["incapacitated",false]) exitWith {
	["Carry/Drag", format ["%1 no longer needs your help",name _carried]] call A3A_fnc_customHint;
};

if !(isNull attachedTo _carried) exitWith {
	["Carry/Drag", format ["%1 is being carried or transported and you cannot carry him",name _carried]] call A3A_fnc_customHint;
};

if (captive _carrier) then {
	[_carrier,false] remoteExec ["setCaptive",0,_carrier]; _carrier setCaptive false
};

_carrier playMoveNow "AcinPknlMstpSrasWrflDnon";
[_carried,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"];
_carried setVariable ["helped", _carrier, true];

if (isPlayer _carrier && {isPlayer _carried}) then {
	private _carriedName = name _carried;
	[["UpdateState", format ["Carries unconscious %1", _carriedName]]] call SCRT_fnc_misc_updateRichPresence;
};

[_carried,"remove"] remoteExec ["A3A_fnc_flagaction", 0, _carried];

_carried attachTo [_carrier, [0,1.1,0.092]];
_carried setDir 180;

private _timeOut = time + 60;

private _action = _carrier addAction [format ["Release %1",name _carried], {{detach _x} forEach (attachedObjects player)},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];

waitUntil {sleep 0.5; (!alive _carried) 
	|| !([_carrier] call A3A_fnc_canFight) 
	|| !(_carried getVariable ["incapacitated",false]) 
	|| ({!isNull _x} count attachedObjects _carrier == 0) 
	|| (time > _timeOut) 
	|| (vehicle _carrier != _carrier)
};

[] call SCRT_fnc_misc_updateRichPresence;

_carrier removeAction _action;
if (count attachedObjects _carrier != 0) then {detach _carried};
_carrier playMove "amovpknlmstpsraswrfldnon";
sleep 2;
_carried playMoveNow "";

if (_carried getVariable ["incapacitated",false]) then {
	[_carried,false] remoteExec ["setUnconscious",_carried];
	waitUntil {sleep 0.1; lifeState _carried != "incapacitated"};
	[_carried,true] remoteExec ["setUnconscious",_carried];
};

[_carried,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_carried];

sleep 5;

_carried setVariable ["helped",objNull,true];
