with obj_player1
{
	state = states.actor;
	sprite_index = spr_player_outofpizza1;
	image_index = 0;
	deathspeed = 10;
	vsp = -12;
	if !ispeppino
	{
		fmod_event_instance_set_parameter(snd_bossdeathN, "state", 0, true);
		scr_fmod_soundeffect(snd_bossdeathN, x, y);
		sprite_index = spr_playerN_bossdeath1;
		targetvsp = vsp;
		deathbuffer = 50;
		vsp = -7;
		deathspeed = 16;
	}
}
with obj_playerbomb
{
	dead = true;
	deadbuffer = 0;
	instance_destroy();
}
depth = -600;
fade = 0;
fade2 = 0;
fade2start = false;
state = states.jump;
with obj_music
{
	if music != -4
		fmod_event_instance_stop(music.event, false);
}
