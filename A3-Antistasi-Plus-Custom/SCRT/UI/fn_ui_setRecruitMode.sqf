["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_recruitGarrisonEventHandler;

[
    "INFO",
    "Recruit",  
    parseText "Click on any friendly outpost to recruit.", 
    60
] spawn SCRT_fnc_ui_showMessage;