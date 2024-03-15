var len = array_length(tex_list);
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
else if len > 0
{
	var tex = array_pop(tex_list);
	trace("Loading texture: ", tex);
	if !texture_is_ready(tex)
		texture_prefetch(tex);
}
else
{
	room_goto(Realtitlescreen);
	screen_apply_vsync();
}
alarm[0] = 1;
