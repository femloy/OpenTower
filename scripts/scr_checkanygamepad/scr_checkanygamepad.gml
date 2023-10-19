function scr_checkanystick(device, deadzone = 0.5)
{
	if (gamepad_axis_value(device, gp_axislh) > deadzone || gamepad_axis_value(device, gp_axislh) < -deadzone)
		return true;
	if (gamepad_axis_value(device, gp_axislv) > deadzone || gamepad_axis_value(device, gp_axislv) < -deadzone)
		return true;
	if (gamepad_axis_value(device, gp_axisrh) > deadzone || gamepad_axis_value(device, gp_axisrh) < -deadzone)
		return true;
	if (gamepad_axis_value(device, gp_axisrv) > deadzone || gamepad_axis_value(device, gp_axisrv) < -deadzone)
		return true;
}

function scr_check_menu_key(key)
{
	return (global.key_start != key && global.key_slap != key && global.key_taunt != key);
}

function scr_checkanygamepad(device)
{
	if (gamepad_button_check_pressed(device, gp_face1))
		return gp_face1;
	else if (gamepad_button_check_pressed(device, gp_face2))
		return gp_face2;
	else if (gamepad_button_check_pressed(device, gp_face3))
		return gp_face3;
	else if (gamepad_button_check_pressed(device, gp_face4))
		return gp_face4;
	else if (gamepad_button_check_pressed(device, gp_shoulderl))
		return gp_shoulderl;
	else if (gamepad_button_check_pressed(device, gp_shoulderlb))
		return gp_shoulderlb;
	else if (gamepad_button_check_pressed(device, gp_shoulderr))
		return gp_shoulderr;
	else if (gamepad_button_check_pressed(device, gp_shoulderrb))
		return gp_shoulderrb;
	else if (gamepad_button_check_pressed(device, gp_select))
		return gp_select;
	else if (gamepad_button_check_pressed(device, gp_start))
		return gp_start;
	else if (gamepad_button_check_pressed(device, gp_stickl))
		return gp_stickl;
	else if (gamepad_button_check_pressed(device, gp_stickr))
		return gp_stickr;
	else if (gamepad_button_check_pressed(device, gp_padu))
		return gp_padu;
	else if (gamepad_button_check_pressed(device, gp_padd))
		return gp_padd;
	else if (gamepad_button_check_pressed(device, gp_padl))
		return gp_padl;
	else if (gamepad_button_check_pressed(device, gp_padr))
		return gp_padr;
	else if (gamepad_button_check_pressed(device, gp_axislh))
		return gp_axislh;
	else if (gamepad_button_check_pressed(device, gp_axislv))
		return gp_axislv;
	else if (gamepad_button_check_pressed(device, gp_axisrh))
		return gp_axisrh;
	else if (gamepad_button_check_pressed(device, gp_axisrv))
		return gp_axisrv;
	return noone;
}
