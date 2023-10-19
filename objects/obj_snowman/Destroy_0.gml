if (ds_list_find_index(global.baddieroom, id) == -1)
{
	repeat (6)
	{
		with (instance_create(x, y, obj_sausageman_dead))
		{
			image_speed = 0;
			sprite_index = spr_newpizzice_gibs;
			image_index = random_range(0, image_number - 1);
		}
	}
}
event_inherited();
