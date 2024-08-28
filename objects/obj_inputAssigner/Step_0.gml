if (instance_exists(obj_player1))
	player_index = obj_player1.player_index;
if !deactivated
{
	swap_ready = false;
	if mode == 0
	{
		if room == characterselect && global.swapmode
		{
			mode = 1;
			player_input_device[0] = -2;
			player_input_device[1] = -2;
		}
		else
		{
			for (var i = 0; i < gamepad_get_device_count(); i++)
			{
				var _index = scr_anybutton_pressed(i);
				if _index > -2
				{
					device_selected[0] = true;
					if player_input_device[0] != _index
					{
						for (var j = 0; j < gamepad_get_device_count(); j++)
						{
							if (gamepad_is_connected(j))
								gamepad_set_vibration(j, 0, 0);
						}
					}
					player_input_device[0] = _index;
					press_start = false;
				}
			}
		}
	}
	else if mode == 1
	{
		if !global.swapmode
		{
			mode = 0;
			player_input_device[1] = -1;
		}
		
		swap_ready = false;
		var _found = false;
		for (var player = 0; player < 2; player++)
		{
			if player_input_device[player] == -2
				_found = true;
		}
		if !_found
			swap_ready = true;
		for (player = 0; player < 2; player++)
		{
			for (i = 0; i < 8; i++)
			{
				_index = scr_button_pressed(i);
				if player_input_device[player] == -2 && _index >= -1
				{
					player_input_device[player] = _index;
					trace("Player ", player, " connected at index: ", _index);
					player = 2;
					break;
				}
			}
		}
	}
	if (switch_input_buffer <= 0)
	{
		for (i = 0; i < 2; i++)
		{
			if (player_input_device[i] <= -1)
			{
				
			}
			else if (player_input_device[i] >= 0)
			{
				if (!gamepad_is_connected(player_input_device[i]))
				{
					deactivated = true;
					device_selected[i] = false;
					player_input_device[i] = -2;
					device_to_reconnect = i;
					scr_pause_deactivate_objects(false);
					break;
				}
			}
		}
	}
}
else
{
	for (i = 0; i < 8; i++)
	{
		_index = scr_button_pressed(i);
		if player_input_device[device_to_reconnect] == -2 && _index >= -1
		{
			player_input_device[device_to_reconnect] = _index;
			deactivated = false;
			trace("Player ", device_to_reconnect, " connected at index: ", _index);
			scr_pause_activate_objects(false);
			alarm[0] = 1;
			break;
		}
	}
}
