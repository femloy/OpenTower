alarm[5] = 12;
if (abs(hsp) != 0 || abs(vsp) != 0.5)
{
	with (create_blur_afterimage(x - (sign(hsp) * 6), y, sprite_index, image_index, image_xscale))
	{
		alpha = 0.15;
		spd = 0.003;
	}
}
