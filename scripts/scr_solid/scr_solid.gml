function scr_solid(_x, _y)
{
	var old_x = x;
	var old_y = y;
	x = _x;
	y = _y;
	if (place_meeting(x, y, obj_solid))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	if (y > old_y && place_meeting(x, y, obj_platform))
	{
		var num = instance_place_list(x, y, obj_platform, global.instancelist, false);
		var _collided = false;
		for (var i = 0; i < num; i++)
		{
			var b = ds_list_find_value(global.instancelist, i);
			if (id != b.id && !place_meeting(x, old_y, b) && place_meeting(x, y, b))
				_collided = true;
		}
		ds_list_clear(global.instancelist);
		if _collided
		{
			x = old_x;
			y = old_y;
			return true;
		}
	}
	if (check_slope(obj_slope))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	x = old_x;
	y = old_y;
	return false;
}
function check_slope(slope_object)
{
	var slope = instance_place(x, y, slope_object);
	if slope
	{
		with slope
		{
			var object_side = 0;
			var slope_start = 0;
			var slope_end = 0;
			if image_xscale > 0
			{
				object_side = other.bbox_right;
				slope_start = bbox_bottom;
				slope_end = bbox_top;
			}
			else
			{
				object_side = other.bbox_left;
				slope_start = bbox_top;
				slope_end = bbox_bottom;
			}
			var m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
			slope = slope_start - round(m * (object_side - bbox_left));
			if other.bbox_bottom >= slope
			{
				return true;
			}
		}
	}
	return false;
}
function scr_solid_slope(_x, _y)
{
	var old_x = x;
	var old_y = y;
	x = _x;
	y = _y;
	if (check_slope(obj_slope))
	{
		var inst = instance_place(x, y, obj_slope);
		if (sign(inst.image_xscale) != xscale)
		{
			x = old_x;
			y = old_y;
			return true;
		}
	}
	x = old_x;
	y = old_y;
	return false;
}
