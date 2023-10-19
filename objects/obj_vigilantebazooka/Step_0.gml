hsp = spd * image_xscale;
vsp = spd;
x += hsp;
y += vsp;
if (y > (room_height - 124))
	instance_destroy();
