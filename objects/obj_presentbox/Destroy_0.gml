if (ds_list_find_index(global.baddieroom, id) == -1)
{
	instance_create(x, y, obj_bombexplosion);
	global.miniboss = false;
	ds_list_add(global.baddieroom, id);
	instance_destroy(obj_baddiespawner);
	instance_destroy(obj_doorblocked);
	instance_destroy(obj_iceblockminiboss);
}
