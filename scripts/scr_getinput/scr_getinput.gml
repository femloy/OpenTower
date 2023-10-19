function scr_init_input()
{
	key_up = false;
	key_up2 = false;
	key_right = false;
	key_right2 = false;
	key_left = false;
	key_left2 = false;
	key_down = false;
	key_down2 = false;
	key_jump = false;
	key_jump2 = false;
	key_slap = false;
	key_slap2 = false;
	key_taunt = false;
	key_taunt2 = false;
	key_attack = false;
	key_attack2 = false;
	key_shoot = false;
	key_shoot2 = false;
	key_start = false;
	key_escape = false;
	key_chainsaw = false;
	key_chainsaw2 = false;
	stickpressed = false;
	stickpressed_horizontal = false;
	stickpressed_vertical = false;
}

function scr_check_superjump()
{
	var sj = global.gamepad_superjump;
	if obj_inputAssigner.player_input_device[0] < 0
		sj = true;
	return ((sj && key_up) || key_superjump);
}

function scr_check_groundpound()
{
	var gp = global.gamepad_groundpound;
	if obj_inputAssigner.player_input_device[0] < 0
		gp = true;
	return ((gp && key_down2) || key_groundpound);
}

function scr_check_groundpound2()
{
	var gp = global.gamepad_groundpound;
	if obj_inputAssigner.player_input_device[0] < 0
		gp = true;
	return ((gp && key_down) || key_groundpound2);
}

function scr_getinput()
{
	if instance_exists(obj_debugcontroller) && obj_debugcontroller.active
		exit;
	
	var _dvc = obj_inputAssigner.player_input_device[0];
	gamepad_set_axis_deadzone(_dvc, global.gamepad_deadzone);
	
	var verticaldeadzone = global.gamepad_deadzone_vertical;
	var horizontaldeadzone = global.gamepad_deadzone_horizontal;
	var vertpress_dz = global.gamepad_deadzone_press;
	var horizpress_dz = global.gamepad_deadzone_press;
	
	key_up = (keyboard_check(global.key_up) || gamepad_button_check(_dvc, global.key_upC) || gamepad_axis_value(_dvc, gp_axislv) < -verticaldeadzone);
	key_up2 = (keyboard_check_pressed(global.key_up) || gamepad_button_check_pressed(_dvc, global.key_upC) || (gamepad_axis_value(_dvc, gp_axislv) < -vertpress_dz && stickpressed_vertical == false));
	key_right = (keyboard_check(global.key_right) || gamepad_button_check(_dvc, global.key_rightC) || gamepad_axis_value(_dvc, gp_axislh) > horizontaldeadzone);
	key_right2 = (keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(_dvc, global.key_rightC) || (gamepad_axis_value(_dvc, gp_axislh) > horizpress_dz && stickpressed_horizontal == false));
	key_left = (-((keyboard_check(global.key_left) || gamepad_button_check(_dvc, global.key_leftC) || gamepad_axis_value(_dvc, gp_axislh) < -horizontaldeadzone)));
	key_left2 = (-((keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(_dvc, global.key_leftC) || (gamepad_axis_value(_dvc, gp_axislh) < -horizpress_dz && stickpressed_horizontal == false))));
	key_down = (keyboard_check(global.key_down) || gamepad_button_check(_dvc, global.key_downC) || gamepad_axis_value(_dvc, gp_axislv) > verticaldeadzone);
	key_down2 = (keyboard_check_pressed(global.key_down) || gamepad_button_check_pressed(_dvc, global.key_downC) || (gamepad_axis_value(_dvc, gp_axislv) > vertpress_dz && stickpressed_vertical == false));
	key_jump = (keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(_dvc, global.key_jumpC));
	key_jump2 = (keyboard_check(global.key_jump) || gamepad_button_check(_dvc, global.key_jumpC));
	key_slap = (keyboard_check(global.key_slap) || gamepad_button_check(_dvc, global.key_slapC));
	key_slap2 = (keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(_dvc, global.key_slapC));
	key_taunt = (keyboard_check(global.key_taunt) || gamepad_button_check(_dvc, global.key_tauntC));
	key_taunt2 = (keyboard_check_pressed(global.key_taunt) || gamepad_button_check_pressed(_dvc, global.key_tauntC));
	key_attack = (keyboard_check(global.key_attack) || gamepad_button_check(_dvc, global.key_attackC));
	key_attack2 = (keyboard_check_pressed(global.key_attack) || gamepad_button_check_pressed(_dvc, global.key_attackC));
	key_shoot = false;
	key_shoot2 = false;
	key_start = (keyboard_check_pressed(global.key_start) || gamepad_button_check_pressed(_dvc, global.key_startC));
	key_escape = (keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select));
	key_chainsaw = (keyboard_check(global.key_chainsaw) || gamepad_button_check(_dvc, global.key_chainsawC));
	key_chainsaw2 = (keyboard_check_pressed(global.key_chainsaw) || gamepad_button_check_pressed(_dvc, global.key_chainsawC));
	key_superjump = (global.key_superjumpC != -4 ? gamepad_button_check(_dvc, global.key_superjumpC) : false);
	key_groundpound = (global.key_groundpoundC != -4 ? gamepad_button_check_pressed(_dvc, global.key_groundpoundC) : false);
	key_groundpound2 = (global.key_groundpoundC != -4 ? gamepad_button_check(_dvc, global.key_groundpoundC) : false);
	
	// single presses with the analog stick
	if gamepad_axis_value(_dvc, gp_axislh) >= horizpress_dz || gamepad_axis_value(_dvc, gp_axislh) <= -horizpress_dz
		stickpressed_horizontal = true;
	else
		stickpressed_horizontal = false;
	
	if gamepad_axis_value(_dvc, gp_axislv) >= vertpress_dz || gamepad_axis_value(_dvc, gp_axislv) <= -vertpress_dz
		stickpressed_vertical = true;
	else
		stickpressed_vertical = false;
	
	// gamepad analog stick bullshit
	if object_index == obj_player1
    {
        if state == states.Sjumpprep || state == states.crouch || state == states.ratmountcrouch
        {
            var haxis = gamepad_axis_value(_dvc, gp_axislh);
            var vaxis = gamepad_axis_value(_dvc, gp_axislv);
            if haxis != 0 || vaxis != 0
            {
                var _deadzone = floor(global.gamepad_deadzone_superjump * 120);
                if state == states.crouch || state == states.ratmountcrouch
                {
                    vaxis *= -1;
                    _deadzone = floor(global.gamepad_deadzone_crouch * 120);
                }
				
                var _dir = point_direction(0, 0, haxis, vaxis);
                trace(_dir, ":", _deadzone);
                if (_dir <= 120 + _deadzone && _dir >= 60 - _deadzone) || _dir >= 420 - _deadzone
                {
                    if state == states.Sjumpprep
                        key_up = true;
                    else if (state == states.crouch && uncrouch <= 0) || state == states.ratmountcrouch
                        key_down = true;
                }
            }
        }
    }
}
