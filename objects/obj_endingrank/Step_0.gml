bg_x += 1;
bg_y -= 1;
switch (state)
{
	case 0:
		fade = Approach(fade, 0, 0.1);
		if (introbuffer > 0)
			introbuffer--;
		else
			state++;
		break;
	case 1:
		var targetfade = 1.5;
		fade = Approach(fade, targetfade, 0.01);
		if (fade >= targetfade)
		{
			state++;
			fade = 1;
			introbuffer = 180;
			snd = fmod_event_create_instance("event:/sfx/ui/percentagemove");
		}
		break;
	case 2:
		if (percvisual < percentage)
		{
			var a = (floor(abs(percvisual - percentage) / 10) + 1) * 0.08;
			if (a < 0.1)
				a = 0.1;
			var pc = percvisual;
			percvisual = Approach(percvisual, percentage, a);
			if (floor(pc) != floor(percvisual))
			{
				fmod_event_instance_set_parameter(snd, "state", percvisual / 101, true);
				fmod_event_instance_play(snd);
			}
		}
		else
		{
			percvisual = percentage;
			if (introbuffer > 0)
				introbuffer--;
			else
			{
				fmod_event_instance_release(snd);
				fmod_event_instance_set_parameter(music, "state", 1, true);
				sprite_index = rank_spr;
				introbuffer = 400;
				state++;
				if (rank_spr == spr_finaljudgement2)
				{
					state = 5;
					brown = false;
				}
			}
		}
		break;
	case 3:
		fade = Approach(fade, 0, 0.1);
		if (introbuffer > 0)
			introbuffer--;
		else
		{
			introbuffer = 40;
			brown = true;
			brownfade = 0;
			state++;
		}
		break;
	case 4:
		brownfade = Approach(brownfade, 1, 0.06);
		if (introbuffer > 0)
			introbuffer--;
		else
		{
			introbuffer = 40;
			if (text_pos >= array_length(text))
				state++;
			else
			{
				text[text_pos][0] = true;
				text_pos++;
			}
		}
		break;
	case 5:
		fade = Approach(fade, 0, 0.1);
		brownfade = Approach(brownfade, 1, 0.06);
		if (obj_player1.key_jump)
			state++;
		break;
	case 6:
		fade = Approach(fade, 2, 0.01);
		if (fade >= 1.4)
		{
			with (obj_player)
				state = states.titlescreen;
			room_goto(Realtitlescreen);
		}
		break;
}
