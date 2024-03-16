switch state
{
	case 0:
		global.combotime = 60;
		var move = dir * 24;
		if (sign(move) != sign(movespeed))
			movespeed = Approach(movespeed, move, 4);
		else
			movespeed = Approach(movespeed, move, 1);
		xoffset += movespeed;
		var len = 140;
		if (dir > 0 && xoffset > len) || (dir < 0 && xoffset < -len)
		{
			dir *= -1;
			ydir *= -1;
			swings++;
			if swings > 4 && dir == -playerid.xscale
			{
				state++;
				image_xscale = -dir;
				fmod_event_instance_stop(loopsnd, true);
				fmod_event_instance_play(throwsnd);
			}
		}
		if ydir == -1
			depth = 0;
		else
			depth = -15;
		x = (playerid.x + xoffset);
		y = (playerid.y + yoffset);
		break;
	
	case 1:
		x += movespeed;
		if (abs(movespeed) < 25)
			movespeed += (sign(movespeed) * 2);
		break;
}

chargeindex += 0.35;
instance_destroy(instance_place(x, y, obj_destructibles));
instance_destroy(instance_place(x, y, obj_metalblock));
instance_destroy(instance_place(x, y, obj_baddie));
fmod_event_instance_set_3d_attributes(loopsnd, x, y);
fmod_event_instance_set_3d_attributes(throwsnd, x, y);
