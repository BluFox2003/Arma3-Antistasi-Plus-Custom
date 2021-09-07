if (player != theBoss) exitWith {
    ["Clean Forest", "Only Commanders can order to clean the forest"] call A3A_fnc_customHint;
};

{[_x,true] remoteExec ["hideObjectGlobal",2]} forEach (nearestTerrainObjects [getMarkerPos respawnTeamPlayer,["tree","bush","small tree"],70]);

chopForest = true;
publicVariable "chopForest";

["Clean Forest", "You've cleared the surroundings of HQ from trees and bushes"] call A3A_fnc_customHint;