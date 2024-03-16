if state == states.transition
{
	var ty = SCREEN_HEIGHT / 2;
	y -= movespeed;
	if (abs(y - ty) < 200)
		movespeed = Approach(movespeed, 1, 0.05);
	if (abs(y - ty) < 16)
	{
		y = ty;
		state = states.normal;
	}
}
else if state == states.fall
{
	y += movespeed;
	movespeed = Approach(movespeed, 8, 2);
	if (y > (SCREEN_HEIGHT + sprite_height))
		instance_destroy();
}
else if collect > 0
{
	if alarm[0] == -1
		alarm[0] = 5;
}
else
{
	state = states.fall;
	movespeed = -2;
}
