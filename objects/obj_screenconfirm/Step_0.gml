scr_getinput();

var _dvc = obj_inputAssigner.player_input_device[0]
if (key_jump && _dvc >= 0 && gamepad_button_check_pressed(_dvc, global.key_jumpC) && global.key_jumpC == gp_face2)
    key_jump = false;
key_jump = (key_jump || (global.key_start != vk_return && keyboard_check_pressed(vk_return)) || (global.key_start != vk_space && keyboard_check_pressed(vk_space)) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_face1));
key_back = (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_face2));

if -key_left2
    select = 0;
else if key_right2
    select = 1;

if key_jump
{
    if select == 0
    {
        ini_open_from_string(obj_savesystem.ini_str_options);
        ini_write_real(section, key, variable_global_get(varname));
        obj_savesystem.ini_str_options = ini_close();
        timer = 5;
        instance_destroy();
    }
    else
    {
        timer = 0;
        event_perform(ev_alarm, 0);
        instance_destroy();
    }
}
