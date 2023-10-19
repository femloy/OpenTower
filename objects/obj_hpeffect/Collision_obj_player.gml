if (finish)
{
	fmod_event_one_shot("event:/sfx/misc/cardcollect");
	with (obj_camera)
		healthshaketime = 30;
	global.hats++;
	instance_destroy();
}
