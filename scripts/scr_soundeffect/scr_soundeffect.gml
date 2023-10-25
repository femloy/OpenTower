function scr_soundeffect() // unused
{
	var snd = argument[irandom(argument_count - 1)];
	var snd_id = audio_play_sound(snd, 1, false);
	audio_sound_gain(snd_id, audio_sound_get_gain(snd_id) * global.option_sfx_volume, 0);
	return snd_id;
}

function sfx_gain(snd)
{
	audio_sound_gain(snd, audio_sound_get_gain(snd) * global.option_sfx_volume, 0);
}

function set_audio_config(save = true)
{
	if save
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
		ini_write_real("Option", "sfx_volume", global.option_sfx_volume);
		ini_write_real("Option", "master_volume", global.option_master_volume);
		ini_write_real("Option", "music_volume", global.option_music_volume);
		obj_savesystem.ini_str_options = ini_close();
	}
	fmod_set_parameter("masterVolume", global.option_master_volume, true);
	fmod_set_parameter("musicVolume", global.option_music_volume, true);
	fmod_set_parameter("sfxVolume", global.option_sfx_volume, true);
}

function set_controller_config()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	
	ini_write_real("InputConfig", "deadzone", global.input_controller_deadzone);
	ini_write_real("InputConfig", "deadzone_vert", global.input_controller_deadzone_vertical);
	ini_write_real("InputConfig", "deadzone_horiz", global.input_controller_deadzone_horizontal);
	ini_write_real("InputConfig", "deadzonepress", global.input_controller_deadzone_press);
	ini_write_real("InputConfig", "deadzonesuperjump", global.gamepad_deadzone_superjump);
	ini_write_real("InputConfig", "deadzonecrouch", global.gamepad_deadzone_crouch);
	ini_write_real("InputConfig", "superjump", global.gamepad_superjump);
	ini_write_real("InputConfig", "groundpound", global.gamepad_groundpound);
	ini_write_real("InputConfig", "kb_superjump", global.keyboard_superjump);
	ini_write_real("InputConfig", "kb_groundpound", global.keyboard_groundpound);
	
	obj_savesystem.ini_str_options = ini_close();
}
