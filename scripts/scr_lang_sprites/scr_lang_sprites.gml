function lang_sprites_parse(lang)
{
	var file = file_text_open_read(concat("lang/graphics/", lang, ".json"));
	
	var str = "";
	while !file_text_eof(file)
    {
        str += file_text_readln(file);
        str += "\n";
    }
	file_text_close(file);
	
	var json = json_parse(str);
	trace(json);
	ds_map_set(global.lang_sprite_map, lang, ds_map_create());
	
	var arr = json.sprites;
	for (var i = 0; i < array_length(arr); i++)
	{
		var spr = arr[i];
		var asset = asset_get_index(spr.name);
		if asset <= -1
		{
			
		}
		else
		{
			ds_map_set(ds_map_find_value(global.lang_sprite_map, lang), asset, spr);
			
			var frame_arr = spr.frames;
			for (var j = 0; j < array_length(frame_arr); j++)
			{
				var frame = frame_arr[j];
				if ds_list_find_index(global.lang_textures_to_load, frame.texture) == -1
					ds_list_add(global.lang_textures_to_load, frame.texture);
			}
		}
	}
}
function lang_draw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, col, alpha)
{
	var spr = lang_get_sprite(sprite);
	if spr != noone
	{
		subimg = floor(subimg);
		var frame = lang_get_frame(spr, subimg);
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
	if lang_get_value("custom_graphics")
	{
		var g = ds_map_find_value(ds_map_find_value(global.lang_sprite_map, global.lang), sprite);
		if !is_undefined(g)
			return g;
	}
	return noone;
}
function lang_get_frame(sprite_struct, frame)
{
	if sprite_struct == noone || array_length(sprite_struct.frames) == 0
		return noone;
	
	if frame > array_length(sprite_struct.frames) - 1
		frame -= array_length(sprite_struct.frames) - 1;
	frame = floor(frame);
	if frame < 0
		frame = 0;
	if frame > array_length(sprite_struct.frames) - 1
		frame = array_length(sprite_struct.frames) - 1;
	
	return sprite_struct.frames[frame];
}
function lang_get_texture(texture)
{
	var g = ds_map_find_value(global.lang_texture_map, texture);
	if !is_undefined(g)
		return g;
	return noone;
}
