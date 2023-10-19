if (!instance_exists(baddieid))
	refresh--;
if (refresh <= 0)
{
	with (instance_create(x, y, content))
	{
		image_xscale = other.image_xscale;
		other.baddieid = id;
		defused = true;
		countdown = 50;
	}
	refresh = 20;
}
