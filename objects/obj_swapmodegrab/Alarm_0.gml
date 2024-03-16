alarm[0] = 2;
if state == states.normal
{
	with create_blur_afterimage(x, y, sprite_index, image_index - 1)
	{
		image_xscale = other.image_xscale;
		playerid = other.id;
	}
}
