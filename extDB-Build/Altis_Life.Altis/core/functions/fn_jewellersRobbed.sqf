/*
    File: fn_jewellersRobbed.sqf
    Author: Patrick 'SrgFlip' Reister
    
    Description:
    when a shop is being robbed this makes sure that nobody can rob the same shop again
	for the next x seconds.
*/
private["_robbedJeweller","_actionID","_timeToWait"];
_robbedJeweller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_actionID = [_this,1] call BIS_fnc_param;//Action name - we currently have different kinds of shop robberies
_timeToWait = [_this,2,300] call BIS_fnc_param;
//HANDS UP!
_robbedJeweller switchMove "AmovPercMstpSsurWnonDnon";
//lets remove the action and simply wait our time out.
_robbedJeweller removeAction _actionID;
sleep _timeToWait;
_actionID = _robbedJeweller addAction["Rob the Jewellers",life_fnc_robJewellers];
//And show them that you can be robbed again
_robbedJeweller switchMove "";