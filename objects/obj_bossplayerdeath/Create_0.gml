with (obj_player1)
{
	state = states.actor;
	sprite_index = spr_player_outofpizza1;
	image_index = 0;
	deathspeed = 10;
	vsp = -12;
}
depth = -600;
fade = 0;
fade2 = 0;
fade2start = false;
state = states.jump;
with (obj_music)
{
	if (music != -4)
		fmod_event_instance_stop(music.event, false);
}
