if (global.timedgatetimer)
{
	global.timedgatetimer = false;
	global.timedgatetime = 0;
	instance_destroy(obj_clock, false);
}
