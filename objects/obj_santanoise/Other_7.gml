if (ds_list_find_index(global.baddieroom, id) == -1)
{
	ds_list_add(global.baddieroom, id);
	instance_create(x, y, obj_bombexplosion);
	instance_destroy();
}
