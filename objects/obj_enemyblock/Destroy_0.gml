if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat 7
		create_debris(x + 32, y + 32, spr_bigdebris);
	tile_layer_delete_at(1, x, y);
	tile_layer_delete_at(1, x + 32, y);
	tile_layer_delete_at(1, x + 32, y + 32);
	tile_layer_delete_at(1, x, y + 32);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
}
