var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
if (sprite_index == spr_menutv1_confirmN || sprite_index == spr_menutv1_selectedN || sprite_index == spr_menutv2_confirmN || sprite_index == spr_menutv2_selectedN || sprite_index == spr_menutv3_confirmN || sprite_index == spr_menutv3_selectedN)
{
	shader_set(global.Pal_Shader);
	var game = global.gameN[obj_mainmenu.currentselect];
	var pal = game.palette;
	var tex = game.palettetexture;
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, tex);
	pal_swap_set(spr_noisepalette, pal, false);
	draw_self();
	pattern_reset();
	shader_reset();
}
else
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_menutv_palette, obj_mainmenu.shownoise ? 1 : 0, false);
	draw_sprite(sprite_index, image_index, x, y);
	shader_reset();
}
