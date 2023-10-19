if (destroy)
{
	instance_create(x, y + 45, obj_bangeffect);
	repeat (4)
	{
		with (create_debris(x + random_range(-25, 25), y + random_range(-25, 25), spr_marbledebris, false))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
			depth = -599;
			image_speed = 0;
			image_index = random_range(0, image_number - 1);
		}
	}
}
