if !used
{
	active = place_meeting(x, y, obj_baddie);
	if active
	{
		with obj_baddiegate
		{
			if trigger == other.trigger
				active = !active;
		}
		used = true;
	}
}
image_index = active;
