scr_menu_getinput();
if startbuffer > 0
    startbuffer--;

var move = key_left2 + key_right2;
if (move != 0)
{
    select += move;
    if select > array_length(lang) - 1
        select = 0;
    if select < 0
        select = array_length(lang) - 1;
    if move > 0
        right_offset = 5;
    if move < 0
        left_offset = 5;
}

left_offset = Approach(left_offset, 0, 1);
right_offset = Approach(right_offset, 0, 1);

if (key_jump || key_back) && startbuffer <= 0
{
    if key_jump
    {
        fmod_event_one_shot("event:/sfx/ui/select");
        ini_open_from_string(obj_savesystem.ini_str_options);
        global.offload_lang = global.option_lang;
        global.option_lang = lang[select].ID;
        if global.option_lang != global.offload_lang
        {
            ini_write_string("Option", "lang", global.option_lang);
            obj_savesystem.ini_str_options = ini_close();
            global.lang = global.option_lang;
            startbuffer = 10;
            if ds_list_find_index(global.lang_loaded, global.lang) == -1
                instance_create(0, 0, obj_langload);
        }
    }
    if instance_exists(obj_option)
        obj_option.backbuffer = 2;
    instance_destroy();
}
