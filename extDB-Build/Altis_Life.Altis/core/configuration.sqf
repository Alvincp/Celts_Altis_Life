#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_respawn_timer_long = 5; //respawn timer when a medic is online
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_death_save_gear = [west]; //any side mentioned in this array keep their gear when respawning (cant be a __CONST__ due to onPlayerKilled eventHandler)
//player count variables
life_count_cops = 0;
life_count_medics = 0;
life_count_civs = 0;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Persistent weapons
__CONST__(life_gun_despawn_delay,0); //time in seconds guns should persist on the ground after a player has respawned

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,5000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,6); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//jail related stuff
__CONST__(life_defaultBail,100000); //if the crime cant be determined this is the default bail
life_defaultJailTime = 10*60;
__CONST__(life_defaultJailTime,life_defaultJailTime); //if the crime cant be determined this is the default jail time
life_jailRespawnPunishment = 18*60;
__CONST__(life_jailRespawnPunishment,life_jailRespawnPunishment); //if somebody respawns to try to avoid jail time this is how much time they'll have to spend in jail for it, -1 is max time

//Federal Reserve related stuff
__CONST__(life_fedres_min_cops_num, 3); //sets the minimum amount of cops which need to be online to rob the federal reserve

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 50; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 50; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
life_player_bounty = 0;
__CONST__(life_paycheck_period,5); //Five minutes
life_cash = 0;
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_istazed = false;
life_isdowned = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 100000; //Starting Bank Money
		life_paycheck = 1000; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 100000; //Starting Bank Money
		life_paycheck = 420; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 100000;
		life_paycheck = 2000;
	};
};

/*
	Master Array of items?
*/
//life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
//__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_platinumu",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_platinump",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_zipties",
	"life_inv_methu",
	"life_inv_methp",
	"life_inv_corn",
	"life_inv_blueburger",
	"life_inv_gyros",
	"life_inv_redburger",
	"life_inv_twix",
	"life_inv_kitkat",
	"life_inv_crisps",
	"life_inv_cola",
	"life_inv_speedbomb",
	"life_inv_moonshine"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_platinum","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_meth","civ"],
	["license_civ_moonshine","civ"],
	["license_civ_adv","civ"] //advanced pilot licence
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",3000],["heroinp",6000],["cocaine",1750],["cocainep",3500],["cannabis",1500],["marijuana",3000],["turtle",3000],["blastingcharge",10000],["boltcutter",500],["methu",3250],["methp",6500]];

/*
	Resources list, see fn_resourceCfg.sqf for the configuration for each resource
	to remove the ability to gather a specific resource just comment it out on the list (all zones will be deactivated)
*/
resource_list = [
	"apple", 
	"peach", 
	"heroinu", 
	"cocaine", 
	"cannabis", 
	"methu", 
	"corn", 
	"copperore",
	"ironore",
	"salt",
	"platinumu",
    "diamond",
    "oilu",
	"rock"
];

/*
	crimes code list, see fn_crimesCfg.sqf for the configuration for each resource
	to remove the ability to charge somebody for a specific crime just comment it out here
	The crimes will show in the order they are below on the charge suspect list
*/
crimes_list = [
	"101", //Evading Arrest
	"102", //Possession of an illegal weapon
	"103", //Possession of an illegal vehicle
	"104", //Threatening an officer
	"105", //Bank Robbery
	"106", //Possession of explosives
	"107", //Disobeying an Officer
	"108", //Assault
	"108P", //Assault on Police
	"109", //Disturbing the peace
	"110", //Trespassing
	"111", //Driving without headlights
	"112", //Driving without a license
	"113", //Dangerous Driving
	"187V", //Vehicular Manslaughter
	"187A", //Attempted Murder
	"187", //Manslaughter
	"901", //Escaping Jail
	"215", //Attempted Auto Theft
	"213", //Use of illegal explosives
	"211", //Robbery
	"211A", //Attempted Robbery
	"207", //Kidnapping
	"207A", //Attempted Kidnapping
	"487", //Grand Theft
	"488", //Petty Theft
	"480", //Hit and run
    "481", //Drug Possession
    "482", //Intent to distribute
	"483", //Drug Trafficking
	"459", //Burglary
	"666" //Terrorism
];

/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",2500],
	["heroinp",6000],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",3200],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",3000],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",5000],
	["cocainep",5000],
	["diamond",1500],
	["diamondc",3000],
	["iron_r",3200],
	["copper_r",1500],
	["salt_r",1650],
	["platinump",6250],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",95000],
	["zipties",2],
	["methu",650],
	["methp",6500],
	["speedbomb",400000],
	["moonshine",1000]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",65],
	["twix",65],
	["kitkat",65],
	["crisps",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["cola",10],
	["tbacon",75],
	["blueburger",75],
	["redburger",75],
	["gyros",150],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",750],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["zipties",5],
	["speedbomb",500000],
	["moonshine",1500]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",100],
	["C_Hatchback_01_F",1200],
	["C_Offroad_01_F", 1500],
	["B_G_Offroad_01_F",1700],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",5000],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",3000],
	["I_Heli_Transport_02_F",12500],
	["C_Van_01_box_F",5000],
	["I_Truck_02_transport_F",7500],
	["I_Truck_02_covered_F",8000],
	["B_Truck_01_transport_F",12500],
	["B_Truck_01_box_F", 10000],
	["O_MRAP_02_F",15000],
	["C_Heli_Light_01_civil_F",5000],
	["B_Heli_Light_01_F",7500],
	["I_Heli_light_03_unarmed_F",9000],
	["O_Heli_Light_02_unarmed_F",12000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",7500],
	["B_MRAP_01_hmg_F",30000],
	["B_G_Offroad_01_armed_F",50000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",125000],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",65000],
	["C_Heli_Light_01_civil_F",55000],
	["B_Heli_Light_01_F",63000],
	["I_Heli_light_03_unarmed_F",78000],
	["O_Heli_Light_02_unarmed_F",82500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",100000],
	["B_MRAP_01_hmg_F",600000],
	["B_G_Offroad_01_armed_F",600000]
];
__CONST__(life_garage_sell,life_garage_sell);

/*
	Debug Variables
*/
[] call life_fnc_debugConfiguration;
