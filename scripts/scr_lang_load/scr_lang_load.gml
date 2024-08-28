function scr_lang_load_init()
{
	var lang = ds_map_find_value(global.lang_available, global.option_lang);
	if is_undefined(lang)
	{
		global.option_lang = "en";
		lang = ds_map_find_value(global.lang_available, global.option_lang);
	}
	ds_queue_enqueue(global.lang_to_load, lang.file);
	ds_list_clear(global.lang_textures_to_load);
	global.lang_tex_max = 0;
}
function lang_load_fonts(_lang)
{
	var lang = ds_map_find_value(global.lang_map, _lang);
	if ds_map_find_value(lang, "custom_fonts")
	{
		ds_map_set(global.font_map, concat("tutorialfont_", _lang), lang_get_custom_font("tutorialfont", lang));
		ds_map_set(global.font_map, concat("creditsfont_", _lang), lang_get_custom_font("creditsfont", lang));
		ds_map_set(global.font_map, concat("bigfont_", _lang), lang_get_custom_font("bigfont", lang));
		ds_map_set(global.font_map, concat("smallfont_", _lang), lang_get_custom_font("smallfont", lang));
		ds_map_set(global.font_map, concat("captionfont_", _lang), lang_get_custom_font("captionfont", lang));
	}
}
function lang_unload_font(_lang)
{
	var lang = ds_map_find_value(global.lang_map, _lang);
	if ds_map_find_value(lang, "custom_fonts")
	{
		font_delete(ds_map_find_value(global.font_map, concat("tutorialfont_", _lang)));
		font_delete(ds_map_find_value(global.font_map, concat("creditsfont_", _lang)));
		font_delete(ds_map_find_value(global.font_map, concat("bigfont_", _lang)));
		font_delete(ds_map_find_value(global.font_map, concat("smallfont_", _lang)));
		font_delete(ds_map_find_value(global.font_map, concat("captionfont_", _lang)));
	}
}
function scr_lang_load_update()
{
	if global.offload_lang != noone && global.offload_lang != "en"
	{
		var lang = ds_map_find_value(global.lang_map, global.offload_lang);
		if lang_get_value_raw(global.offload_lang, "custom_graphics")
		{
			var sprites = ds_map_find_value(global.lang_sprite_map, global.offload_lang);
			var textures_to_offload = ds_list_create();
			var key = ds_map_find_first(sprites);
			var size = ds_map_size(sprites);
			for (var i = 0; i < size; i++)
			{
				var sprite = ds_map_find_value(sprites, key);
				for (var j = 0; j < array_length(sprite.frames); j++)
				{
					var frame = sprite.frames[j];
					if !ds_list_find_index(textures_to_offload, frame.texture)
						ds_list_add(textures_to_offload, frame.texture);
				}
				key = ds_map_find_next(sprites, key);
			}
			for (i = 0; i < ds_list_size(textures_to_offload); i++)
			{
				var tex = ds_list_find_value(textures_to_offload, i);
				var spr = lang_get_texture(tex);
				sprite_delete(spr);
				ds_map_delete(global.lang_texture_map, tex);
			}
			ds_list_destroy(textures_to_offload);
		}
		global.offload_lang = -4;
	}
	
	if ds_queue_size(global.lang_to_load) > 0
		lang_parse_file(ds_queue_dequeue(global.lang_to_load));
	else if ds_list_size(global.lang_textures_to_load) > 0
	{
		lang_tex--;
		var name = ds_list_find_value(global.lang_textures_to_load, 0);
		if is_undefined(ds_map_find_value(global.lang_texture_map, name))
		{
			var filename = concat("lang/graphics/", name);
			ds_map_set(global.lang_texture_map, name, sprite_add(filename, 1, false, false, 0, 0));
		}
		ds_list_delete(global.lang_textures_to_load, 0);
	}
	else
	{
		global.lang = global.option_lang;
		if variable_global_exists("font_map")
			lang_load_fonts(global.lang);
		return false;
	}
	return true;
}
