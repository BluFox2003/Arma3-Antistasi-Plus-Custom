if (!hasInterface) exitWith {};
if (!playerIcons) exitWith {};

addMissionEventHandler [
	"Draw3D",
	{
		{
			//mark wounded friendly players
			if (alive _x && {side player getFriend side _x > 0.5} && {(lifeState _x) == "INCAPACITATED"}) then {
				_dist = player distance _x;
				if (_dist < 100) then {
					_pos = getPosATLVisual _x;
					_pos set [2, (_pos select 2) + 1 + (_dist * 0.05)];

					private _localizedText = localize "STR_antistasi_actions_draw3d_unconscious_text";

					drawIcon3D [
						"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_reviveMedic_ca.paa",
						[1,0,0,1 - (_dist / 100)], 
						_pos, 
						1, 
						1, 
						0, 
						[_localizedText, name _x] joinString " ", 
						1, 
						0.04 - (_dist / 9000), 
						"PuristaMedium"
					];
				};
			};
		} forEach (call BIS_fnc_listPlayers - [player]);
	}
];

