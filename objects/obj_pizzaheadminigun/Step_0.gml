x += hsp;
y += vsp;
if (vsp < 20)
	vsp += grav;
if (y > (room_height + 100))
	instance_destroy();
