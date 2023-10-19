if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = other.sprite_index;
		image_index = other.image_index;
	}
	ds_list_add(global.saveroom, id);
}
