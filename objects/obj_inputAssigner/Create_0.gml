player_input_device[0] = -2;
player_input_device[1] = -2;

switch_input_buffer = 0;
switch_swap_ready_buffer = 0;
swap_cancelled = false;
switch_mode = 0;
switch_saved_input = -2;

mode = 0;
player_index = 0;
device_selected[0] = false;
device_selected[1] = false;
press_start = false;
deactivated = false;
device_to_reconnect = 0;
instance_list = ds_list_create();
sound_list = ds_list_create();
prevstate[0] = states.titlescreen;
prevstate[1] = states.titlescreen;

vibration[0][0] = 0;
vibration[0][1] = 0;
vibration[0][2] = 0;
vibration[1][0] = 0;
vibration[1][1] = 0;
vibration[1][2] = 0;

switch_get_single_player = function(player)
{
	while true
	{
		switch_controller_joycon_set_holdtype(1); // TODO?
		switch_controller_set_supported_styles(31); // TODO?
		switch_controller_support_set_singleplayer_only(true);
		switch_controller_support_set_player_min(1);
		switch_controller_support_set_player_max(1);
		
		var result = switch_controller_support_show();
		if result == 0
		{
			player_input_device[player] = switch_controller_support_get_selected_id();
			break;
		}
	}
};

for (var i = 0; i < gamepad_get_device_count(); i++)
{
	if gamepad_is_connected(i)
	{
		device_selected[0] = true;
		player_input_device[0] = i;
		press_start = false;
	}
}

setVibration = function(player, left_motor, right_motor, force)
{
	vibration[player][0] = left_motor;
	vibration[player][1] = right_motor;
	if force != undefined
		vibration[player][2] = force;
}
function CheckUsedIndex(index)
{
	for (var _x = 0; _x < 2; _x++)
	{
		if player_input_device[_x] == index
			return true;
	}
	return false;
}
