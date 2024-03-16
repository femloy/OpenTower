function scr_hub_bg_init(parallax_multiplier = 1)
{
	bgsprite = spr_gate_entranceBG;
	bgsprite_number = sprite_get_number(bgsprite);
	bgsprite_width = sprite_get_width(bgsprite);
	bgsprite_height = sprite_get_height(bgsprite);
	bgspritepos = 0;
	bgspriteposstart = 0;
	bgalpha = 1;
	bg_useparallax = false;
	bgparallax = [0.65 * parallax_multiplier, 0.75 * parallax_multiplier, 0.85 * parallax_multiplier];
	bgparallax2 = [0.1 * parallax_multiplier, 0.15 * parallax_multiplier, 0.2 * parallax_multiplier];
	bgmask_surface = -4;
	bgclip_surface = -4;
}
function scr_hub_bg_reinit(xoffset, yoffset)
{
	bgsprite_number = sprite_get_number(bgsprite);
	bgsprite_width = sprite_get_width(bgsprite);
	bgsprite_height = sprite_get_height(bgsprite);
	for (var i = 0; i < bgsprite_number; i++)
	{
		bgspritepos[i] = 0;
		if bg_useparallax
		{
			var p = bgparallax2[i];
			bgspriteposstart[i] = [xoffset - (xoffset * p) - ((SCREEN_WIDTH / 4) * p), yoffset - (yoffset * p) - ((SCREEN_HEIGHT / 4) * p)];
			bgspritepos[i] = [bgspriteposstart[i][0], bgspriteposstart[i][1]];
		}
	}
}
function scr_hub_bg_step()
{
	for (var i = 0; i < array_length(bgspritepos); i++)
	{
		if !bg_useparallax
		{
			bgspritepos[i] -= bgparallax[i];
			if (bgspritepos[i] <= -(bgsprite_width + bgparallax[i]))
				bgspritepos[i] = frac(bgspritepos[i]);
		}
		else
		{
			var p = bgparallax2[i];
			bgspritepos[i][0] = bgspriteposstart[i][0] + ((camera_get_view_x(view_camera[0]) + (SCREEN_WIDTH / 2)) * p) + ((SCREEN_WIDTH / 5) * p);
			bgspritepos[i][1] = bgspriteposstart[i][1] + ((camera_get_view_y(view_camera[0]) + (SCREEN_HEIGHT / 2)) * p);
		}
	}
}
function scr_hub_bg_draw(x, y, sprite, frame, gui = false)
{
	if bgalpha < 1
	{
		var w = sprite_get_width(sprite);
		var h = sprite_get_height(sprite);
		var x1 = sprite_get_xoffset(sprite);
		var y1 = sprite_get_yoffset(sprite);
		if (!surface_exists(bgmask_surface))
		{
			bgmask_surface = surface_create(w, h);
			surface_set_target(bgmask_surface);
			draw_clear(0);
			gpu_set_blendmode(bm_subtract);
			draw_sprite(sprite, frame, x1, y1);
			if !gui
				gpu_set_blendmode(bm_normal);
			else
				reset_blendmode();
			surface_reset_target();
		}
		if (!surface_exists(bgclip_surface))
			bgclip_surface = surface_create(w, h);
		surface_set_target(bgclip_surface);
		draw_clear_alpha(0, 0);
		for (var i = 0; i < array_length(bgspritepos); i++)
		{
			if !bg_useparallax
			{
				var b = bgspritepos[i];
				draw_sprite_tiled(bgsprite, i, b, h);
			}
			else
			{
				var bx = bgspritepos[i][0];
				var by = bgspritepos[i][1];
				draw_sprite_tiled(bgsprite, i, bx - x, (by + h) - y);
			}
		}
		gpu_set_blendmode(bm_subtract);
		draw_surface(bgmask_surface, 0, 0);
		if !gui
			gpu_set_blendmode(bm_normal);
		else
			reset_blendmode();
		surface_reset_target();
		draw_surface(bgclip_surface, x - x1, y - y1);
	}
	if bgalpha > 0
		draw_sprite_ext(sprite, frame, x, y, image_xscale, image_yscale, image_angle, image_blend, bgalpha);
}
