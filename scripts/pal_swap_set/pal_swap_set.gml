function pal_swap_set()
{
	var _pal_sprite = argument[0];
	var _pal_index = argument[1];
	var _surface = false;
	if (!_surface)
	{
		var tex = sprite_get_texture(_pal_sprite, 0);
		var UVs = sprite_get_uvs(_pal_sprite, 0);
		texture_set_stage(global.Pal_Texture, tex);
		texture_set_interpolation_ext(global.Pal_Texture, 1);
		var texel_x = texture_get_texel_width(tex);
		var texel_y = texture_get_texel_height(tex);
		var texel_hx = texel_x * 0.5;
		var texel_hy = texel_y * 0.5;
		shader_set_uniform_f(global.Pal_Texel_Size, texel_x, texel_y);
		shader_set_uniform_f(global.Pal_UVs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
		shader_set_uniform_f(global.Pal_Index, _pal_index);
	}
	else
	{
		tex = surface_get_texture(_pal_sprite);
		texture_set_stage(global.Pal_Texture, tex);
		texture_set_interpolation_ext(global.Pal_Texture, 1);
		texel_x = texture_get_texel_width(tex);
		texel_y = texture_get_texel_height(tex);
		texel_hx = texel_x * 0.5;
		texel_hy = texel_y * 0.5;
		shader_set_uniform_f(global.Pal_Texel_Size, texel_x, texel_y);
		shader_set_uniform_f(global.Pal_UVs, texel_hx, texel_hy, 1 + texel_hx, 1 + texel_hy);
		shader_set_uniform_f(global.Pal_Index, _pal_index);
	}
}
