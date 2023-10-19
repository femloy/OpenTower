shader_set(global.Pal_Shader);
if (sprite_index == spr_peppinoswitch2 && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != states.fall)
{
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(spr_peppalette, obj_player1.paletteselect, false);
	draw_sprite_ext(spr_peppinoswitch1, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else if (visible)
{
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(spr_peppalette, obj_player1.paletteselect, false);
	draw_self();
}
shader_reset();
