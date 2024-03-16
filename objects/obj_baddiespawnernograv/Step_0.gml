if (!instance_exists(baddieid))
	refresh--;
if refresh <= 0
{
	image_speed = 0.35;
	if (floor(image_index) == 5)
	{
		with (instance_create(x, y - 20, content))
		{
			if other.platformid != -4
				platformid = other.platformid;
			image_xscale = other.image_xscale;
			other.baddieid = id;
			important = true;
		}
		refresh = 100;
	}
}
