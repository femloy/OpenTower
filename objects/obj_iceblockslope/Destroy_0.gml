scr_destroy_tiles(32, "Tiles_1");
scr_destroy_tiles(32, "Tiles_2");
if (ds_list_find_index(global.saveroom, id) == -1)
	ds_list_add(global.saveroom, id);
