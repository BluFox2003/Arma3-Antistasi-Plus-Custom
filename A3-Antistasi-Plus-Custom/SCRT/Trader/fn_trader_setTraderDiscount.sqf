params ["_discount"];

private _fileName = "trader_setTraderDiscount";
private _trader = if (!isNil "traderX") then {
    traderX
} else { 
    nil 
};



if (isNil "_trader") exitWith {
    [3, "Trader is not spawned yet.", _fileName] call A3A_fnc_log;
};

[2, format ["Setting %1 discount.", _discount], "fn_trader_setTraderDiscount", true] call A3A_fnc_log;

_trader setVariable ["HALs_store_trader_sale", _discount, true];

traderDiscount = _discount;
publicVariable "traderDiscount";