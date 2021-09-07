params ["_side"];

/*  Checks if the Airdrop support is available

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _side: SIDE : The side which wants to call the support
    Returns:
        0 if QRF is possible, -1 otherwise
*/

if(tierWar < 2) exitWith {-1};

//Vehicles not available, block support
if(vehNATOTransportPlanes isEqualTo [] || { vehNATOTransportPlanes isEqualTo [] }) exitWith {-1};
if(vehNATOLightAPC isEqualTo [] || { vehCSATLightAPC isEqualTo [] }) exitWith {-1};

//Do a quick check for at least one available airport
private _index = airportsX findIf {
    sidesX getVariable [_x, sideUnknown] == _side && {[_x, true] call A3A_fnc_airportCanAttack}
};
if(_index == -1) exitWith {
    -1;
};


//Select a timer index and the max number of timers available
private _timerIndex = -1;
private _playerAdjustment = (floor ((count allPlayers)/4)) + 1;

//Search for a timer which allows the support to be fired
if(_side == Occupants) then
{
    if(count occupantsAirdropTimer < _playerAdjustment) then
    {
        _timerIndex = count occupantsAirdropTimer;
        for "_i" from ((count occupantsAirdropTimer) + 1) to _playerAdjustment do
        {
            occupantsAirdropTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = occupantsAirdropTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};
if(_side == Invaders) then
{
    if(count invadersAirdropTimer < _playerAdjustment) then
    {
        _timerIndex = count invadersAirdropTimer;
        for "_i" from ((count invadersAirdropTimer) + 1) to _playerAdjustment do
        {
            invadersAirdropTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = invadersAirdropTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};

_timerIndex;