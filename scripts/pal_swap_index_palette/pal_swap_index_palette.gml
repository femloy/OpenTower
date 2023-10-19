function pal_swap_index_palette()
{
	if (!ds_map_exists(global.Pal_Map, argument[0]))
	{
		var _spr = argument[0];
		var _colors = sprite_get_height(_spr);
		var _palettes = ds_list_create();
		ds_map_add(global.Pal_Map, _spr, _palettes);
		if (sprite_get_width(_spr) > 1)
		{
			var _num = sprite_get_width(_spr);
			var _surface = surface_create(_num, _colors);
			surface_set_target(_surface);
			draw_sprite(_spr, 0, 0, 0);
		}
		for (var i = 0; i < _num; i++)
		{
			var _pal = ds_list_create();
			for (var ii = 0; ii < _colors; ii++)
				ds_list_add(_pal, surface_getpixel(_surface, i, ii));
			ds_list_add(_palettes, _pal);
		}
		show_debug_message(string(_num) + " palettes indexed for sprite: " + sprite_get_name(_spr));
		surface_reset_target();
		surface_free(_surface);
	}
	else
		show_debug_message("That palette has already been indexed.");
}
