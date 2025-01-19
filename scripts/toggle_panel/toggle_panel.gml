function toggle_panel(_id)
{
	var _closed = false;
	with obj_panel
	{
		if (ID == _id && state == editor_panel_states.docked)
			_closed = true;
	}
	if _closed
	{
		with obj_panel
		{
			if ID == _id
				state = editor_panel_states.undocked
			else if ID != -4
				state = editor_panel_states.docked
		}
	}
	else
	{
		with obj_panel
		{
			if ID != -4
				state = editor_panel_states.docked
		}
	}
}
