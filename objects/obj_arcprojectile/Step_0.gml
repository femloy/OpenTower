x += hsp;
y += vsp;
fmod_event_instance_set_3d_attributes(snd, x, y);
if (vsp < 10)
	vsp += grav;
