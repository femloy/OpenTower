if (patroltimer > 0)
{
	patroltimer--;
	alarm[5] = 60;
}
else
{
	scr_fmod_soundeffect(global.snd_alarm, x, y);
	patrolfound = false;
	state = states.punch;
	sprite_index = spr_patroller_alert;
	image_index = 0;
	scr_monster_activate();
}
