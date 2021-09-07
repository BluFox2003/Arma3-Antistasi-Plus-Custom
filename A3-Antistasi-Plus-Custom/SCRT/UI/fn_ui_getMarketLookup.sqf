params ["_displayId"];

//[textbox with cost, combobox with data]
private _relativeControlIds = nil;

switch (_displayId) do {
    case (90000): { //black market
        _relativeControlIds = [1010,1005];
    };
    case (110000): { //box menu
        _relativeControlIds = [710,705];
    };
};

_relativeControlIds