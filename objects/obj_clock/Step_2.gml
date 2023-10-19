if (!instance_exists(objectID))
{
	instance_destroy();
	exit;
}
x = objectID.x;
y = objectID.y - ypad;
if (timedgate)
{
	var time = global.timedgatetime;
	var _max = global.timedgatetimemax;
}
else
{
	with (obj_deliverytimer)
	{
		var m = minutes;
		var s = seconds;
		var mm = maxminutes;
		var ms = maxseconds;
	}
	while (m > 0)
	{
		m--;
		s += 60;
	}
	while (mm > 0)
	{
		mm--;
		ms += 60;
	}
	time = s;
	_max = ms;
}
var p = time / _max;
image_index = round(p * (image_number - 1));
if (!init)
{
	init = true;
	last_index = image_index;
}
else if (last_index != image_index)
{
	if (last_index > image_index)
		fmod_event_one_shot("event:/sfx/misc/timercount");
	else
		fmod_event_one_shot("event:/sfx/misc/timerbegin");
	last_index = image_index;
}
if (timedgate && !global.timedgatetimer)
	instance_destroy();
