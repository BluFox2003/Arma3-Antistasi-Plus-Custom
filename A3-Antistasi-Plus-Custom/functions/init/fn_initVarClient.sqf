/** 
 * This file is called AFTER initVarServer.sqf, on both the client and server.
 */
scriptName "initVarClient.sqf";
private _fileName = "initVarClient.sqf";
[2,"initVarClient started",_fileName] call A3A_fnc_log;

//Is music enabled
musicON = false;

//True when the client is saving
savingClient = false;

//Prevents units being recruited too soon after being dismissed.
recruitCooldown = 0;	

incomeRep = false;

//Should AI automatically heal teammates. Each client has their own copy of this.
autoHeal = false;	

//Should AI carry wounded player before revive. Each client has their own copy of this.
coverBeforeRevive = true;

//Are players know about that IDAP pays for released prisoners
isPowPaycheckAnnounced = false;

isSupportAnnounced = false;

isMenuOpen = false;

// rocket camera
isProjectileCamEnabled = false;

//parachute attendance
isPlayerParadropable = true;

[2,"initVarClient completed",_fileName] call A3A_fnc_log;