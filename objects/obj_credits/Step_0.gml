scroll_y -= 2;
if (!finish && (keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], global.key_slapC)))
{
	finish = true;
	with (obj_ending)
	{
		if (credits_pos < array_length(credits))
		{
			while (credits_pos < array_length(credits))
			{
				if (credits[credits_pos][1] != -4)
					break;
				credits_pos++;
			}
		}
		with (obj_endingcard)
		{
			event_perform(ev_alarm, 0);
			alarm[0] = -1;
		}
	}
}
if (finish)
{
	image_alpha = Approach(image_alpha, 0, 0.1);
	if (image_alpha <= 0)
		instance_destroy();
}
draw_set_font(global.creditsfont);
var arr = credits_arr[0];
if (array_length(credits_arr[1]) > array_length(arr))
	arr = credits_arr[1];
var h = string_height(arr[init_pos]);
if (scroll_y <= -h)
{
	if (init_pos < (len - 1))
	{
		init_pos++;
		scroll_y += h;
	}
	else
		instance_destroy();
}
