hsp = image_xscale * 4;
if grounded
	vsp = -11;
if (place_meeting(x + sign(hsp), y, obj_solid))
	instance_destroy();
scr_collide();
