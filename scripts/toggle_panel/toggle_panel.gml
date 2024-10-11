function toggle_panel(_id)
{
	var _closed = false;
	with obj_panel
	{
		if (ID == _id && state == comp_state.docked)
			_closed = true;
	}
	if _closed
	{
		with obj_panel
		{
			if ID == _id
				state = comp_state.undocked
			else if ID != -4
				state = comp_state.docked
		}
	}
	else
	{
		with obj_panel
		{
			if ID != -4
				state = comp_state.docked
		}
	}
}
