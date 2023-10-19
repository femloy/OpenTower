if (!landed)
	image_speed = 0;
else
{
	image_speed = 0.35;
	if (!fmod_event_instance_is_playing(snd))
		fmod_event_instance_play(snd);
	fmod_event_instance_set_3d_attributes(snd, x, y);
}
if (grounded && vsp > 0)
{
	if (!landed)
	{
		landed = true;
		if (x != obj_player1.x)
			image_xscale = sign(obj_player1.x - x);
	}
	hsp = image_xscale * 4;
}
if (!landed)
	scr_collide();
else
	x += hsp;
