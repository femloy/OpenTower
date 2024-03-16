if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	instance_create_unique(0, 0, obj_deliverytimer);
	with obj_deliverytimer
	{
		minutes = other.minutes;
		seconds = other.seconds;
	}
}
