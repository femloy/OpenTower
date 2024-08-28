pal_swap_init_system(shd_pal_swapper)
global.roommessage = lang_get_value("room_tower4")
if (global.panic == 0)
	gameframe_caption_text = lang_get_value("caption_tower4")
if global.panic
{
	with (obj_door)
		instance_create((x + 50), (y + 96), obj_rubble)
	with (obj_bossdoor)
		instance_create((x + 50), (y + 96), obj_rubble)
	instance_destroy(obj_door)
	instance_destroy(obj_bossdoor)
}
global.door_sprite = spr_door
global.door_index = 3
scr_random_granny()
