if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
ini_open_from_string(obj_savesystem.ini_str);
if (ini_read_real("Highscore", global.leveltosave, 0) == 0 && !ini_read_real("Tutorial", "lapunlocked", false))
	sprite_index = spr_pizzaportal_outline;
ini_close();
