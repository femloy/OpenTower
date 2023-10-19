if (room == characterselect)
{
	if (player_input_device[1] < -1)
		player_input_device[1] = -2;
}
if (room == Realtitlescreen)
{
	player_input_device[0] = -2;
	player_input_device[1] = -2;
	device_selected[0] = false;
	device_selected[1] = false;
}
