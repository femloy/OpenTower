if !trickytreat
{
	image_alpha = 0;
	if (distance_to_object(obj_player1) <= visibleradius)
		image_alpha = 1 - (distance_to_object(obj_player1) / visibleradius);
}
else
	image_alpha = 1;
