params ["_unit", "_playerX"];

if (!alive _unit) exitWith {
    [_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
};

if (captive _playerX) then { _playerX setCaptive false };

_playerX globalChat "You are free!";
_unit setDir (getDir _playerX);
_playerX playMove "MountSide";
sleep 5;
_playerX playMove "";

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

_unit globalChat "Thank you. I owe you my life!";
_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
_unit enableAI "TARGET";
_unit enableAI "ANIM";
[_unit] spawn A3A_fnc_FIAInit;
if (captive _unit) then { _unit setCaptive false };

[_unit] spawn {
    params ["_prisoner"];
    waitUntil { sleep 0.5; !captive _prisoner || {!alive _prisoner}};

    if (alive _prisoner && {!captive _prisoner}) then {
        sleep 2;
        [_prisoner,"sideChat","I'm free, thank you!"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
        [_prisoner, teamPlayer, false] remoteExec ["A3A_fnc_fleeToSide", _prisoner];
        sleep 30;
        [1,0] remoteExec ["A3A_fnc_resourcesFIA",2];
        deleteVehicle _prisoner;
    };
};