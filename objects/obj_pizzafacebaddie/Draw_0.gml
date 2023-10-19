if (usepalette)
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_palette, paletteselect, false);
}
draw_sprite_ext(sprite_index, image_index, x, y + 25, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (usepalette)
	shader_reset();
