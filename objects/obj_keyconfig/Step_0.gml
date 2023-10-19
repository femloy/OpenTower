depth = -400;

// get input
var verticaldeadzone = global.gamepad_deadzone_vertical;
var horizontaldeadzone = global.gamepad_deadzone_horizontal;
var vertpress_dz = global.gamepad_deadzone_press;
var horizpress_dz = global.gamepad_deadzone_press;

var _dvc = obj_inputAssigner.player_input_device[0];
gamepad_set_axis_deadzone(_dvc, 0.4);

key_back = (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(_dvc, gp_face2))
key_up2 = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || (gamepad_axis_value(_dvc, gp_axislv) < -vertpress_dz && stickpressed_vertical == 0) || gamepad_button_check_pressed(_dvc, gp_padu));
key_down2 = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || (gamepad_axis_value(_dvc, gp_axislv) > vertpress_dz && stickpressed_vertical == 0) || gamepad_button_check_pressed(_dvc, gp_padd));
key_left2 = (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || (gamepad_axis_value(_dvc, gp_axislh) < -horizpress_dz && stickpressed_horizontal == 0) || gamepad_button_check_pressed(_dvc, gp_padl));
key_right2 = (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || (gamepad_axis_value(_dvc, gp_axislh) > horizpress_dz && stickpressed_horizontal == 0) || gamepad_button_check_pressed(_dvc, gp_padr));
key_jump = (keyboard_check_pressed(ord("Z")) || (global.key_start != vk_return && keyboard_check_pressed(vk_return)) || (global.key_start != vk_space && keyboard_check_pressed(vk_space)) || gamepad_button_check_pressed(_dvc, gp_face1));
key_jump2 = (keyboard_check(ord("Z")) || (global.key_start != vk_return && keyboard_check(vk_return)) || (global.key_start != vk_space && keyboard_check(vk_space)) || gamepad_button_check_pressed(_dvc, gp_face1));

if (gamepad_axis_value(_dvc, gp_axislh) >= horizpress_dz || gamepad_axis_value(_dvc, gp_axislh) <= (-horizpress_dz))
	stickpressed_horizontal = true;
else
	stickpressed_horizontal = false;
if (gamepad_axis_value(_dvc, gp_axislv) >= vertpress_dz || gamepad_axis_value(_dvc, gp_axislv) <= (-vertpress_dz))
	stickpressed_vertical = true;
else
	stickpressed_vertical = false;

