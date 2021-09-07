private _membersText = "";
private _countN = 0;

if (membershipEnabled) then {
	{
		_playerX = _x getVariable ["owner",objNull];
		if (!isNull _playerX) then {
			if (_playerX call A3A_fnc_isMember) then {
				_membersText = format ["%1%2, ", _membersText, name _playerX]
			} else {
				_countN = _countN + 1
			};
		};
	} forEach (call A3A_fnc_playableUnits);

	_membersText = format ["%1No members: %2", _membersText, _countN];
} else {
	_membersText = "Server Member feature is disabled.";
};

_membersText