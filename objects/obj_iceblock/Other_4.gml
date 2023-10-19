with (obj_collect)
{
	if (place_meeting(x, y, other))
	{
		image_speed = 0;
		image_alpha = 0.5;
	}
}
if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
