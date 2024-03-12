function tdp_text_init()
{
	global.tdp_text_surface = -4;
	global.tdp_text_queue = ds_queue_create();
	global.tdp_text_enabled = false;
	global.tdp_text_try_outline = false;
	global.tdp_text_shd_size = shader_get_uniform(shd_outline, "size");
	global.tdp_text_shd_color = shader_get_uniform(shd_outline, "oColor");
	global.tdp_text_shd_uvs = shader_get_uniform(shd_outline, "uvs");
}
