if gui && visible
{
	pal_swap_set(spr_palette, paletteselect, false);
	var b = image_blend;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha);
}
