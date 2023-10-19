if (!ds_list_empty(global.debris_list))
{
	for (var i = 0; i < ds_list_size(global.debris_list); i++)
	{
		var q = ds_list_find_value(global.debris_list, i);
		if (is_struct(q))
			q = undefined;
	}
}
ds_list_clear(global.debris_list);
part_particles_clear(global.particle_system);
