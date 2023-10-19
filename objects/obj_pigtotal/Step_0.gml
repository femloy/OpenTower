switch (state)
{
	case states.fall:
		add_y += 8;
		if (add_y >= 0)
		{
			state = states.transition;
			y += 20;
		}
		break;
	
	case states.transition:
		y = Approach(y, SCREEN_HEIGHT - 100, 6);
		if (y == (SCREEN_HEIGHT - 100))
		{
			state = states.animation;
			buffer = 1;
		}
		break;
	
	case states.animation:
		if (global.pigtotal_add > 0)
			global.pigtotal_add--;
		else
			state = states.normal;
		break;
}
