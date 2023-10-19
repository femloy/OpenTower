if (ds_list_find_index(global.saveroom, id) == -1)
{
	for (var i = 0; i < ds_list_size(deactivatedlist); i++)
	{
		var _id = ds_list_find_value(deactivatedlist, i);
		instance_activate_object(_id);
	}
	activated = true;
}
