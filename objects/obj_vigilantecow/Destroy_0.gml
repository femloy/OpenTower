repeat 6
{
	with (create_debris(x + random_range(-70, 70), y + random_range(55, -55), spr_cowmeat, true))
		image_speed = 0.35;
}
fmod_event_one_shot_3d("event:/sfx/vigilante/cowdead", x, y);
