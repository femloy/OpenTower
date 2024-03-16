function editor_input_update() //editor_input_update
{
	for (var i = 0; i < 8; i++)
	{
		var any = scr_anybutton_pressed(i)
		if any == -2
		{
			if (mouse_wheel_down() || mouse_wheel_up() || mouse_check_button(mb_any))
				any = -1
		}
		if any != -2
			input_method = any
	}
	if input_method < 0
	{
		key_undo = keyboard_check_pressed(ord("Z"))
		key_redo = keyboard_check_pressed(ord("Y"))
		key_zoom_out = mouse_wheel_down()
		key_zoom_in = mouse_wheel_up()
		key_place = mouse_check_button_pressed(mb_left)
		key_place_released = mouse_check_button_released(mb_left)
		key_delete = mouse_check_button_pressed(mb_right)
		key_select = false
		laxis_vertical = 0
		laxis_horizontal = 0
		raxis_vertical = (keyboard_check(ord("S")) - keyboard_check(ord("W")))
		raxis_horizontal = (keyboard_check(ord("D")) - keyboard_check(ord("A")))
	}
	else
	{
		key_select = gamepad_button_check_pressed(input_method, gp_face1)
		key_place = gamepad_button_check_pressed(input_method, gp_face1)
		key_place_released = gamepad_button_check_released(input_method, gp_face1)
		key_delete = gamepad_button_check_pressed(input_method, gp_face3)
		key_zoom_out = gamepad_button_check_pressed(input_method, gp_shoulderlb)
		key_zoom_in = gamepad_button_check_pressed(input_method, gp_shoulderrb)
		key_undo = gamepad_button_check_pressed(input_method, gp_shoulderl)
		key_redo = gamepad_button_check_pressed(input_method, gp_shoulderr)
		laxis_vertical = gamepad_axis_value(input_method, gp_axislv)
		laxis_horizontal = gamepad_axis_value(input_method, gp_axislh)
		raxis_vertical = gamepad_axis_value(input_method, gp_axisrv)
		raxis_horizontal = gamepad_axis_value(input_method, gp_axisrh)
	}
}
