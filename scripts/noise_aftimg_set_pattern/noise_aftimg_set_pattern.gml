function noise_aftimg_set_pattern(sprite, subimg)
{
	if sprite == noone
	{
		shader_set_uniform_i(global.N_Pattern_Enabled, 0);
		exit;
	}
	shader_set_uniform_i(global.N_Pattern_Enabled, 1);
	var _tex = sprite_get_texture(sprite, subimg);
	texture_set_stage(global.N_Pattern_Tex, _tex);
	texture_set_interpolation_ext(global.N_Pattern_Tex, 0);
	var _uvs = sprite_get_uvs(sprite, subimg);
	shader_set_uniform_f(global.N_Pattern_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
}
