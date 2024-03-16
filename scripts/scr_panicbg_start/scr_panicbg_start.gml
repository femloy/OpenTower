function scr_panicbg_start()
{
	if (!variable_global_exists("panicbg_surface") || !surface_exists(global.panicbg_surface))
		global.panicbg_surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	if event_type == ev_draw && event_number == 0
	{
		surface_set_target(global.panicbg_surface);
		draw_clear_alpha(0, 0);
		var _cam_x = camera_get_view_x(view_camera[0]);
		var _cam_y = camera_get_view_y(view_camera[0]);
		var bg1 = layer_get_id("Backgrounds_1");
		var bg2 = layer_get_id("Backgrounds_2");
		var bg3 = layer_get_id("Backgrounds_3");
		layer_x(bg1, layer_get_x(bg1) - _cam_x);
		layer_y(bg1, layer_get_y(bg1) - _cam_y);
		layer_x(bg2, layer_get_x(bg2) - _cam_x);
		layer_y(bg2, layer_get_y(bg2) - _cam_y);
		layer_x(bg3, layer_get_x(bg3) - _cam_x);
		layer_y(bg3, layer_get_y(bg3) - _cam_y);
	}
}
