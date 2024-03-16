while (ds_queue_size(hitqueue) > 0)
{
	var colarr = ds_queue_dequeue(hitqueue);
	var obj = colarr[0];
	var index = colarr[1];
	var func = ds_map_find_value(collision_function, index);
	if (!is_undefined(func) && ds_list_find_index(hitlist, obj) == -1)
	{
		if func(obj)
			ds_list_add(hitlist, obj);
	}
	if destroy
	{
		instance_destroy();
		break;
	}
	if (!instance_exists(id))
		break;
}
