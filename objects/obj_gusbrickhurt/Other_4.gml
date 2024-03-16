ini_open_from_string(obj_savesystem.ini_str);
if (ini_read_real("w3stick", "door", false) || ini_read_real("Highscore", "forest", 0) > 0)
	instance_destroy();
ini_close();
if global.panic == true
	instance_destroy();
if !obj_player1.ispeppino && !global.swapmode
	instance_destroy();
