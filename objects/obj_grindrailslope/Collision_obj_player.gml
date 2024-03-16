if ((other.y > other.yprevious || (other.xscale == sign(image_xscale) && other.y < bbox_bottom)) && other.state != states.backbreaker && other.state != states.bump)
{
	with other
	{
		if (!scr_transformationcheck())
			exit;
		while (place_meeting(x, y, obj_grindrailslope))
			y--;
	}
	if !other.isgustavo
	{
		if other.movespeed < 10
			other.movespeed = 10;
		other.state = states.grind;
	}
	else
	{
		other.y = y + 8;
		other.state = states.ratmountgrind;
	}
}
