ini_open_from_string(obj_savesystem.ini_str);
if (ini_read_real("w1stick", "door", false))
	instance_destroy();
ini_close();
