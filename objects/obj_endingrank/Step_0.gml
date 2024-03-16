bg_x += 1;
bg_y -= 1;
scr_menu_getinput();
switch state
{
	case 0:
		fade = Approach(fade, 0, 0.1);
		if introbuffer > 0
			introbuffer--;
		else
		{
			state++;
			if !ispeppino
				fmod_event_instance_stop(snd_start, false);
		}
		break;
	case 1:
		var targetfade = 1.5;
		fade = Approach(fade, targetfade, 0.01);
		if fade >= targetfade
		{
			state++;
			fade = 1;
			introbuffer = 180;
			snd = fmod_event_create_instance("event:/sfx/ui/percentagemove");
			if !ispeppino
				fmod_event_instance_play(snd_drumroll);
		}
		break;
	case 2:
		if percvisual < percentage
		{
			var a = (floor(abs(percvisual - percentage) / 10) + 1) * 0.08;
			if a < 0.1
				a = 0.1;
			var pc = percvisual;
			percvisual = Approach(percvisual, percentage, a);
			if (ispeppino && floor(pc) != floor(percvisual))
			{
				fmod_event_instance_set_parameter(snd, "state", percvisual / 101, true);
				fmod_event_instance_play(snd);
			}
			if percvisual == percentage && !ispeppino
				fmod_event_instance_set_parameter(snd_drumroll, "state", 1, true);
		}
		else
		{
			percvisual = percentage;
			if introbuffer > 0
				introbuffer--;
			else
			{
				notification_push(notifs.endingrank, [rank_name]);
				fmod_event_instance_release(snd);
				fmod_event_instance_set_parameter(music, "state", 1, true);
				sprite_index = rank_spr;
				introbuffer = 400;
				state++;
				if !ispeppino
				{
					fmod_event_instance_play(snd_verdict);
					if percentage >= 95
						fmod_event_instance_set_parameter(snd_verdict, "state", 1, true);
					else
						fmod_event_instance_set_parameter(snd_verdict, "state", 0, true);
				}
				if rank_spr == spr_finaljudgement2
				{
					state = 5;
					brown = false;
				}
			}
		}
		break;
	case 3:
		fade = Approach(fade, 0, 0.1);
		if introbuffer > 0
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
		if introbuffer > 0
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
		if (key_jump || key_start)
			state++;
		break;
	case 6:
		fade = Approach(fade, 2, 0.01);
		if fade >= 1.4
		{
			with obj_player
				state = states.titlescreen;
			room_goto(Realtitlescreen);
		}
		break;
}
