if (debris)
{
	with (instance_create(x, y, obj_rancherbullet_debris))
	{
		image_xscale = other.image_xscale;
		vsp = random_range(-3, -6);
		hsp = -image_xscale * 4;
	}
}
