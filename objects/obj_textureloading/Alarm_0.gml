var len = array_length(tex_list);
if !lang_init
{
	lang_init = true;
	scr_lang_load_init();
}
else if !scr_lang_load_update()
{
	if len > 0
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
}
alarm[0] = 1;
