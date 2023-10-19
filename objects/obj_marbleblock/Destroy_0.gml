if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x + 32, y + 32, obj_sausageman_dead))
		sprite_index = spr_harddoughblockdead;
	scr_sleep(5);
	instance_create(x + 32, y + 32, obj_bangeffect);
	tile_layer_delete_at(1, x, y);
	tile_layer_delete_at(1, x + 32, y);
	tile_layer_delete_at(1, x + 32, y + 32);
	tile_layer_delete_at(1, x, y + 32);
	with (obj_camera)
	{
		shake_mag = 20;
		shake_mag_acc = 40 / room_speed;
	}
	GamepadSetVibration(playerindex, 1, 1, 0.8);
	fmod_event_one_shot_3d("event:/sfx/misc/breakmetal", x, y);
	ds_list_add(global.saveroom, id);
}
depth = 1;
