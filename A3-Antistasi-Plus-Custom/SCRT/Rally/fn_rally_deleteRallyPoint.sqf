isRallyPointPlaced = false;
publicVariable "isRallyPointPlaced";

{
    deleteVehicle _x;
} forEach rallyProps;

rallyProps = nil;
publicVariable "rallyProps";

deleteVehicle rallyPointRoot;
rallyPointRoot = nil;
publicVariable "rallyPointRoot";

deleteMarker rallyPointMarker;
deleteMarker "RallyPointMarker";
publicVariable "rallyPointMarker";

private _announceText = format ["<t size='0.6'><t size='0.6' color='#008000'>Rally point</t> ran out of remaining travels.</t>"];
[petros, "support", _announceText] remoteExec ["A3A_fnc_commsMP", 0];