private _filename = "fn_common_shareFactionMoneyWithMembers";
private _resourcesFIA = server getVariable ["resourcesFIA", 0];

if(_resourcesFIA < 10) exitWith {
    [3, "Not enough rebel resources to share." , _filename] call A3A_fnc_log;
    [
        localize "STR_antistasi_actions_common_notifications_share_money_title", 
        localize "STR_antistasi_actions_common_notifications_share_money_not_enough_text"
    ] remoteExecCall ["A3A_fnc_customHint", theBoss];
};


private _affectedPlayers = (call BIS_fnc_listPlayers) select { side _x == teamPlayer || side _x == civilian};

if (membershipEnabled) then {
    _affectedPlayers = _affectedPlayers select { 
        private _uid = getPlayerUID _x;
        private _isMember = _x call A3A_fnc_isMember;
       _isMember
    };
};

private _playersCount = count _affectedPlayers;

if(_playersCount > 0) then {
    private _sharePerPlayer = round(_resourcesFIA / _playersCount);
    { 
        [_sharePerPlayer] remoteExec ["A3A_fnc_resourcesPlayer", _x];
        private _paycheckText = format [
            "<t size='0.6'>Commander %1 shares rebel money equally among all members. %2 recieves his share - <t color='#00FF00'>%3 €</t>.</t>",
            name theBoss,
            name _x,  
            _sharePerPlayer
    	];

		[petros, "income", _paycheckText] remoteExec ["A3A_fnc_commsMP", _x];
    } forEach _affectedPlayers;
};

server setVariable ["resourcesFIA", 0, true];