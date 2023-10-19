function scr_sound()
{
	var snd = argument[irandom(argument_count - 1)];
	global.music = audio_play_sound(snd, 10, true);
	audio_sound_gain(global.music, 0.6 * global.option_music_volume, 0);
}
function scr_music(sound, loops = true, gain = 0.8)
{
	var m = audio_play_sound(sound, 10, loops);
	audio_sound_gain(m, audio_sound_get_gain(sound) * gain * global.option_music_volume, 0);
	return m;
}
function set_master_gain(gain)
{
	var num = audio_get_listener_count();
	for (var i = 0; i < num; i++)
	{
		var info = audio_get_listener_info(i);
		audio_set_master_gain(ds_map_find_value(info, "index"), gain);
		ds_map_destroy(info);
	}
}
