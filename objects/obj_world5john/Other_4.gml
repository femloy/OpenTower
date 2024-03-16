if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
if !global.panic
	instance_destroy();
else
{
	layer_background_visible(bgid, false);
	ds_list_add(global.saveroom, id);
}
