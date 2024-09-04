var player = instance_nearest(x, y, obj_player);
image_speed = 0.35;
switch state
{
	case states.normal:
		if (collisioned && fmod_event_instance_is_playing(snd))
			fmod_event_instance_stop(snd, true);
		if collisioned
			visible = false;
		else if (place_meeting(x, y, obj_frontcanonbomb) || place_meeting(x, y, obj_canonexplosion) || !instance_exists(obj_frontcanongoblin))
			collisioned = true;
		if cooldown > 0
			cooldown--;
		else if (distance_to_pos(x, y, player.x, player.y, threshold_x, threshold_y) && instance_exists(obj_frontcanongoblin))
		{
			state = states.transition;
			attackbuffer = 20;
		}
		break;
	case states.transition:
		if (!fmod_event_instance_is_playing(snd))
			fmod_event_instance_play(snd);
		fmod_event_instance_set_3d_attributes(snd, x, y);
		visible = true;
		if attackbuffer > 0
			attackbuffer--;
		else
		{
			with obj_frontcanongoblin
			{
				if state != states.transition && state != states.dead
				{
					crosshair_x = other.x;
					crosshair_y = other.y;
					event_perform(ev_alarm, 0);
					other.state = states.normal;
					other.collisioned = false;
					other.cooldown = 150;
				}
			}
		}
		break;
}
