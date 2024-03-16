if (!ds_list_empty(global.debris_list))
{
	for (var i = 0; i < ds_list_size(global.debris_list); i++)
	{
		var q = ds_list_find_value(global.debris_list, i);
		if (is_struct(q))
		{
			with q
			{
				if vsp < 20
					vsp += grav;
				if type == part_type.fadeout
				{
					vsp = 0;
					alpha -= 0.05;
				}
				x += hsp;
				y += vsp;
				var _destroy = false;
				if animated
				{
					if image_index > image_number - 1
					{
						image_index = frac(image_index);
						if destroyonanimation
							_destroy = true;
					}
					image_index += image_speed;
				}
				var outofx = x > (room_width + sprw) || x < -sprw;
				var outofy = y > (room_height + sprh) || y < -sprh;
				if (outofx || outofy || (type == part_type.fadeout && alpha <= 0))
					_destroy = true;
				if _destroy
				{
					ds_list_delete(global.debris_list, i);
					i--;
					delete q;
				}
				else
				{
					
				}
			}
		}
	}
}
if (!ds_list_empty(global.collect_list))
{
	for (i = 0; i < ds_list_size(global.collect_list); i++)
	{
		var b = ds_list_find_value(global.collect_list, i);
		if (is_struct(b))
		{
			with b
			{
				var _dir = point_direction(x, y, 110, 80);
				hsp = lengthdir_x(25, _dir);
				vsp = lengthdir_y(25, _dir);
				x += hsp;
				y += vsp;
				image_index += 0.35;
				if image_index > image_number - 1
					image_index = frac(image_index);
				outofx = x < 140;
				outofy = y < 120;
				if outofx && outofy
				{
					with obj_camera
						collect_shake += 10;
					ds_list_delete(global.collect_list, i);
					i--;
					delete b;
				}
				else
				{
					
				}
			}
		}
	}
}
