active = place_meeting(x, y, obj_baddie);
if active != preactive
{
	var _alreadyactive = false;
	with obj_baddiebutton
	{
		if id != other.id && trigger == other.trigger
		{
			if active
				_alreadyactive = true;
		}
	}
	with obj_baddiegate
	{
		if (trigger == other.trigger && !(active && _alreadyactive))
			active = !active;
	}
	preactive = active;
}
image_index = active;
