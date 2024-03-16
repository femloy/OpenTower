if !active
{
	y = (ystart + sprite_height)
	if (distance_to_object(obj_player1) < 250)
	{
		active = true
		fmod_event_one_shot_3d("event:/sfx/misc/pepbotkick", x, y)
	}
}
else
	y = lerp(y, ystart, 0.4)
