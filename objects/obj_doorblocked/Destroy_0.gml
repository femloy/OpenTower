if (ds_list_find_index(global.baddieroom, id) == -1)
{
	instance_create(x, y, obj_bombexplosion);
	repeat 6
		instance_create(x, y, obj_wooddebris);
	ds_list_add(global.baddieroom, id);
}
