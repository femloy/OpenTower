shader_set(global.Pal_Shader);
var pal = spr_ratmountpalette;
if !obj_player1.ispeppino
	pal = obj_player1.spr_palette;
if (sprite_index == switchend && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != states.fall)
{
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(pal, obj_player1.paletteselect, false);
	draw_sprite_ext(switchstart, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else if visible
{
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(pal, obj_player1.paletteselect, false);
	draw_self();
}
pattern_reset();
shader_reset();
