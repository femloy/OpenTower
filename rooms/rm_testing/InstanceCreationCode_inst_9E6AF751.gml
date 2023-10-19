trigger = 3;
stepfunc = function()
{
	active = false;
	if (place_meeting(x, y, obj_baddie))
		active = true;
	with (obj_player)
	{
		if (state == states.grabbing && place_meeting(x, y, other))
			other.active = true;
	}
};
