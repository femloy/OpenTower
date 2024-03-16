switch fall
{
	case 0:
		with obj_player
		{
			if (vsp > 0 && place_meeting(x, y + 1, other) && !place_meeting(x, y, other))
				other.fall = 1;
		}
		break;
	case 1:
		if fallbuffer > 0
			fallbuffer--;
		else
		{
			fallbuffer = fallmax;
			fall = 2;
			vsp = 5;
		}
		break;
	case 2:
		if vsp < 10
			vsp += grav;
		y += vsp;
		if (y > (room_height + 100))
			fall = 3;
		break;
	case 3:
		if fallbuffer > 0
			fallbuffer--;
		else
		{
			fallbuffer = fallmax;
			fall = 0;
			x = xstart;
			y = ystart;
			create_particle(x, y, particle.cloudeffect, 0);
		}
		break;
}
