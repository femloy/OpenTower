if !active
{
	with obj_toxicspray
	{
		if (trigger == other.trigger && !instance_exists(cloudID))
		{
			with (instance_create(x + (image_xscale * 48), y, obj_toxiccloud))
			{
				spd = other.spd;
				hsp = other.image_xscale * spd;
				vsp = 0;
				other.cloudID = id;
			}
		}
	}
	active = true;
}
