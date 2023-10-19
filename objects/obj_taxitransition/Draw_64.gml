if (start)
{
	draw_sprite(bgsprite, bgindex, 0, 0);
	shader_set(global.Pal_Shader);
	var cy = irandom_range(-shake_mag, shake_mag);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, 1, 1, global.palettetexture);
	if (sprite_index != spr_taxitransition_gus)
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	else
		pal_swap_set(spr_ratmountpalette, obj_player1.paletteselect, false);
	draw_sprite(sprite_index, image_index, 0, cy);
	pattern_reset();
	reset_shader_fix();
}
draw_set_alpha(fade);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
