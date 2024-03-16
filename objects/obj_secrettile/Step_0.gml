if (place_meeting(x, y, obj_player))
	active = true;
if active
{
	var b = true;
	with obj_player1
	{
		if (!place_meeting(x, y, obj_secrettile))
		{
			other.active = false;
			b = false;
		}
	}
	if b
	{
		with (instance_place(x + 1, y, obj_secrettile))
			active = true;
		with (instance_place(x - 1, y, obj_secrettile))
			active = true;
		with (instance_place(x, y + 1, obj_secrettile))
			active = true;
		with (instance_place(x, y - 1, obj_secrettile))
			active = true;
	}
	depth = -8;
	if depth < desireddepth
		depth = desireddepth;
	alpha = Approach(alpha, 0, 0.05);
}
else
{
	depth = desireddepth;
	alpha = Approach(alpha, 1, 0.05);
}
if (place_meeting(x, y, obj_baddie))
	depth = -30;
