disableSerialization;

menuComplete = false;

menuSliderArray = [
	[format ["%1 MANAGEMENT", (toUpper nameTeamPlayer)], 3000],
	["MANAGE GARRISONS", 2000]
];

menuSliderCurrent = 0;

ctrlSetFocus ((findDisplay 60000) displayCtrl 1151);

((findDisplay 60000) displayCtrl 1050) ctrlSetText "Rebel HQ";

outpostType = "WATCHPOST";
minefieldType = "APERSMine";

//Create Outpost Combobox 
lbAdd [2750, "Watchpost"];
lbSetData [2750, 0, "WATCHPOST"];
lbAdd [2750, "Roadblock"];
lbSetData [2750, 1, "ROADBLOCK"];
lbAdd [2750, "HMG Emplacement"];
lbSetData [2750, 2, "HMG"];
lbAdd [2750, "AA Emplacement"];
lbSetData [2750, 3, "AA"];
lbAdd [2750, "AT Emplacement"];
lbSetData [2750, 4, "AT"];
lbAdd [2750, "Mortar Emplacement"];
lbSetData [2750, 5, "MORTAR"];

lbSetCurSel [2750, 0];

//Minefield Combobox 
lbAdd [2758, "APERS Mines"];
lbSetData [2758, 0, "APERSMine"];
lbAdd [2758, "AT Mines"];
lbSetData [2758, 1, "ATMine"];

lbSetCurSel [2758, 0];

{	
	if (!(ctrlIDC _x in [1055, 1056, 1140, 1700, 1701, 1750, 1751, 1702, 1703, 1704, 1710, 1711, 1712, 6014])) then {
		((findDisplay 60000) displayCtrl (ctrlIDC _x)) ctrlSetFade 0;
	};

	((findDisplay 60000) displayCtrl (ctrlIDC _x)) ctrlCommit 0.3;	
} forEach (allControls findDisplay 60000);

private _fiaTrainingText = format ["FIA Skill Level: %1", skillFIA];
((findDisplay 60000) displayCtrl 3102) ctrlSetText _fiaTrainingText;

//hiding reroll button if conditions are not met
if (!(isTraderQuestCompleted || (!(isNil 'isTraderQuestAssigned') && {isTraderQuestAssigned}))) then {
	((findDisplay 60000) displayCtrl 6014) ctrlShow false;
};

menuComplete = true;

//Support menu is always first tab, the only workaround at the moment
[60000,'LEFT'] spawn SCRT_fnc_ui_changeTab;
sleep 0.1;
[60000,'LEFT'] spawn SCRT_fnc_ui_changeTab;