function toggle_panel(_id)
{
	var _closed = false;
	with obj_panel
	{
		if (ID == _id && state == (1 << 0))
			_closed = true;
	}
	if _closed
	{
		with obj_panel
		{
			if ID == _id
				state = (0 << 0)
			else if ID != -4
				state = (1 << 0)
		}
	}
	else
	{
		with obj_panel
		{
			if ID != -4
				state = (1 << 0)
		}
	}
}

