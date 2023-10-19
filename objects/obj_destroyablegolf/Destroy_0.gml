if (room == custom_lvl_room)
	tile_layer_delete_at(1, x, y);
if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x + 16, y + 16, obj_sausageman_dead))
		sprite_index = spr_doughblockdead;
	scr_sleep(5);
	tile_layer_delete_at(1, x, y);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
}
