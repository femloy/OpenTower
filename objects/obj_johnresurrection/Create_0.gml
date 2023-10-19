treasure = true;
var levels = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "minigolf", "space", "sewer", "industrial", "street", "freezer", "chateau", "kidsparty", "war"];
ini_open_from_string(obj_savesystem.ini_str);
for (var i = 0; i < array_length(levels); i++)
{
	if (!ini_read_real("Treasure", levels[i], false))
	{
		treasure = false;
		break;
	}
}
ini_write_real("Game", "john", treasure);
obj_savesystem.ini_str = ini_close();
global.johnresurrection = treasure;
if (treasure)
	notification_push(notifs.johnresurrection, []);
depth = -600;
state = 0; // not an enum
fadein = false;
fade = 0;
treasure_dir = -1;
treasure_index = 0;
whitefade = 1;
snd = fmod_event_create_instance("event:/sfx/ending/johnending");
