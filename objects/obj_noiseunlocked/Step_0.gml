with obj_music
{
	if music != noone
		fmod_event_instance_stop(music.event, true);
}
if fadein
{
	fade = Approach(fade, 1, 0.05);
	if fade >= 1
		instance_destroy();
}
else
	fade = Approach(fade, 0, 0.1);
