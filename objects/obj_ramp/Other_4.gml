if (ds_list_find_index(global.saveroom, id) != -1)
	used = true;
if (ds_list_find_index(global.baddieroom, id) != -1)
	instance_destroy(id, false);
