if (!play)
{
	if (!fmod_event_instance_get_paused(music_event))
		fmod_event_instance_set_paused(music_event, true);
}
