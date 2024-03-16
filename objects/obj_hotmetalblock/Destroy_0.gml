if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat 6
	{
		with (instance_create(x + 32, y + 32, obj_metaldebris))
			sprite_index = spr_supermetalblock_debris;
	}
	tile_layer_delete_at(1, x, y);
	tile_layer_delete_at(1, x + 32, y);
	tile_layer_delete_at(1, x + 32, y + 32);
	tile_layer_delete_at(1, x, y + 32);
	with obj_camera
	{
		shake_mag = 20;
		shake_mag_acc = 40 / room_speed;
	}
	fmod_event_one_shot("event:/sfx/misc/breakmetal");
	ds_list_add(global.saveroom, id);
}
depth = 1;
