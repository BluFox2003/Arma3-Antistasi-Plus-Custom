["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_disbandGarrisonEventHandler;

[
    "INFO",
    "Disband",  
    parseText "Click on any friendly marker to disband and refund some part of it's cost.", 
    60
] spawn SCRT_fnc_ui_showMessage;