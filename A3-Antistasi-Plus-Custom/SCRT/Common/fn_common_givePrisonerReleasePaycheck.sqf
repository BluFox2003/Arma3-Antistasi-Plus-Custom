//	Author: Socrates
// 
//	Description:
//	Adds payment on player account for released enemy's POW.
//
//	Returns:
//	Nothing
//
// 	How to use: 
// 	[player, Occupants] call SCRT_fnc_common_givePrisonerReleasePaycheck;
//

params ["_playerX", "_side"];

//Invaders have no agreements with IDAP, and rebels are not recognized by international organizations before war level 4
if(_side != Occupants || tierWar < 4) exitWith {};

_releasePaycheck = 0;

switch (aggressionLevelOccupants) do {
    case (1): {
        _releasePaycheck = 125;
    };
    case (2): {
        _releasePaycheck = 100;
    };
    case (3): {
        _releasePaycheck = 50;
    };
    case (4): {
        _releasePaycheck = 25;
    };
    default {
        // nothing
    };
};

if(_releasePaycheck > 0) then {
    [_playerX,_releasePaycheck] spawn {
        params ["_playerX", "_releasePaycheck"];

        _timeOut = time + 120;
        waitUntil { time > _timeOut; };

        _playerX setVariable ["moneyX", ((_playerX getVariable ["moneyX", 0]) + _releasePaycheck) max 0, true];
        _nickname = name _playerX;
        _textX = format [
            "<t size='0.6'>Due to agreements with <t size='0.6' color='#FFA500'>IDAP</t>, %1 recieves <t color='#00FF00'>%2 €</t> for released prisoner.</t>",
            _nickname,  
            _releasePaycheck
        ];

        [petros,"income",_textX] remoteExec ["A3A_fnc_commsMP", _playerX];
    };
};