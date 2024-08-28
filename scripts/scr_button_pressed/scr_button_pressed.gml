function scr_button_pressed(gamepad)
{
	if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.key_jump) || keyboard_check_pressed(global.key_jumpN)
		return -1;
	else
	{
		var _face = gp_face1;
		
		// switch code checking for a different button here?
		
		if gamepad_is_connected(gamepad)
		{
			if gamepad_button_check_pressed(gamepad, _face) || gamepad_button_check_pressed(gamepad, gp_start)
				return gamepad;
		}
	}
	return -2;
}
