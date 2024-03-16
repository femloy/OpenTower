with (instance_create(x, y, content))
	vsp = random_range(-1, -10);
if _timescount < _times
{
	alarm[0] = timer;
	_timescount++;
}
else
	instance_destroy();
