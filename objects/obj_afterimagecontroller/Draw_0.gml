for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	with b
	{
		if visible
		{
			b = image_blend;
			var a = other.alpha[identifier];
			var shd = false;
			
			if identifier == afterimage.firemouth
			{
				a = alpha;
				shd = true;
				shader_set(shd_color_afterimage);
				shader_set_uniform_f(other.shd_color_red, 0.97);
				shader_set_uniform_f(other.shd_color_green, 0.43);
				shader_set_uniform_f(other.shd_color_blue, 0.09);
			}
			else if identifier == afterimage.blue
			{
				a = alpha;
				shd = true;
				shader_set(shd_color_afterimage);
				shader_set_uniform_f(other.shd_color_red, 0.17);
				shader_set_uniform_f(other.shd_color_green, 0.49);
				shader_set_uniform_f(other.shd_color_blue, 0.9);
			}
			else if identifier == afterimage.enemy
			{
				a = alpha;
				shd = true;
				shader_set(shd_color_afterimage);
				shader_set_uniform_f(other.shd_color_red, (223 / 255));
				shader_set_uniform_f(other.shd_color_green, (47 / 255));
				shader_set_uniform_f(other.shd_color_blue, 0);
			}
			else if identifier == afterimage.fakepep
			{
				a = alpha;
				shd = true;
				shader_set(shd_color_afterimage);
				shader_set_uniform_f(other.shd_color_red, 1);
				shader_set_uniform_f(other.shd_color_green, 0);
				shader_set_uniform_f(other.shd_color_blue, 0);
			}
			else if identifier == afterimage.noise
			{
				a = alpha;
				shd = true;
				shader_set(shd_noise_afterimage);
				var pal = 1;
				if obj_player1.paletteselect == 0
					pal = 5;
				noise_aftimg_set_pal(obj_player1.spr_palette, obj_player1.paletteselect, pal);
				noise_aftimg_set_pattern(global.palettetexture, 0);
			}
			else if identifier == afterimage.blur
			{
				a = alpha;
				b = get_dark(other.image_blend, obj_drawcontroller.use_dark, true, x, y);
				if (instance_exists(playerid) && playerid.usepalette)
				{
					shd = true;
					shader_set(global.Pal_Shader);
					if playerid.object_index == obj_player1
						pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
					else if playerid.object_index == obj_swapmodegrab
						pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, playerid.patterntexture);
					pal_swap_set(playerid.spr_palette, playerid.paletteselect, false);
				}
			}
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, a);
			if shd
			{
				pattern_reset();
				shader_reset();
			}
		}
	}
}
