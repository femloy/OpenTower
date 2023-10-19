if (instance_exists(targetplayer))
{
	x = targetplayer.x;
	if (!scr_solid(x, y - 40))
		y = targetplayer.y - 40;
	else if (!scr_solid(x, y - 20))
		y = targetplayer.y - 20;
	else
		y = targetplayer.y;
}
