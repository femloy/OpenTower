with obj_player
{
	if state == states.actor
		state = states.normal;
}
gamesave_async_save_options();
fmod_event_instance_stop(global.snd_slidermaster, true);
fmod_event_instance_stop(global.snd_slidermusic, true);
fmod_event_instance_stop(global.snd_slidersfx, true);
