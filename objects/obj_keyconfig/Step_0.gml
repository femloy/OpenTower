depth = -400;
scr_menu_getinput();
key_reset = tdp_input_get("menu_reset_binds").pressed || tdp_input_get("menu_reset_bindsC").pressed;
if startbuffer > 0
{
	startbuffer--;
	key_back = false;
	key_jump = false;
	key_jump2 = false;
}
if addbuffer > 0
{
	addbuffer--;
	key_up = false;
	key_up2 = false;
	key_down = false;
	key_down2 = false;
	key_left = false;
	key_left2 = false;
	key_right = false;
	key_right2 = false;
	key_start = false;
	key_back = false;
	key_jump = false;
	key_jump2 = false;
	key_delete = false;
	key_delete2 = false;
	key_quit = false;
	key_quit2 = false;
	key_reset = false;
}
if !selecting
{
	if key_up2
	{
		fmod_event_one_shot("event:/sfx/ui/step");
		key_select--;
	}
	if key_down2
	{
		fmod_event_one_shot("event:/sfx/ui/step");
		key_select++;
	}
	if key_select != -1 && key_left2
		key_select = -1;
	else if key_select == -1 && key_right2
		key_select = 0;
	if key_reset
	{
		ini_open_from_string(obj_savesystem.ini_str);
		ini_section_delete("Input");
		scr_initinput(false);
		obj_savesystem.ini_str = ini_close();
	}
	key_select = clamp(key_select, -1, array_length(input) - 1);
	if (((key_jump || key_back) && key_select <= -1) || (key_select > -1 && key_back))
	{
		var _found = false;
		for (var i = 0; i < array_length(input); i++)
		{
			var _v = input[i][0];
			if _v != "player_superjump" && _v != "player_groundpound"
			{
				if controller
					_v = concat(_v, "C");
				if (!is_undefined(tdp_input_get(_v)) && tdp_input_get(_v).actions != -4 && array_length(tdp_input_get(_v).actions) <= 0)
					_found = true;
			}
		}
		if !_found
		{
			fmod_event_one_shot("event:/sfx/ui/select");
			ini_open_from_string(obj_savesystem.ini_str_options);
			for (i = 0; i < array_length(input); i++)
			{
				_v = input[i][0];
				if controller
					_v = concat(_v, "C");
				tdp_input_ini_write(_v);
			}
			obj_savesystem.ini_str_options = ini_close();
			if (instance_exists(obj_option))
				obj_option.backbuffer = 2;
			with (create_transformation_tip(lang_get_value("option_controls_saved")))
			{
				depth = -700;
				alarm[1] = 100;
			}
			instance_destroy();
		}
		else
			fmod_event_one_shot("event:/sfx/ui/select");
	}
	else if key_select > -1
	{
		if key_jump
		{
			selecting = true;
			startbuffer = 1;
		}
		else if key_delete2
		{
			if !controller
				tdp_input_get(input[key_select][0]).actions = array_create(0);
			else
				tdp_input_get(concat(input[key_select][0], "C")).actions = array_create(0);
			var name = input[key_select][0];
			if name == "menu_select"
			{
				selecting = true;
				startbuffer = 1;
			}
		}
		if selecting
			menu = string_copy(input[key_select][0], 0, 4) == "menu";
	}
}
else if !controller
{
	if (keyboard_check_pressed(vk_anykey))
	{
		if keyboard_key != vk_f1
		{
			if (!menu || scr_check_menu_repeats(input[key_select][0], keyboard_key, false))
			{
				startbuffer = 5;
				addbuffer = 5;
				var in = tdp_input_get(input[key_select][0]);
				if (!in.has_value(tdp_input.keyboard, keyboard_key))
					array_push(in.actions, new tdp_input_action(0, keyboard_key));
				selecting = false;
			}
			else if (input[key_select][0] != "menu_select" || !tdp_input_get(input[key_select][0]).is_empty())
			{
				startbuffer = 5;
				addbuffer = 5;
				selecting = false;
			}
		}
	}
}
else
{
	if (!debug && keyboard_check_pressed(vk_anykey))
	{
		// "if true" probably not debug
		startbuffer = 5;
		addbuffer = 5;
		selecting = false;
		exit;
	}
	var val = scr_checkanygamepad(obj_inputAssigner.player_input_device[0]);
	if val == -4
		val = scr_check_joysticks(obj_inputAssigner.player_input_device[0]);
	if val != -4 && val != gp_select
	{
		if (!menu || scr_check_menu_repeats(input[key_select][0], val, true))
		{
			startbuffer = 5;
			addbuffer = 5;
			in = tdp_input_get(concat(input[key_select][0], "C"));
			if (!is_array(val))
			{
				if (!in.has_value(tdp_input.gamepad, val))
					array_push(in.actions, new tdp_input_action(tdp_input.gamepad, val));
			}
			else if (!in.has_value(tdp_input.joystick, val[0], val[1]))
				array_push(in.actions, new tdp_input_action(tdp_input.joystick, val[0], val[1]));
			selecting = false;
		}
		else if (input[key_select][0] != "menu_select" || !tdp_input_get(concat(input[key_select][0], "C")).is_empty())
		{
			startbuffer = 5;
			addbuffer = 5;
			selecting = false;
		}
	}
}
