function scr_solid_player(_x, _y)
{
	var old_x = x;
	var old_y = y;
	x = _x;
	y = _y;
	ds_list_clear(global.instancelist);
	var num = instance_place_list(x, y, obj_solid, global.instancelist, false);
	var _collided = false;
	for (var i = 0; i < num; i++)
	{
		var b = ds_list_find_value(global.instancelist, i);
		if (instance_exists(b))
		{
			switch b.object_index
			{
				case obj_ghostwall:
					if state != states.ghost
						_collided = true;
					break;
				case obj_mach3solid:
					if (state != states.mach3 && (state != states.machslide || sprite_index != spr_mach3boost) && (state != states.chainsaw || tauntstoredstate != states.mach3))
						_collided = true;
					break;
				default:
					_collided = true;
			}
			var par = object_get_parent(b.object_index);
		}
		if _collided
			break;
	}
	ds_list_clear(global.instancelist);
	if _collided
	{
		x = old_x;
		y = old_y;
		return true;
	}
	if (y > old_y && state != states.ladder && place_meeting(x, y, obj_platform))
	{
		ds_list_clear(global.instancelist);
		num = instance_place_list(x, y, obj_platform, global.instancelist, false);
		_collided = false;
		for (i = 0; i < num; i++)
		{
			b = ds_list_find_value(global.instancelist, i);
			if (!place_meeting(x, old_y, b) && place_meeting(x, y, b))
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
	if (y > old_y && state == states.grind && !place_meeting(x, old_y, obj_grindrail) && place_meeting(x, y, obj_grindrail))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	if (check_slope_player(obj_slope))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	if (state == states.grind && check_slope_player(obj_grindrailslope))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	x = old_x;
	y = old_y;
	return false;
}
function check_slope_player(slope_obj)
{
	var slope = instance_place(x, y, slope_obj);
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
				return true;
		}
	}
	return false;
}
