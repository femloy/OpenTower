if destroy
{
	trace("self: ", baddie);
	with (instance_create(x, y, obj_canonexplosion))
	{
		hurtplayer = other.hurtplayer;
		rat = other.grabbable;
		baddie = other.baddie;
		trace("canonexplosion create: ", baddie);
	}
}
fmod_event_instance_stop(snd, true);
fmod_event_instance_release(snd);
