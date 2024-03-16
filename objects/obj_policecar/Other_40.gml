if state != states.policetaxi
	exit;
if (!instance_exists(obj_fadeout))
{
	fmod_event_one_shot("event:/sfx/misc/door");
	with (instance_create(x, y, obj_fadeout))
		roomreset = true;
}
