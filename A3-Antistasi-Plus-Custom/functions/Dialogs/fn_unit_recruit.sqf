private ["_display","_childControl"];
createDialog "unitRecruit";

sleep 1;
disableSerialization;

private _display = findDisplay 100;

if (str (_display) != "no display") then {
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKMil];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKMG];
	_ChildControl = _display displayCtrl 126;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKMedic];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKEng];
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKExp];
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKGL];
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKSniper];
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable SDKATman];
};