if sprite_index != spr_newclothes && sprite_index != spr_newclothesN
{
	lang_draw_sprite(sprite_index, image_index, x, y);
	draw_sprite(achievement_spr, achievement_index, x, y - 80);
}
else
{
	shader_set(global.Pal_Shader);
	if texture != -4
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, texture, true);
	pal_swap_set(spr_palette, paletteselect, false);
	lang_draw_sprite(sprite_index, image_index, x, y);
	if texture != -4
		pattern_reset();
	reset_shader_fix();
}
