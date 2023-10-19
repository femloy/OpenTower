if (use_static)
	draw_sprite(spr_tvstatic, static_index, 0, 0);
else
{
	screen_clear(make_color_rgb(216, 104, 160));
	shader_set(global.Pal_Shader);
	var cx = obj_screensizer.normal_size_fix_x;
	var cy = obj_screensizer.normal_size_fix_y;
	draw_sprite(spr_technicaldifficulty_bg, 0, cx, cy);
	pattern_set(global.Base_Pattern_Color, sprite, 0, 1, 1, global.palettetexture);
	if (sprite != spr_technicaldifficulty4)
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	else
		pal_swap_set(spr_ratmountpalette, obj_player1.paletteselect, false);
	draw_sprite(sprite, 0, cx + 300, cy + 352);
	pattern_reset();
	reset_shader_fix();
}
