if !scr_lang_load_update()
{
    instance_destroy();
    instance_activate_all();
    if room == Mainmenu
        gameframe_caption_text = lang_get_value("caption_mainmenu");
}
else
{
    alarm[0] = 1
    if !lang_init
    {
        lang_init = true;
        lang_tex_max = ds_list_size(global.lang_textures_to_load);
        lang_tex = lang_tex_max;
    }
}
