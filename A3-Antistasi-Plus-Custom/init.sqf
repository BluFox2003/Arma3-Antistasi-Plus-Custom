#include "Includes\common.inc"
FIX_LINE_NUMBERS()
Info("Init Started");
//Arma 3 - Antistasi by Barbolani & The Official AntiStasi Community
//Do whatever you want with this code, but credit me for the thousand hours spent making this.
private _fileName = "init.sqf";
scriptName "init.sqf";

if (isNil "logLevel") then {logLevel = 2};
if (isNil "isSystemChatPostingAllowed") then {isSystemChatPostingAllowed = false};
Info("Init SQF started");

//Singleplayer is no longer supported
if (!isMultiplayer) then {
	["noSinglplayer",false,1,false,false] call BIS_fnc_endMission;
};

enableSaving [false,false];
if !(toLower worldName == "cam_lao_nam") then {mapX setObjectTexture [0, "Pictures\Mission\whiteboard.jpg"];}
	else {};

Info("Init Finished");
