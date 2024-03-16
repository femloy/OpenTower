if (instance_exists(obj_monster))
{
	blockid = instance_create(x, y, obj_monstersolid);
	with blockid
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
}
