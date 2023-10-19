if (place_meeting(x + hsp, y, obj_solid))
	hsp *= -1;
scr_collide();
if (global.timeattack == 1)
	instance_destroy();
if (place_meeting(x, y, obj_destructibles))
	depth = 102;
else
	depth = 2;
