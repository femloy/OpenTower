if sprite_index == spr_peppinoswitch1
{
	sprite_index = spr_peppinoswitch2;
	image_index = 0;
	fmod_event_one_shot_3d("event:/sfx/voice/pepwakeup", x, y);
}
