params ["_title", "_message"];

playSound "3DEN_notificationWarning";
[_title, _message] call A3A_fnc_customHint;