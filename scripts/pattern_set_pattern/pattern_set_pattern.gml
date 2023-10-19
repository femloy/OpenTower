function pattern_set_pattern(sprite, subimg)
{
    if sprite == global.Pattern_Texture_Indexed && global.Pattern_Texture_Indexed != noone
        exit;
    if sprite == noone
        exit;
	
    global.Pattern_Texture_Indexed = sprite;
    var _tex = sprite_get_texture(sprite, subimg);
    texture_set_stage(global.Pattern_Texture, _tex);
    texture_set_interpolation_ext(global.Pattern_Texture, false);
    var _uvs = sprite_get_uvs(sprite, subimg);
    shader_set_uniform_f(global.Pattern_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
    shader_set_uniform_f(global.Pattern_Tex_Data, _uvs[4], _uvs[5], texture_get_width(_tex) / texture_get_texel_width(_tex), texture_get_height(_tex) / texture_get_texel_height(_tex));
}
