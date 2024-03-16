static_index += (0.35 * static_dir);
if alarm[0] > 0
{
	with obj_player
	{
		state = states.actor;
		hsp = 0;
		vsp = 0;
	}
}
if use_static
{
	if (static_dir > 0 && floor(static_index) == (sprite_get_number(spr_tvstatic) - 1))
	{
		use_static = false;
		with obj_ghostfollow
		{
			x = xstart;
			y = ystart;
		}
	}
	else if static_dir < 0 && static_index <= 0
		instance_destroy();
}
