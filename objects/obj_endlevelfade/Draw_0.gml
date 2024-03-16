draw_set_alpha(fadealpha);
draw_set_color(c_white);
draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);
if (!instance_exists(obj_rank))
{
	shader_set(global.Pal_Shader);
	with obj_player
	{
		if object_index == obj_player1
			pattern_set(global.Base_Pattern_Color, sprite_index, image_index, xscale, yscale, global.palettetexture);
		pal_swap_set(spr_palette, paletteselect, false);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
	}
	pattern_reset();
	shader_reset();
}
