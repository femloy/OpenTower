event_inherited();
switch (state)
{
	case states.jump:
		if (vsp < 20)
			vsp += grav;
		y += vsp;
		if (y > ystart && vsp > 0)
		{
			y = ystart;
			state = states.normal;
		}
		break;
}
