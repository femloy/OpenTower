if !active
{
	fmod_event_one_shot_3d("event:/sfx/misc/checkpoint", x, y);
	active = true;
	sprite_index = spr_checkpoint_activating;
	image_index = 0;
	with obj_player
	{
		roomstartx = other.x + 6;
		roomstarty = other.y - 46;
	}
}
