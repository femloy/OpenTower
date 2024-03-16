if !fadein
{
	fadealpha = Approach(fadealpha, 1, 0.1);
	if fadealpha >= 1
	{
		fadein = true;
		start = true;
		music = false;
		alarm[0] = 180;
		if title_music == "event:/music/secretworldtitle"
			alarm[0] = 240;
	}
}
else
{
	fadealpha = Approach(fadealpha, 0, 0.1);
	if fadealpha <= 0 && !music && title_music != -4
	{
		music = true;
		fmod_event_one_shot(title_music);
	}
}
