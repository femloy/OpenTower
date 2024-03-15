function scr_unlock_swap()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	if (ini_read_real("Game", "swapmode", 0) == 0)
	{
		instance_create(0, 0, obj_swapunlocked);
		ini_write_real("Game", "swapmode", 1);
		obj_savesystem.ini_str_options = ini_close();
		gamesave_async_save_options();
	}
	else
		ini_close();
}
