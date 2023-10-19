for (var yy = 0; yy < abs(image_yscale); yy++)
{
	for (var xx = 0; xx < abs(image_xscale); xx++)
		draw_sprite_ext(sprite_index, image_index, xstart + (xx * 32), ystart + (yy * 32), 1, 1, 0, c_white, image_alpha);
}
