private ["_truckX","_objectsX","_todo","_proceed","_boxX","_weaponsX","_ammunition","_items","_backpcks","_containers","_countX","_exists"];

_truckX = vehicle player;
_objectsX = [];
_todo = [];
_proceed = false;

[driver _truckX,"remove"] remoteExec ["A3A_fnc_flagaction",driver _truckX];

_objectsX = nearestObjects [_truckX, ["ReammoBox_F"], 20];

if (count _objectsX == 0) exitWith {};
_boxX = _objectsX select 0;

if ((_boxX == boxX) and (player!=theBoss)) exitWith {["Cargo", "Only the Commander can transfer this ammobox content to any truck"] call A3A_fnc_customHint; [driver _truckX,"truckX"] remoteExec ["A3A_fnc_flagaction",driver _truckX]};


_weaponsX = weaponCargo _boxX;
_ammunition = magazineCargo _boxX;
_items = itemCargo _boxX;
_backpcks = [];

_todo = _weaponsX + _ammunition + _items + _backpcks;
_countX = count _todo;

if (_countX < 1) then
	{
	["Cargo", "Closest Ammobox is empty"] call A3A_fnc_customHint;
	_proceed = true;
	};

if (_countX > 0) then
	{
	if (_boxX == boxX) then
		{
		if ("DEF_HQ" in A3A_activeTasks) then {_countX = round (_countX / 10)} else {_countX = round (_countX / 100)};
		}
	else
		{
		_countX = round (_countX / 5);
		};
	if (_countX < 1) then {_countX = 1};
	while {(_truckX == vehicle player) and (speed _truckX == 0) and (_countX > 0)} do
		{
		["Cargo", format ["Truck loading. <br/><br/>Time remaining: %1 secs", _countX]] call A3A_fnc_customHint;
		_countX = _countX -1;
		sleep 1;
		if (_countX == 0) then
			{
			[_boxX,_truckX] remoteExec ["A3A_fnc_ammunitionTransfer",2];
			_proceed = true;
			};
		if ((_truckX != vehicle player) or (speed _truckX != 0)) then
				{
				["Cargo", "Transfer cancelled due to movement of Truck or Player"] call A3A_fnc_customHint;
				_proceed = true;
				};
		};
	};

if (_proceed) then {[driver _truckX,"truckX"] remoteExec ["A3A_fnc_flagaction",driver _truckX]};