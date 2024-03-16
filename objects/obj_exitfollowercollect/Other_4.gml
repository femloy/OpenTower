if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
if !global.panic
	instance_destroy();
if global.exitrank
	instance_destroy();
