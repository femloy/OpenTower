pal_swap_init_system(shd_pal_swapper);
gameframe_caption_text = lang_get_value("caption_ending");
ini_open_from_string(obj_savesystem.ini_str);
if (ini_read_string("Game", "finalrank", "none") == "none")
	notification_push(notifs.firsttime_ending, [room]);
ini_close();
