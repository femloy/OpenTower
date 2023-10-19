if (instance_exists(baddieid))
{
	x = baddieid.x;
	y = baddieid.y;
	image_xscale = baddieid.image_xscale;
}
else
	instance_destroy();
