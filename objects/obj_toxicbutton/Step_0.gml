if (active)
{
	with (obj_toxicspray)
	{
		if (trigger == other.trigger && !instance_exists(cloudID))
		{
			cloudID = -4;
			other.active = 0;
		}
	}
}
image_index = active;
