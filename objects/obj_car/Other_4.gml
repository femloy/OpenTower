if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
else
{
	inst = instance_create(x, y, obj_mach3solid);
	with (inst)
	{
		sprite_index = spr_car_solid;
		mask_index = spr_car_solid;
	}
}
