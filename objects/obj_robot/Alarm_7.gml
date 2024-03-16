alarm[7] = 10;
if (state == states.mach1 || state == states.pizzagoblinthrow || state == states.tackle || state == states.slap)
{
	with (create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
	{
		if other.state != states.pizzagoblinthrow && other.state != states.slap
			playerid = other.id;
	}
}
