if (text_pos >= array_length(text))
	alarm[0] = 150;
else
{
	with obj_camera
	{
		shake_mag = 2;
		shake_mag_acc = 3 / room_speed;
	}
	fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", room_width / 2, room_height / 2);
	text[text_pos][0] = true;
	if text_pos >= 2
	{
		if !scorewins_show && global.swapmode
		{
			var snd = fmod_event_create_instance("event:/sfx/voice/swap");
			var s = 0;
			if scorewins == "N"
				s = 1;
			with (instance_create(SCREEN_WIDTH + 200, 0, obj_cooploss))
			{
				depth = other.depth - 1;
				if other.scorewins == "N"
					sprite_index = spr_cooplossP;
			}
			fmod_event_instance_set_parameter(snd, "state", s, true);
			fmod_event_instance_play(snd);
			fmod_event_instance_release(snd);
		}
		scorewins_show = true;
	}
	text_pos++;
	alarm[3] = 40;
}
