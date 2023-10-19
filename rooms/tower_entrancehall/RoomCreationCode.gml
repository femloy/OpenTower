pal_swap_init_system(shd_pal_swapper);
global.roommessage = lang_get_value("room_towerentrance");
global.door_sprite = spr_door;
global.door_index = 0;
global.gameframe_caption_text = "Welcome to the Pizza Tower!";
with (obj_player1)
{
	if (targetDoor == "C")
	{
		targetDoor = "HUB";
		verticalhallway = false;
		backtohubstartx = obj_doorC.x + 32;
		backtohubstarty = obj_doorC.y - 14;
		x = backtohubstartx;
		y = backtohubstarty - (obj_screensizer.actual_height * 2);
		state = states.backtohub;
		sprite_index = spr_slipbanan1;
		image_index = 10;
	}
}
