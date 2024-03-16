alarm[0] = 5;
if !obj_drawcontroller.use_dark
{
	with (create_blur_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
	{
		image_angle = other.image_angle;
		image_yscale = other.image_yscale;
	}
}
