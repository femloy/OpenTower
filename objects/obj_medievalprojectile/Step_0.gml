y += vsp;
if (vsp < 20)
	vsp += grav;
if (vsp > 0 && y > (room_height + 200))
	instance_destroy();
fmod_event_instance_set_3d_attributes(snd, x, y);
