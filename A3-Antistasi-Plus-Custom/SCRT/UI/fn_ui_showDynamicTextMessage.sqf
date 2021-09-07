params ["_header", "_text", ["_severity", "INFO"], ["_duration", 5], ["_layer", 359]];

private _finalText = nil;

switch (_severity) do {
    case ("INFO"): {
        _finalText = format ["<t size='0.6' color='#f0d498'>%1</t><br/><t size='0.5'>%2</t>", _header, _text];
    };

    case ("WARNING"): {
        playSound "3DEN_notificationWarning";
        _finalText = format ["<t size='0.6' color='#f0d498'>%1</t><br/><t size='0.5'>%2</t>", _header, _text];
    };

    case ("FAIL"): {
        playSound "3DEN_notificationWarning";
        _finalText = format ["<t size='0.6' color='#e60000'>%1</t><br/><t size='0.5'>%2</t>", _header, _text];
    };

    case ("SUCCESS"): {
        playSound "3DEN_notificationDefault";
        _finalText = format ["<t size='0.6' color='#00cc00'>%1</t><br/><t size='0.5'>%2</t>", _header, _text];
    };
};

[_finalText, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], -0.15, _duration, 0, 0, _layer] spawn bis_fnc_dynamicText;