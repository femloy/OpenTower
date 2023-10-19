if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(500, 154, obj_alienbyebye);
	ds_list_add(global.saveroom, id);
	ds_list_add(global.escaperoom, id);
}
