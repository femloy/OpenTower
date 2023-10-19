if (!global.panic)
{
	for (var i = 0; i < array_length(room_arr); i++)
	{
		var b = room_arr[i];
		if (room == b[0])
		{
			var prevmusic = music;
			music = b[1];
			secretmusic = b[2];
			if (music != prevmusic)
			{
				var prevmuID = musicID;
				musicID = scr_music(music);
				if (b[3])
					audio_sound_set_track_position(musicID, audio_sound_get_track_position(prevmuID));
				audio_stop_sound(prevmuID);
			}
			audio_stop_sound(secretmusicID);
			audio_stop_sound(pillarmusicID);
			secretmusicID = -4;
			if (room == war_1)
				audio_stop_sound(musicID);
			break;
		}
	}
	if (instance_exists(obj_hungrypillar))
	{
		pillarmusicID = scr_music(mu_dungeondepth);
		audio_sound_gain(pillarmusicID, 0, 0);
	}
}
if (secret)
{
	secretmusicID = scr_music(secretmusic);
	audio_sound_set_track_position(secretmusicID, audio_sound_get_track_position(musicID));
	audio_pause_sound(musicID);
}
else if (secretend)
{
	secretend = false;
	audio_resume_sound(musicID);
	audio_stop_sound(secretmusicID);
}
if (room == rank_room)
{
	audio_stop_sound(musicID);
	audio_stop_sound(secretmusicID);
	audio_stop_sound(pillarmusicID);
	musicID = -4;
	secretmusicID = -4;
	pillarmusicID = -4;
}
