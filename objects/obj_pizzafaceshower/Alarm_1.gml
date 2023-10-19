start = true;
if obj_player1.x > x
	instance_destroy();
ini_open_from_string(obj_savesystem.ini_str);
if ini_read_real("Game", "shower", false)
	instance_destroy();
ini_close();
