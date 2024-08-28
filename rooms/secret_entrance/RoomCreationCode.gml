pal_swap_init_system(shd_pal_swapper);
gameframe_caption_text = lang_get_value("caption_secret");
global.roommessage = lang_get_value("room_soundtest");
if (global.panic)
{
	with (obj_door)
		instance_create(x + 50, y + 96, obj_rubble);
	with (obj_bossdoor)
		instance_create(x + 50, y + 96, obj_rubble);
	instance_destroy(obj_door);
	instance_destroy(obj_bossdoor);
}
