if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	instance_create(x, y, obj_ratrunaway);
}
