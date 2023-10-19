pal_swap_init_system(shd_pal_swapper);
global.gameframe_caption_text = "The Pizza Tower is collapsing!";
ini_open_from_string(obj_savesystem.ini_str);
if (ini_read_string("Game", "finalrank", "none") == "none")
	notification_push(notifs.firsttime_ending, [room]);
ini_close();
