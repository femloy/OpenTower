if (!ds_list_empty(global.baddietomb))
{
	var i = 0;
	repeat (ds_list_size(global.baddietomb))
	{
		var arr = ds_list_find_value(global.baddietomb, i);
		var tombRoom = arr[0];
		var X = arr[1];
		var Y = arr[2];
		if (!is_undefined(tombRoom) && !is_undefined(X) && !is_undefined(Y))
		{
			if room == tombRoom
			{
				with (instance_create(X, Y, obj_baddiegibsstick))
				{
					storedx = X;
					storedy = Y;
					collisioned = true;
					hsp = 0;
					vsp = 0;
					image_index = image_number - 1;
				}
			}
		}
		i++;
	}
}
