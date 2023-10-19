var d = 0.03;
if (keyboard_check_pressed(global.key_slap) || keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], global.key_slapC) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], global.key_jumpC))
{
	if (alarm[1] > 0)
		event_perform(2, 1);
	instance_destroy();
}
if (fadein)
	image_alpha = Approach(image_alpha, 1, d);
else
{
	image_alpha = Approach(image_alpha, 0, d);
	if (image_alpha <= 0)
		instance_destroy();
}
