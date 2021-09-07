private ["_markerX","_mrkD"];

_markerX = _this select 0;

_mrkD = format ["Dum%1",_markerX];
if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then {
	_textX = if (count (garrison getVariable [_markerX,[]]) > 0) then {format [": %1", count (garrison getVariable [_markerX,[]])]} else {""};
	_mrkD setMarkerColor colorTeamPlayer;

	switch (true) do {
		case (_markerX in airportsX): {
			_textX = format ["%2 Airbase%1",_textX,nameTeamPlayer];
			[_mrkD,format ["%1 Airbase",nameTeamPlayer]] remoteExec ["setMarkerTextLocal",[Occupants,Invaders],true];
			if (markerType _mrkD != SDKFlagMarkerType) then {_mrkD setMarkerType SDKFlagMarkerType};
			_mrkD setMarkerColor "Default";
		};
		case(_markerX in outposts): {
			_textX = format ["%2 Outpost%1",_textX,nameTeamPlayer];
			[_mrkD,format ["%1 Outpost",nameTeamPlayer]] remoteExec ["setMarkerTextLocal",[Occupants,Invaders],true];
		};
		case(_markerX in resourcesX): {
			_textX = format ["Resources%1",_textX];
		};
		case(_markerX in factories): {
			_textX = format ["Factory%1",_textX];
		};
		case(_markerX in seaports): {
			if (toLower worldName isEqualTo "enoch") then {
				_textX = format ["River Port%1",_textX];
			} else {
				_textX = format ["Sea Port%1",_textX];
			};
		};
		case(_markerX in milbases): {
			_textX = format ["%2 Military Base%1",_textX,nameTeamPlayer];
			[_mrkD,format ["%1 Military Base", nameTeamPlayer]] remoteExec ["setMarkerTextLocal",[Occupants,Invaders],true];
		};
		default {};
	};
	[_mrkD,_textX] remoteExec ["setMarkerTextLocal",[teamPlayer,civilian],true];
}
else {
	if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {
		switch(true) do {
			case(_markerX in airportsX): {
				_mrkD setMarkerText format ["%1 Airbase",nameOccupants];
				_mrkD setMarkerType flagNATOmrk;
				_mrkD setMarkerColor "Default";
			};
			case(_markerX in outposts): {
				_mrkD setMarkerText format ["%1 Outpost",nameOccupants];
				_mrkD setMarkerColor colorOccupants;
			};
			case(_markerX in milbases): {
				_mrkD setMarkerText format ["%1 Military Base", nameOccupants];
				_mrkD setMarkerColor colorOccupants;
			};
			default {
				_mrkD setMarkerColor colorOccupants;
			};
		};
	}
	else {
		switch(true) do {
			case(_markerX in airportsX): {
				_mrkD setMarkerText format ["%1 Airbase",nameInvaders];
				_mrkD setMarkerType flagCSATmrk;
				_mrkD setMarkerColor "Default";
			};
			case(_markerX in outposts): {
				_mrkD setMarkerText format ["%1 Outpost",nameInvaders];
				_mrkD setMarkerColor colorInvaders;
			};
			case(_markerX in milbases): {
				_mrkD setMarkerText format ["%1 Military Base", nameInvaders];
				_mrkD setMarkerColor colorInvaders;
			};
			default {
				_mrkD setMarkerColor colorInvaders;
			};
		};
	};

	switch(true) do {
		case(_markerX in resourcesX): {
			_mrkD setMarkerText "Resources";
		};
		case(_markerX in factories): {
			_mrkD setMarkerText "Factory";
		};
		case(_markerX in seaports): {
			if (toLower worldName isEqualTo "enoch") then {
				_mrkD setMarkerText "River Port";
			} else {
				_mrkD setMarkerText "Sea Port";
			};
		};
		default {};
	};
};
