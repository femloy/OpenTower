if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
else
{
	var num = instance_place_list(x, y, obj_baddie, global.instancelist, false);
	for (var i = 0; i < num; i++)
	{
		var b = ds_list_find_value(global.instancelist, i);
		with (b)
		{
			secretjumped = false;
			savedsecretinvincible = invincible;
			state = states.secret;
		}
	}
	ds_list_clear(global.instancelist);
}
