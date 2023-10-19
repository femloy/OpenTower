if (grounded || scr_solid(x + 1, y) || scr_solid(x - 1, y))
{
	repeat (8)
	{
		with (create_debris(x, y + 20, spr_slimedebris))
		{
			vsp = random_range(-5, 0);
			hsp = random_range(-3, 3);
		}
	}
	instance_destroy();
}
scr_collide();
