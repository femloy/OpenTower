with (obj_pepperman)
{
	if (wastedhits == other.number && other.created == 0)
	{
		instance_destroy(obj_pepper_marbleblock);
		with (other)
		{
			with (instance_create(x, -85, obj_pepper_marbleblock))
			{
				image_xscale = other.image_xscale;
				number = other.number;
			}
			created = true;
		}
	}
}
