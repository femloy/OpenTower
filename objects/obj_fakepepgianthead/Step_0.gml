switch (state)
{
	case states.normal:
		image_speed = 0.35;
		targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
		var _g = distance_to_point(targetplayer.x, targetplayer.y);
		if (movespeed < 8.25)
			movespeed += 0.05
		x += movespeed;
		fmod_event_instance_set_3d_attributes(snd, x, y);
		if (place_meeting(x, y, obj_player1) || x > obj_player1.x)
		{
			var s = obj_player1.state;
			scr_hurtplayer(obj_player1);
			if (s != obj_player1.state)
			{
				state = states.fall;
				target_x = obj_player1.x - 700;
				movespeed = 0;
			}
		}
		break;
	
	case states.fall:
		image_speed = 0.5;
		x = Approach(x, target_x, movespeed);
		movespeed += 0.2;
		if (x == target_x)
		{
			state = states.normal;
			movespeed = 5;
		}
		break;
}
