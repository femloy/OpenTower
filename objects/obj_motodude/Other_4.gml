var _destroyed = false;
if (ds_list_find_index(global.baddieroom, id) != -1)
{
	_destroyed = true;
	instance_destroy();
}
if (escape == 1 && !_destroyed)
{
	instance_deactivate_object(id);
	with (instance_create(x, y, obj_escapespawn))
		baddieID = other.id;
}
