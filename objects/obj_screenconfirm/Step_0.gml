scr_menu_getinput();

var _dvc = obj_inputAssigner.player_input_device[0]
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
