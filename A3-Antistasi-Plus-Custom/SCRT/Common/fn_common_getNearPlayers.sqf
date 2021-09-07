//	Author: Socrates
// 
//	Description:
//	Finds all near players.
//
//	Returns:
//	Array of players in given radius.
//
// 	How to use: 
// 	[50, _vehicle, teamPlayer] call SCRT_fn_common_getNearPlayers;
//


params ["_distance", "_center", "_side"];

private _players = call BIS_fnc_listPlayers select {side _x == _side && {_x distance2D _center <= _distance}};

_players