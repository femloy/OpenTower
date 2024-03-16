if state != states.transition && state != states.actor
	draw_self();
else if state == states.transition
{
	draw_set_alpha(orangealpha);
	with playerid
	{
		shader_set(shd_firemouth_afterimage);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		shader_reset();
	}
	draw_set_alpha(1);
	with obj_firemouthflame
		draw_self();
}
else if state == states.actor
{
	draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + SCREEN_WIDTH, camera_get_view_y(view_camera[0]) + SCREEN_HEIGHT, c_white, c_white, c_white, c_white, false);
	with playerid
	{
		shader_set(global.Pal_Shader);
		var ps = paletteselect;
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, xscale, image_yscale, global.palettetexture);
		pal_swap_set(spr_palette, ps, false);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		if global.noisejetpack
		{
			pal_swap_set(spr_palette, 2, false);
			draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
		pattern_reset();
		shader_reset();
	}
	with obj_firemouthflame
		draw_self();
}
