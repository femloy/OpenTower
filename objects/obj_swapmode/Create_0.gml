image_speed = 0;
ini_open_from_string(obj_savesystem.ini_str_options);
if ini_read_real("Game", "swapunlocked", 0) == 0
	instance_destroy();
ini_close();
