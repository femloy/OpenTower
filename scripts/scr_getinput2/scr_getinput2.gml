function scr_getinput2()
{
	if (instance_exists(obj_debugcontroller) && obj_debugcontroller.active)
		exit;
	
	var _dvc = obj_inputAssigner.player_input_device[1];
	gamepad_set_axis_deadzone(_dvc, 0.4);
	key_up = keyboard_check(global.key_upN) || gamepad_button_check(_dvc, global.key_upCN) || gamepad_axis_value(_dvc, gp_axislv) < 0;
	key_up2 = keyboard_check_pressed(global.key_upN) || gamepad_button_check_pressed(_dvc, global.key_upCN) || (gamepad_axis_value(_dvc, gp_axislv) < -0.5 && stickpressed == 0);
	key_right = keyboard_check(global.key_rightN) || gamepad_button_check(_dvc, global.key_rightCN) || gamepad_axis_value(_dvc, gp_axislh) > 0;
	key_right2 = keyboard_check_pressed(global.key_rightN) || gamepad_button_check_pressed(_dvc, global.key_rightCN) || (gamepad_axis_value(_dvc, gp_axislh) > 0.5 && stickpressed == 0);
	key_left = -(keyboard_check(global.key_leftN) || gamepad_button_check(_dvc, global.key_leftCN) || gamepad_axis_value(_dvc, gp_axislh) < 0);
	key_left2 = -(keyboard_check_pressed(global.key_leftN) || gamepad_button_check_pressed(_dvc, global.key_leftCN) || (gamepad_axis_value(_dvc, gp_axislh) < -0.5 && stickpressed == 0));
	key_down = keyboard_check(global.key_downN) || gamepad_button_check(_dvc, global.key_downCN) || gamepad_axis_value(_dvc, gp_axislv) > 0;
	key_down2 = keyboard_check_pressed(global.key_downN) || gamepad_button_check_pressed(_dvc, global.key_downCN) || (gamepad_axis_value(_dvc, gp_axislv) > 0.5 && stickpressed == 0);
	key_jump = keyboard_check_pressed(global.key_jumpN) || gamepad_button_check_pressed(_dvc, global.key_jumpCN);
	key_jump2 = keyboard_check(global.key_jumpN) || gamepad_button_check(_dvc, global.key_jumpCN);
	key_slap = keyboard_check(global.key_slapN) || gamepad_button_check(_dvc, global.key_slapCN);
	key_slap2 = keyboard_check_pressed(global.key_slapN) || gamepad_button_check_pressed(_dvc, global.key_slapCN);
	key_taunt = keyboard_check(global.key_tauntN) || gamepad_button_check(_dvc, global.key_tauntCN);
	key_taunt2 = keyboard_check_pressed(global.key_tauntN) || gamepad_button_check_pressed(_dvc, global.key_tauntCN);
	key_attack = keyboard_check(global.key_attackN) || gamepad_button_check(_dvc, global.key_attackCN) || gamepad_button_check(_dvc, gp_shoulderrb);
	key_attack2 = keyboard_check_pressed(global.key_attackN) || gamepad_button_check_pressed(_dvc, global.key_attackCN) || gamepad_button_check_pressed(_dvc, gp_shoulderrb);
	key_shoot = false;
	key_shoot2 = false;
	key_start = keyboard_check_pressed(global.key_startN) || gamepad_button_check_pressed(_dvc, global.key_startCN);
	key_escape = keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select);
	key_chainsaw = keyboard_check(global.key_chainsawN) || gamepad_button_check(_dvc, global.key_chainsawCN) || gamepad_button_check(_dvc, gp_shoulderlb);
	key_chainsaw2 = keyboard_check_pressed(global.key_chainsawN) || gamepad_button_check_pressed(_dvc, global.key_chainsawCN) || gamepad_button_check_pressed(_dvc, gp_shoulderlb);
	
	if object_index == obj_player2 && state == states.Sjumpprep
	{
		var haxis = gamepad_axis_value(_dvc, gp_axislh);
		var vaxis = gamepad_axis_value(_dvc, gp_axislv);
		if (haxis != 0 || vaxis != 0)
		{
			var _dir = point_direction(0, 0, haxis, vaxis);
			trace(_dir);
			var _deadzone = 5;
			if (_dir >= _deadzone && _dir <= (180 - _deadzone))
				key_up = true;
		}
	}
	if ((gamepad_axis_value(_dvc, gp_axislh) > 0.5 || gamepad_axis_value(_dvc, gp_axislh) < -0.5) || (gamepad_axis_value(_dvc, gp_axislv) > 0.5 || gamepad_axis_value(_dvc, gp_axislv) < -0.5))
		stickpressed = true;
	else
		stickpressed = false;
}
