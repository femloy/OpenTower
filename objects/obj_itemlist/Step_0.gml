event_inherited();
if (dirty && (!requires_level || global.current_level != -4))
{
	on_dirty();
	if !dirty
		scroll = 0;
}
if ((ds_list_size(items) * item_height) > sprite_height)
{
	if hovered
	{
		var val = floor(item_height * 0.75);
		if obj_editor.key_zoom_out
			scroll -= val;
		else if obj_editor.key_zoom_in
			scroll += val;
		scroll = clamp(scroll, -((item_height * ds_list_size(items)) - sprite_height), 0);
	}
}
else
	scroll = 0;
