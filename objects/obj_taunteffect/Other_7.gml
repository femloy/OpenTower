instance_destroy();
if obj_player1.character == "N"
{
	image_speed = 0;
	if (obj_player1.image_index < 18 || obj_player1.state != states.backbreaker)
		instance_destroy();
}
