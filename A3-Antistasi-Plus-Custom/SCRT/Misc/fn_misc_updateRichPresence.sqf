// ["task",value]
//
// ["UpdateDetails","New Details"],
// ["UpdateState","New State"],
// ["UpdateLargeImageKey","New Art Asset"],
// ["UpdateSmallImageKey","New Art Asset"],
// ["UpdatePartySize",count playableUnits],
// ["UpdatePartyMax",getNumber(missionConfigFile >> "Header" >> "maxPlayers")],
// ["UpdateStartTimestamp",[-1,-30]], // 1 Hour 30 Mins since mission start
// ["UpdateEndTimestamp",[1,30]] // 1 Hour 30 Mins until mission end

params [
    ["_updateArray", ["UpdateState", format ["Liberates %1", ([] call SCRT_fnc_misc_getWorldName)]]]
];

if (!isDiscordRichPresenceActive) exitWith {};

[3, format ["Updating rich presence with these parameters: %1", str _updateArray], "fn_misc_updateRichPresence"] call A3A_fnc_log;
[_updateArray] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);