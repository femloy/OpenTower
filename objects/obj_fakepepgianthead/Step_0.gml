switch state
{
	case states.normal:
		image_speed = 0.35;
		targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
		var _g = distance_to_point(targetplayer.x, targetplayer.y);
		if obj_player1.ispeppino
		{
			if movespeed < 8.25
				movespeed += 0.05;
		}
		else if _g < 150
			movespeed = 5;
		else if _g < 300
			movespeed = 8;
		else if _g < 450
			movespeed = 12;
		else
			movespeed = 17;
		x += movespeed;
		fmod_event_instance_set_3d_attributes(snd, x, y);
		if (place_meeting(x, y, obj_player1) || x > obj_player1.x)
		{
			if obj_player1.ispeppino
			{
				var s = obj_player1.state;
				var xx = obj_player1.x;
				scr_hurtplayer(obj_player1);
				ispeppino = true;
				if (instance_exists(obj_swapmodeeffect) || (s != obj_player1.state || !obj_player1.ispeppino))
				{
					state = states.fall;
					target_x = xx - 700;
					movespeed = 0;
				}
			}
			else
			{
				ispeppino = false;
				image_speed = 0.25;
				sprite_index = spr_watchitbub1;
				state = states.fall;
				target_x = -300;
				movespeed = 0;
				fmod_event_instance_stop(snd, true);
				fmod_event_one_shot("event:/sfx/playerN/lionscream");
				with obj_player1
				{
					xscale = 1;
					actor_buffer = 300;
					state = states.animation;
					sprite_index = spr_watchitbub2;
					image_speed = 0.25;
				}
				with obj_music
				{
					if music != -4
						fmod_event_instance_stop(music.event, true);
				}
			}
		}
		break;
	
	case states.fall:
		if ispeppino
		{
			image_speed = 0.5;
			movespeed += 0.2;
		}
		else
			movespeed += 0.1;
		x = Approach(x, target_x, movespeed);
		if x == target_x
		{
			if ispeppino
			{
				state = states.normal;
				movespeed = 5;
			}
		}
		break;
}
