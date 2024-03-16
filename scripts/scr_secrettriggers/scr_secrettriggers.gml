function secret_add(create_func, func)
{
	with obj_secretmanager
	{
		ds_list_add(secrettriggers, [func]);
		if create_func != -4
			method(id, create_func)();
	}
}
function secret_add_touchall(room, trigger, touchallID)
{
	with obj_secretmanager
		ds_list_add(touchall, [room, trigger, touchallID]);
}
function secret_add_touchall_requirement(idx, trigger)
{
	touchrequirement[idx] = [trigger, false];
}
function secret_check_touchall()
{
	if (touchrequirement != -4 && is_array(touchrequirement))
	{
		for (var xx = 0; xx < array_length(touchrequirement); xx++)
		{
			var t = 0;
			for (var i = 0; i < ds_list_size(touchall); i++)
			{
				var b = ds_list_find_value(touchall, i);
				if b[1] == xx
					t++;
			}
			if t == touchrequirement[xx][0]
				touchrequirement[xx][1] = true;
		}
		b = true;
		for (i = 0; i < array_length(touchrequirement); i++)
		{
			if !touchrequirement[i][1]
			{
				b = false;
				break;
			}
		}
		if b
			return true;
	}
	return false;
}
function secret_check_trigger(secret_trigger)
{
	var _found = false;
	with obj_secrettrigger
	{
		if trigger == secret_trigger && active
			_found = true;
	}
	if _found
		trace({found: _found});
	return _found;
}
function secret_open_portal(secret_trigger)
{
	with obj_secretportal
	{
		if (trigger == secret_trigger && ds_list_find_index(global.saveroom, id) == -1 && !place_meeting(x, y, obj_marbleblock) && !place_meeting(x, y, obj_secretblock) && !place_meeting(x, y, obj_secretbigblock) && !place_meeting(x, y, obj_secretmetalblock) && !place_meeting(x, y, obj_secretdestroyable))
			active = true;
	}
}
function secret_close_portal(secret_trigger, fast = false)
{
	with obj_secretportal
	{
		if trigger == secret_trigger && sprite_index != spr_secretportal_close
		{
			sprite_index = spr_secretportal_close;
			if !fast
				image_index = 0;
			else
				image_index = 14;
			active = false;
		}
	}
}
function secret_close_portalID(portalID)
{
	with portalID
	{
		sprite_index = spr_secretportal_close;
		image_index = 14;
		active = false;
	}
}
