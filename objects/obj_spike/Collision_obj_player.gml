if (other.state != states.barrel)
{
	scr_hurtplayer(other);
	if (fake)
		instance_destroy();
}
else
{
	with (other)
	{
		state = states.bump;
		sprite_index = spr_bump;
		image_index = 0;
		hsp = -6 * xscale;
		vsp = -4;
		repeat (3)
			create_debris(x, y, spr_wooddebris);
	}
}
