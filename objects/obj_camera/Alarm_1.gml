if (global.panic == true && !instance_exists(obj_ghostcollectibles))
{
	global.seconds -= 1;
	if (global.collect >= 5 && !instance_exists(obj_ghostcollectibles))
	{
		global.collect -= 5;
		if (!instance_exists(obj_tutorialbook))
		{
			with (instance_create(121, 60, obj_negativenumber))
				number = "-5";
		}
	}
	if global.seconds < 0
	{
		global.seconds = 59;
		global.minutes -= 1;
	}
}
if (global.timedgate == 1 || global.miniboss == 1)
{
	global.seconds -= 1;
	if global.seconds < 0
	{
		global.seconds = 59;
		global.minutes -= 1;
	}
}
if global.minutes < 0
{
	global.seconds = 0;
	global.minutes = 0;
}
alarm[1] = 60;
