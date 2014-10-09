/*
	File: fn_vehicleDelete.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't actually delete since we don't give our DB user that type of
	access so instead we set it to alive=0 so it never shows again.
*/
private["_vid","_sp","_pid","_query","_sql","_type"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,2500,[0]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,4,"",[""]] call BIS_fnc_param;

if(_vid == -1 OR _pid == "" OR _sp == 0 OR isNull _unit OR _type == "") exitWith {};
_unit = owner _unit;

["sell", [_vid,_pid]] call VEH_fnc_dbVehicle;

[[[_sp,_type],{life_atmcash = life_atmcash + (_this select 0); hint format[(localize "STR_Garage_SoldCar"),[(_this select 0)] call life_fnc_numberText];}],"BIS_fnc_call",_unit,false] spawn life_fnc_MP;