// everything else
if startbuffer > 0
{
	startbuffer--;
	key_back = false;
	key_jump = false;
	key_jump2 = false;
}
if !selecting
{
	if key_up2
	{
		fmod_event_one_shot("event:/sfx/ui/step");
		key_select--;
		if (controller && key_select >= 0 && key_select < 4)
			key_select = -1;
	}
	if key_down2
	{
		fmod_event_one_shot("event:/sfx/ui/step");
		key_select++;
		if (controller && key_select >= 0 && key_select < 4)
			key_select = 4;
	}
	if (key_select != -1 && key_left2)
		key_select = -1;
	else if (key_select == -1 && key_right2)
	{
		key_select = 0;
		if controller
            key_select = 4;
	}
	key_select = clamp(key_select, -1, (array_length(input) - 1))
	if (((key_jump || key_back) && key_select <= -1) || (key_select > -1 && key_back))
	{
		var _found = false
		for (var i = 0; i < array_length(input); i++)
		{
			var _v = input[i][0]
			if controller
				_v = concat(_v, "C")
			if (variable_global_get(_v) == noone)
			{
				if (_v != "key_superjumpC" && _v != "key_groundpoundC")
					_found = true
			}
		}
		if (!_found)
		{
			fmod_event_one_shot("event:/sfx/ui/select")
			ini_open_from_string(obj_savesystem.ini_str_options)
			if (!controller)
			{
				ini_write_string("ControlsKeys", "up", global.key_up)
				ini_write_string("ControlsKeys", "right", global.key_right)
				ini_write_string("ControlsKeys", "left", global.key_left)
				ini_write_string("ControlsKeys", "down", global.key_down)
				ini_write_string("ControlsKeys", "jump", global.key_jump)
				ini_write_string("ControlsKeys", "slap", global.key_slap)
				ini_write_string("ControlsKeys", "attack", global.key_attack)
				ini_write_string("ControlsKeys", "shoot", global.key_shoot)
				ini_write_string("ControlsKeys", "taunt", global.key_taunt)
				ini_write_string("ControlsKeys", "start", global.key_start)
				ini_write_string("ControlsKeys2", "up", global.key_upN)
				ini_write_string("ControlsKeys2", "right", global.key_rightN)
				ini_write_string("ControlsKeys2", "left", global.key_leftN)
				ini_write_string("ControlsKeys2", "down", global.key_downN)
				ini_write_string("ControlsKeys2", "jump", global.key_jumpN)
				ini_write_string("ControlsKeys2", "slap", global.key_slapN)
				ini_write_string("ControlsKeys2", "attack", global.key_attackN)
				ini_write_string("ControlsKeys2", "shoot", global.key_shootN)
				ini_write_string("ControlsKeys2", "taunt", global.key_tauntN)
				ini_write_string("ControlsKeys2", "start", global.key_startN)
			}
			else
			{
				ini_write_string("ControllerButton", "jump", global.key_jumpC)
				ini_write_string("ControllerButton", "slap", global.key_slapC)
				ini_write_string("ControllerButton", "attack", global.key_attackC)
				ini_write_string("ControllerButton", "shoot", global.key_shootC)
				ini_write_string("ControllerButton", "taunt", global.key_tauntC)
				ini_write_string("ControllerButton", "superjump", global.key_superjumpC)
				ini_write_string("ControllerButton", "groundpound", global.key_groundpoundC)
			}
			obj_savesystem.ini_str_options = ini_close()
			if instance_exists(obj_option)
				obj_option.backbuffer = 2
			with (create_transformation_tip(lang_get_value("option_controls_saved")))
			{
				depth = -700
				alarm[1] = 100
			}
			instance_destroy()
		}
		else
			fmod_event_one_shot("event:/sfx/ui/select")
	}
	else if (key_select > -1 && key_jump)
	{
		if ((controller && gamepad_button_check_pressed(_dvc, gp_face1)) || (!controller && (!gamepad_button_check_pressed(_dvc, gp_face1))))
		{
			selecting = 1
			startbuffer = 1
		}
	}
}
else if (!controller)
{
	if keyboard_check_pressed(vk_anykey)
	{
		var _is_pause = input[key_select][0] == "key_start"
		if ((keyboard_key != vk_escape || _is_pause) && keyboard_key != vk_return && (!_is_pause || keyboard_key != vk_space))
		{
			for (i = 0; i < array_length(input); i++)
			{
				if (variable_global_get(input[i][0]) == keyboard_key)
					variable_global_set(input[i][0], -4)
			}
			startbuffer = 5
			variable_global_set(input[key_select][0], keyboard_key)
			selecting = 0
		}
		else if (keyboard_key == vk_escape)
		{
			startbuffer = 5
			selecting = 0
		}
	}
}
else
{
	var val = scr_checkanygamepad(obj_inputAssigner.player_input_device[0])
	if (val != -4 && val != gp_padu && val != gp_padr && val != gp_padd && val != gp_padl && val != gp_select && val != gp_start)
	{
		for (i = 0; i < array_length(input); i++)
		{
			var b = concat(input[i][0], "C")
			if (variable_global_get(b) == val)
				variable_global_set(b, -4)
		}
		startbuffer = 5
		variable_global_set(concat(input[key_select][0], "C"), val)
		selecting = 0
	}
	else if (val == gp_start || val == gp_select)
	{
		startbuffer = 5
		selecting = 0
	}
}
