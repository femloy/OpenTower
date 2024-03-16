if global.panic
{
	instance_destroy();
	instance_create(x, y + 144, obj_rubble);
	exit;
}
switch targetRoom
{
	case entrance_1:
	case medieval_1:
	case ruin_1:
	case dungeon_1:
		world = 1
		break
	case desert_1:
	case graveyard_1:
	case farm_1:
	case ufo_1:
		world = 2
		break
	case beach_1:
	case forest_1:
	case minigolf_1:
		world = 3
		break
	case space_1:
	case city_1:
	case sewer_1:
	case war_1:
		world = 4
		break
	case factory_1:
	case freezer_1:
	case mansion_1:
	case kidsparty_entrance1:
		world = 5
		break
	case boss_pepperman:
		level = "b_pepperman"
		break
	case boss_vigilante:
		level = "b_vigilante"
		break
	case boss_noise:
		level = "b_noise"
		break
	case boss_fakepep:
		level = "b_fakepep"
		break
	case boss_pizzaface:
		level = "b_pizzaface"
		break
}
if (targetRoom == boss_pepperman || targetRoom == boss_vigilante || targetRoom == boss_noise || targetRoom == boss_fakepep)
	boss = true;
if object_index != obj_bossdoor
{
	var old_y = y;
	if (scr_solid(x, y))
	{
		while (scr_solid(x, y))
		{
			y--;
			if y < sprite_height
			{
				y = old_y;
				break;
			}
		}
	}
}
ini_open_from_string(obj_savesystem.ini_str);
highscore = ini_read_real("Highscore", string(level), 0);
hats = ini_read_real("Hats", string(level), 0);
secret_count = ini_read_string("Secret", string(level), 0);
toppin[0] = ini_read_real("Toppin", string(level) + "1", 0);
toppin[1] = ini_read_real("Toppin", string(level) + "2", 0);
toppin[2] = ini_read_real("Toppin", string(level) + "3", 0);
toppin[3] = ini_read_real("Toppin", string(level) + "4", 0);
toppin[4] = ini_read_real("Toppin", string(level) + "5", 0);
rank = ini_read_string("Ranks", string(level), "d");
ini_close();
var _toppinspr = [
	[spr_toppinshroom, spr_toppinshroom_run, spr_toppinshroom_taunt, -75],
	[spr_toppincheese, spr_toppincheese_run, spr_toppincheese_taunt, -35],
	[spr_toppintomato, spr_toppintomato_run, spr_toppintomato_taunt, 0],
	[spr_toppinsausage, spr_toppinsausage_run, spr_toppinsausage_taunt, 35],
	[spr_toppinpineapple, spr_toppinpineapple_run, spr_toppinpineapple_taunt, 75]
];
for (var i = 0; i < array_length(_toppinspr); i++)
{
	var b = _toppinspr[i];
	if toppin[i]
	{
		with (instance_create(x + b[3], y + 100, obj_toppinprop))
		{
			tauntspr = b[2];
			movespr = b[1];
			idlespr = b[0];
			if (place_meeting(x, y, obj_platform))
				y -= 2;
		}
	}
}
if object_index == obj_startgate && level != "exit" && level != "tutorial" && level != "secretworld"
{
	for (i = 1; i <= 3; i++)
	{
		b = true;
		if i > secret_count
			b = false;
		with (instance_create(x, y, obj_startgate_secreteye))
		{
			last_current_time = current_time + (600000 * i * 2);
			timer = last_current_time;
			trace(other.level, " secret eye ", i, timer);
			time_x += (i - 1);
			time_y += ((i - 1) * 2);
			if b
				sprite_index = spr_gatesecreteyeopen;
			else
				sprite_index = spr_gatesecreteyeclosed;
		}
	}
}
switch level
{
	case "entrance":
		msg = "ENTRANCE";
		break;
	case "medieval":
		msg = "PIZZASCAPE";
		break;
	case "chateau":
		msg = "PIZZASCARE";
		break;
	case "ruin":
		msg = "TEH ANCIENT CHEESE";
		break;
	case "dungeon":
		msg = "BLOODSAUCE DUNGEON";
		break;
	case "floorroom":
		msg = "OREGANO DESERT";
		break;
	case "graveyard":
		msg = "THE WASTEYARD";
		break;
	case "farm":
		msg = "FUN FARM";
		break;
	case "ufo":
		msg = "SPACE PINBALL";
		break;
	case "strongcold":
		msg = "STRONGCOLD";
		break;
	case "forest":
		msg = "GNOME FOREST";
		break;
	case "beach":
		msg = "PINEAPPLE BEACH";
		break;
	case "dragonlair":
		msg = "DRAGON LAIR";
		break;
	case "snickchallenge":
		msg = "SNICK CHALLENGE";
		break;
}
scr_hub_bg_reinit(x, y);
