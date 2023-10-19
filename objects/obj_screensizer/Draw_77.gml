if (app_scale <= 0)
	exit;
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
draw_set_color(c_white);
if (frac(app_scale) > 0 && global.option_texfilter)
	gpu_set_texfilter(true);
else
	gpu_set_texfilter(false);
draw_rectangle_color(-100, -100, savedwidth + 100, savedheight + 100, 0, 0, 0, 0, false);
gpu_set_blendenable(false);
draw_surface_ext(application_surface, (savedwidth / 2) - ((surface_get_width(application_surface) * app_scale) / 2), (savedheight / 2) - ((surface_get_height(application_surface) * app_scale) / 2), app_scale, app_scale, 0, c_white, 1);
gpu_set_blendenable(true);
gpu_set_texfilter(false);
