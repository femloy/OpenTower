if cooldown > 0
	cooldown--;
if (place_meeting(x + hsp, y, obj_solid))
	hsp *= -1;
if hit
	angle += spinspeed;
if grounded && vsp > 0 && hit
	instance_destroy();
scr_collide();
