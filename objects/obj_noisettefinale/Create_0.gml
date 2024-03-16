image_speed = 0.35;
depth = 0;
snd = fmod_event_create_instance("event:/music/boss/noisette");
fmod_event_instance_play(snd);
with obj_music
{
	if music != -4
		fmod_event_instance_stop(music.event, false);
}
