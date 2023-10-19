shader_set(global.Pal_Shader);
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
var pal = obj_player1.paletteselect;
pal_swap_set(spr_peppalette, pal, false);
draw_self();
if (pal == 12 && clone)
{
	pal_swap_set(spr_peppalette, 13, false);
	draw_self();
}
pattern_reset();
shader_reset();
