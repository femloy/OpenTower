if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_destroy();
	instance_create(x, y, content);
	ds_list_add(global.saveroom, id);
}
