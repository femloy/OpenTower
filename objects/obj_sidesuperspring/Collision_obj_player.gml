with (other)
{
	if (state != states.gotoplayer)
	{
		if (state == states.bombpepside || state == states.motorcycle || state == states.slipnslide || state == states.rocket || state == states.grind || state == states.tumble || state == states.cheeseball || state == states.knightpepslopes || state == states.machroll || state == states.mach3 || state == states.mach2)
		{
			other.sprite_index = spr_sidespringblock_bounce;
			other.image_index = 0;
			if (xscale != other.image_xscale)
				xscale = other.image_xscale;
		}
	}
}
