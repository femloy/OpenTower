if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x, y, obj_car_dead))
	{
		vsp = -5;
		hsp = other.hsp * 34;
	}
	if (instance_exists(inst))
		instance_destroy(inst);
	ds_list_add(global.saveroom, id);
}
