if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
if (global.level_minutes > timer)
{
	ds_list_add(global.saveroom, id);
	instance_destroy();
}
