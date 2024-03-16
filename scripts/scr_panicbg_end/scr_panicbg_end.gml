function scr_panicbg_end()
{
	if event_type == ev_draw && event_number == 0
	{
		surface_reset_target();
		shader_set(shd_panicbg);
		var panic_id = shader_get_uniform(shd_panicbg, "panic");
		shader_set_uniform_f(panic_id, global.wave / global.maxwave);
		var time_id = shader_get_uniform(shd_panicbg, "time");
		shader_set_uniform_f(time_id, current_time / 1000);
		draw_surface(global.panicbg_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
		shader_reset();
	}
}
