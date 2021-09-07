if !(membershipEnabled) exitWith {true};
_obj = _this getVariable ["owner", _this];
if (isNil "membersX") then {waitUntil {sleep 0.5; !(isNil "membersX")}};
if !((getPlayerUID _obj) in membersX) exitWith {false};
true