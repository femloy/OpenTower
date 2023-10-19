repeat (8)
{
	with (create_debris(x + random_range(0, 64), y + random_range(0, 64), spr_marbledebris, false))
	{
		hsp = random_range(-5, 5);
		vsp = random_range(-10, 10);
		image_speed = 0;
		image_index = random_range(0, image_number - 1);
	}
}
scr_sleep(5);
