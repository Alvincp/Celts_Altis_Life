/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
TON_Debug = true;
//Internal Debugging.
if(!isNil "TON_Debug") then {
	diag_log format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		_curMag = currentMagazine _source;

		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then { if(typeOf(vehicle player) != "B_Heli_Light_01_F" || typeOf(vehicle player) != "I_Heli_light_03_unarmed_F" || typeOf(vehicle player) != "O_Heli_Light_02_unarmed_F" || typeOf(vehicle player) != "I_Heli_Transport_02_F") then {true} else {false}} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = 0;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle || _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = 0;
			};
		};
		
		//rubber bullets
		if(_projectile in ["B_9x21_Ball"] && _curWep in ["SMG_02_F"]) then {
			if((side _source == west && playerSide != west)) then {
				//to make stuff smother we check first if somebody is already downed
				if life_isdowned then {
					_damage = 0;
				} else {
					_futureHealth = (damage player) + _damage;
					_helthPercentage = round((1 - _futureHealth) * 100);
					//we down the player if: the damage is a killshot, the shot would kill the player or if the shot drops player health below 20%
					if (_damage == 1 OR _futureHealth == 1 OR 20 > _helthPercentage) then {
						private["_isVehicle","_isQuad"];
						_isVehicle = if(vehicle player != player) then {true} else {false};
						_isQuad = if(_isVehicle) then {if(typeOf(vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
						_damage = 0;	
						[_unit,_source] spawn life_fnc_handleDowned;
					};
				};
			};
			//police cant hurt each other with rubber bullets
			if(side _source == west && playerSide == west) then {
				_damage = 0;
			};
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;