if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x, y, obj_canonexplosion);
	ds_list_add(global.saveroom, id);
}
