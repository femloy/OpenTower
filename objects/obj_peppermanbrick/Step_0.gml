if vsp < 20
	vsp += grav;
y += vsp;
if (y > (room_height + sprite_width))
	instance_destroy();
