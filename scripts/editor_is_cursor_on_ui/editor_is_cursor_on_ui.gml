function editor_is_cursor_on_ui(_x, _y)
{
	var num = instance_place_list(_x, _y, obj_uiparent, global.instancelist, false);
	var found = false;
	for (var i = 0; i < num; i++)
	{
		with (ds_list_find_value(global.instancelist, i))
		{
			if active
			{
				found = true;
				break;
			}
		}
	}
	ds_list_clear(global.instancelist);
	return found;
}
