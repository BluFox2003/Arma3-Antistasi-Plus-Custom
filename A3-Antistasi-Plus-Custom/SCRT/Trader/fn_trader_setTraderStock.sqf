//	Author: Socrates
// 
//	Description:
//	Sets trader stock based on current modset.
//
//	Returns:
//	Nothing.
//
// 	How to use: 
// 	[_traderX] call SCRT_fnc_trader_setTraderStock;
params ["_traderX"];

diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Choosing trader stock...", servertime];
diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Trader: %2", servertime, str _traderX];

switch (true) do {
    case (A3A_coldWarMode): {
        diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Using 3CBF trader stock.", servertime];
        [_traderX, "3cbfcw"] call HALs_store_fnc_addTrader;
    };
    case (A3A_hasGlobMobAaf): {
        diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Using GM AAF trader stock.", servertime];
        [_traderX, "globmobaaf"] call HALs_store_fnc_addTrader;
    };
    case (A3A_has3CBFactions): {
        diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Using 3CBF trader stock.", servertime];
        [_traderX, "3cbf"] call HALs_store_fnc_addTrader;
    };
    case (A3A_hasRhs): {
        diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Using RHS trader stock.", servertime];
        [_traderX, "rhs"] call HALs_store_fnc_addTrader;
    };
    case (A3A_hasAegis): {
        diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Initializing Aegis trader.", servertime];
        [_traderX, "aegis"] call HALs_store_fnc_addTrader;
    };
    case (A3A_hasCup): {
        diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Using CUP trader stock.", servertime];
        [_traderX, "cup"] call HALs_store_fnc_addTrader;
    };
    default  {
        diag_log format ["%1: [Antistasi] | INFO | fn_trader_setTraderStock | Initializing vanilla trader.", servertime];
        [_traderX, "vanilla"] call HALs_store_fnc_addTrader;
    };
};

[] call SCRT_fnc_trader_removeUnlockedItemsFromStock;