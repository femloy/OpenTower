ds_list_destroy(deactivatedlist);
if (activated && ds_list_find_index(global.saveroom, id) == -1)
	ds_list_add(global.saveroom, id);
