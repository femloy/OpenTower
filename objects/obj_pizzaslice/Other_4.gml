if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
