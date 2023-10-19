if (place_meeting(x, y + vsp, obj_solid))
	vsp *= -1;
if (place_meeting(x + hsp, y, obj_solid))
	hsp *= -1;
x += hsp;
y += vsp;
