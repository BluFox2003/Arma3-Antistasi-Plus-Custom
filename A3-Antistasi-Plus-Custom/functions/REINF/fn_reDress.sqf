params ["_unit"];

_unit addUniform (selectRandom (A3A_faction_reb getVariable "uniforms"));
_unit addItemToUniform "FirstAidKit";
