function tdp_text_commit(x, y, w, h, gui = true)
{
	if global.tdp_text_enabled && !ds_queue_empty(global.tdp_text_queue)
	{
		draw_set_alpha(1);
		if !surface_exists(global.tdp_text_surface)
			global.tdp_text_surface = surface_create(w, h);
		
		surface_set_target(global.tdp_text_surface);
		draw_clear_alpha(0, 0);
		while !ds_queue_empty(global.tdp_text_queue)
		{
			var action = ds_queue_dequeue(global.tdp_text_queue);
			switch action.type
			{
				case 0:
					draw_set_halign(action.value);
					break;
				case 1:
					draw_set_valign(action.value);
					break;
				case 3:
					draw_set_font(action.value);
					break;
				case 2:
					draw_text_color(action.x - x, action.y - y, action.text, action.c1, action.c2, action.c3, action.c4, action.image_alpha);
					break;
			}
		}
		surface_reset_target();
		shader_set(shd_outline);
		var _tex = surface_get_texture(global.tdp_text_surface);
		var _w = texture_get_texel_width(_tex);
		var _h = texture_get_texel_height(_tex);
		shader_set_uniform_f(global.tdp_text_shd_size, _w, _h);
		shader_set_uniform_f(global.tdp_text_shd_color, 0, 0, 0);
		var uvs = texture_get_uvs(_tex);
		shader_set_uniform_f(global.tdp_text_shd_uvs, uvs[0], uvs[1], uvs[2], uvs[3]);
		draw_surface(global.tdp_text_surface, x, y);
		if gui
			reset_shader_fix();
		else
			shader_reset();
	}
}
