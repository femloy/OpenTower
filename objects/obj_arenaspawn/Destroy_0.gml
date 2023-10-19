ds_list_destroy(baddielist);
if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	global.kungfu = false;
}
