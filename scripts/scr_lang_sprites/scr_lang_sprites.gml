function lang_sprites_parse(language)
{
	var file = file_text_open_read(concat("lang/graphics/", language, ".json"));
	for (var str = ""; !file_text_eof(file); str += "\n")
		str += file_text_readln(file);
	file_text_close(file);
	
	var json = json_parse(str);
	trace(json);
	ds_map_set(global.lang_sprite_map, language, ds_map_create());
	
	var arr = json.sprites;
	for (var i = 0; i < array_length(arr); i++)
	{
		var spr = arr[i];
		ds_map_set(ds_map_find_value(global.lang_sprite_map, language), asset_get_index(spr.name), spr);
		for (var j = 0; j < array_length(frame_arr); j++)
		{
			var frame = frame_arr[j];
			if (!variable_struct_exists(frame, "width"))
				frame.width = -1;
			if (!variable_struct_exists(frame, "height"))
				frame.height = -1;
			if (!variable_struct_exists(frame, "x"))
				frame.x = 0;
			if (!variable_struct_exists(frame, "y"))
				frame.y = 0;
			if (!variable_struct_exists(frame, "offset"))
				frame.offset = {x: 0, y: 0};
			if (ds_list_find_index(global.lang_textures_to_load, frame.texture) == -1)
				ds_list_add(global.lang_textures_to_load, frame.texture);
		}
	}
}
function lang_draw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, col, alpha)
{
	var spr = lang_get_sprite(sprite);
	if spr != noone
	{
		subimg = floor(subimg);
		var frame = spr.frames[subimg];
		var texture = lang_get_texture(frame.texture);
		if texture != -4
		{
			var w = frame.width;
			var h = frame.height;
			var offset = frame.offset;
			if w == -1
				w = sprite_get_width(texture);
			if h == -1
				h = sprite_get_height(texture);
			draw_sprite_part_ext(texture, 0, frame.x, frame.y, w, h, x - offset.x, y - offset.y, xscale, yscale, col, alpha);
		}
	}
	else
		draw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, col, alpha);
}
function lang_draw_sprite(sprite, subimg, x, y)
{
	var color = draw_get_color();
	var alpha = draw_get_alpha();
	lang_draw_sprite_ext(sprite, subimg, x, y, 1, 1, 0, color, alpha);
}
function lang_get_sprite(sprite)
{
	if (lang_get_value("custom_graphics"))
	{
		var g = ds_map_find_value(ds_map_find_value(global.lang_sprite_map, global.lang), sprite);
		if (!is_undefined(g))
			return g;
	}
	return noone;
}
function lang_get_texture(texture)
{
	var g = ds_map_find_value(global.lang_texture_map, texture);
	if (!is_undefined(g))
		return g;
	return noone;
}
