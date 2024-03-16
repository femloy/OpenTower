ini_open_from_string(obj_savesystem.ini_str);
global.entrancetime = ini_read_string("Time", "entrance", "none");
global.medievaltime = ini_read_string("Time", "medieval", "none");
global.ruintime = ini_read_string("Time", "ruin", "none");
global.dungeontime = ini_read_string("Time", "dungeon", "none");
global.chateautime = ini_read_string("Time", "chateau", "none");
global.strongcoldtime = ini_read_string("Time", "strongcold", "none");
ini_close();
switch levelsign
{
	case "entrance":
		if global.entrancetime == "none"
			visible = false;
		else
			visible = true;
		if global.entrancetime == "s"
			image_index = 0;
		if global.entrancetime == "a"
			image_index = 1;
		if global.entrancetime == "b"
			image_index = 2;
		if global.entrancetime == "c"
			image_index = 3;
		if global.entrancetime == "d"
			image_index = 4;
		break;
	case "medieval":
		if global.medievaltime == "none"
			visible = false;
		else
			visible = true;
		if global.medievaltime == "s"
			image_index = 0;
		if global.medievaltime == "a"
			image_index = 1;
		if global.medievaltime == "b"
			image_index = 2;
		if global.medievaltime == "c"
			image_index = 3;
		if global.medievaltime == "d"
			image_index = 4;
		break;
	case "ruin":
		if global.ruintime == "none"
			visible = false;
		else
			visible = true;
		if global.ruintime == "s"
			image_index = 0;
		if global.ruintime == "a"
			image_index = 1;
		if global.ruintime == "b"
			image_index = 2;
		if global.ruintime == "c"
			image_index = 3;
		if global.ruintime == "d"
			image_index = 4;
		break;
	case "dungeon":
		if global.dungeontime == "none"
			visible = false;
		else
			visible = true;
		if global.dungeontime == "s"
			image_index = 0;
		if global.dungeontime == "a"
			image_index = 1;
		if global.dungeontime == "b"
			image_index = 2;
		if global.dungeontime == "c"
			image_index = 3;
		if global.dungeontime == "d"
			image_index = 4;
		break;
	case "chateau":
		if global.chateautime == "none"
			visible = false;
		else
			visible = true;
		if global.chateautime == "s"
			image_index = 0;
		if global.chateautime == "a"
			image_index = 1;
		if global.chateautime == "b"
			image_index = 2;
		if global.chateautime == "c"
			image_index = 3;
		if global.chateautime == "d"
			image_index = 4;
		break;
	case "strongcold":
		if global.strongcoldtime == "none"
			visible = false;
		else
			visible = true;
		if global.strongcoldtime == "s"
			image_index = 0;
		if global.strongcoldtime == "a"
			image_index = 1;
		if global.strongcoldtime == "b"
			image_index = 2;
		if global.strongcoldtime == "c"
			image_index = 3;
		if global.strongcoldtime == "d"
			image_index = 4;
		break;
}
