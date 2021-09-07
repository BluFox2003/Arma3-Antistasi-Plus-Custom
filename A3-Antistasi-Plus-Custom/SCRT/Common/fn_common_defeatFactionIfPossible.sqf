params ["_sideX"];

if (!factionsDefeat) exitWith {};
if (areInvadersDefeated && {_sideX == Invaders}) exitWith {};
if (areOccupantsDefeated && {_sideX == Occupants}) exitWith {};

private _remainingBases = { sidesX getVariable [_x, sideUnknown] == _sideX } count airportsX + milbases + outposts + seaports + factories + resourcesX;

if (_remainingBases < 1) then {
    if (_sideX == Invaders) then {
        areInvadersDefeated = true; 
        publicVariable "areInvadersDefeated";

        "CSAT_carrier" setMarkerAlpha 0;
        private _text = format [
            "<t size='0.6'><t size='0.6' color='#800000'>%1</t> surrendered. Their aircraft carrier will leave the surrounding sea, they will no longer launch any attack on us. Congratulations!</t>", 
            nameInvaders
        ];
        [petros, "announce", _text] remoteExec ["A3A_fnc_commsMP", 0];
    };

    if (_sideX == Occupants) then {
        areOccupantsDefeated = true; 
        publicVariable "areOccupantsDefeated";

        "NATO_carrier" setMarkerAlpha 0;
        private _text = format [
            "<t size='0.6'><t size='0.6' color='#004d99'>%1</t> surrendered. Their aircraft carrier will leave the surrounding sea and they will no longer launch any attack on us. Congratulations!</t>", 
            nameOccupants
        ];
        [petros, "announce", _text] remoteExec ["A3A_fnc_commsMP", 0];
    };

    [] remoteExec ["A3A_fnc_statistics", [teamPlayer, civilian]];
};