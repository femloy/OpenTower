function scr_fmod_soundeffect(sound_instance, x, y)
{
	fmod_event_instance_set_3d_attributes(sound_instance, x, y);
	fmod_event_instance_play(sound_instance);
}
