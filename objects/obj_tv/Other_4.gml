var r = string_letters(room_get_name(room));
if (r != "towertutorial" && r != "towertutorialN" && string_copy(r, 1, 5) == "tower")
{
	timer_tower = true;
	if global.panic
	{
		instance_destroy(obj_gusbrickchase);
		instance_destroy(obj_gusbrickfightball);
		instance_destroy(obj_peppermanvengeful);
		instance_destroy(obj_gusbrickhurt);
		instance_destroy(obj_gusbrickpoker);
		instance_destroy(obj_noisevengeful);
		instance_destroy(obj_noisewashingmachinetower);
		instance_destroy(obj_gusbrickhub);
		instance_destroy(obj_vigilanteunsure);
		instance_destroy(obj_tutorialbook);
	}
}
else
	timer_tower = false;
tv_bg_index = 0;
switch global.leveltosave
{
	case "entrance":
		tv_bg_index = 1;
		break;
	case "medieval":
		tv_bg_index = 2;
		break;
	case "ruin":
		tv_bg_index = 3;
		break;
	case "dungeon":
		tv_bg_index = 4;
		break;
	case "badland":
		tv_bg_index = 5;
		break;
	case "graveyard":
		tv_bg_index = 6;
		break;
	case "farm":
		tv_bg_index = 7;
		break;
	case "saloon":
		tv_bg_index = 8;
		break;
	case "plage":
		tv_bg_index = 9;
		break;
	case "forest":
		tv_bg_index = 10;
		break;
	case "space":
		tv_bg_index = 11;
		break;
	case "minigolf":
		tv_bg_index = 12;
		break;
	case "street":
		tv_bg_index = 13;
		break;
	case "sewer":
		tv_bg_index = 14;
		break;
	case "industrial":
		tv_bg_index = 15;
		break;
	case "freezer":
		tv_bg_index = 16;
		break;
	case "chateau":
		tv_bg_index = 17;
		break;
	case "kidsparty":
		tv_bg_index = 18;
		break;
	case "war":
		tv_bg_index = 19;
		break;
}
if special_prompts == noone && room != Realtitlescreen && room != characterselect
{
	special_prompts = ds_map_create();
	ini_open(concat("saveData", global.currentsavefile, ".ini"));
	ds_map_set(special_prompts, "knight", ini_read_real("Prompts", "knight", 0));
	ds_map_set(special_prompts, "boxxedpep", ini_read_real("Prompts", "boxxedpep", 0));
	ds_map_set(special_prompts, "mort", ini_read_real("Prompts", "mort", 0));
	ds_map_set(special_prompts, "squished", ini_read_real("Prompts", "squished", 0));
	ds_map_set(special_prompts, "skateboard", ini_read_real("Prompts", "skateboard", 0));
	ds_map_set(special_prompts, "cheeseball", ini_read_real("Prompts", "cheeseball", 0));
	ds_map_set(special_prompts, "shotgun", ini_read_real("Prompts", "shotgun", 0));
	ds_map_set(special_prompts, "ghost", ini_read_real("Prompts", "ghost", 0));
	ds_map_set(special_prompts, "firemouth", ini_read_real("Prompts", "firemouth", 0));
	ds_map_set(special_prompts, "fireass", ini_read_real("Prompts", "fireass", 0));
	ds_map_set(special_prompts, "bombpep", ini_read_real("Prompts", "bombpep", 0));
	ds_map_set(special_prompts, "rocket", ini_read_real("Prompts", "rocket", 0));
	ini_close();
}
if room == Realtitlescreen
{
	if special_prompts != -4
		ds_map_destroy(special_prompts);
	special_prompts = -4;
}
switch room
{
	case entrance_1:
		global.srank = 16000;
		break;
	case medieval_1:
		global.srank = 20000;
		break;
	case ruin_1:
		global.srank = 17000;
		break;
	case dungeon_1:
		global.srank = 18500;
		break;
	case badland_1:
		global.srank = 19500;
		break;
	case graveyard_1:
		global.srank = 20500;
		break;
	case saloon_1:
		global.srank = 20000;
		break;
	case farm_2:
		global.srank = 19000;
		break;
	case plage_entrance:
		global.srank = 23000;
		break;
	case forest_1:
		global.srank = 19000;
		break;
	case space_1:
		global.srank = 20000;
		break;
	case minigolf_1:
		global.srank = 23000;
		break;
	case street_intro:
		global.srank = 20000;
		break;
	case sewer_1:
		global.srank = 20000;
		break;
	case industrial_1:
		global.srank = 20000;
		break;
	case freezer_1:
		global.srank = 18200;
		break;
	case chateau_1:
		global.srank = 18000;
		break;
	case kidsparty_1:
		global.srank = 22000;
		break;
	case war_1:
		global.srank = 21500;
		break;
	case tower_finalhallway:
		global.srank = 5500;
		break;
	
	case boss_pepperman:
		global.srank = 6;
		break;
	case boss_vigilante:
		global.srank = 6;
		break;
	case boss_noise:
		global.srank = 5;
		break;
	case boss_fakepep:
		global.srank = 4;
		break;
	
	case secret_entrance:
		global.srank = 38000;
		break;
}
global.arank = floor(global.srank / 2);
global.brank = floor(global.arank / 2);
global.crank = floor(global.brank / 2);
if room == custom_lvl_room
	alarm[1] = 4;
