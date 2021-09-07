#define COST 5000

["hqMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_hqTabEventHandler;

[
    "INFO",
    "Rebuild Assets",  
    parseText format ["Click on any friendly marker to rebuild radio towers and military buildings there.<br/>Cost: %1 €.", str COST], 
    60
] spawn SCRT_fnc_ui_showMessage;