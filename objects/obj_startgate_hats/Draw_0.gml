var xx = -1;
var yy = -1;
shader_set(global.Pal_Shader);
for (var i = 0; i < array_length(hats_arr); i++)
{
	var x1 = x + (xx * 32);
	var y1 = y + (yy * 32);
	pal_swap_set(obj_player1.spr_palette, 1);
	draw_sprite_ext(sprite_index, image_index, x1, y1, 1, 1, 0, c_black, image_alpha);
	if i < hats
	{
		var y2 = y1 + hats_arr[i][1];
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, 1, 1, global.palettetexture);
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect);
		draw_sprite_ext(sprite_index, image_index, x1, y2, 1, 1, 0, c_white, image_alpha);
	}
	xx++;
	if xx >= 2
	{
		xx = -1;
		yy++;
	}
}
pattern_reset();
shader_reset();
if state > 0
{
	draw_set_font(global.smallnumber_fnt);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_color(x, y + 16, concat("+", extrahats), c_white, c_white, c_white, c_white, image_alpha);
	draw_sprite_ext(spr_ranks_hud, rank_index, x, y + 80, rank_scale, rank_scale, 0, c_white, image_alpha);
}
