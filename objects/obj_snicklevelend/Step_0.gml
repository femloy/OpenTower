if (floor(image_index) == (image_number - 1) && obj_player.state != states.door)
{
	with (obj_player)
	{
		state = states.door;
		image_index = 0;
	}
	alarm[0] = 200;
}
if (floor(image_index) == (image_number - 1))
	image_speed = 0;
