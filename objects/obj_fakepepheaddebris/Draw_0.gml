shader_set(global.Pal_Shader);
var palinfo = get_pep_palette_info();
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, palinfo.patterntexture);
var pal = palinfo.paletteselect;
pal_swap_set(spr_peppalette, pal, false);
draw_self();
if clone
{
	pal_swap_set(spr_peppalette, 13, false);
	draw_self();
}
pattern_reset();
shader_reset();
