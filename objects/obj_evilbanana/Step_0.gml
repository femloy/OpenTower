scr_collide();
if (scr_solid(x, y + 1))
	hsp = 0;
if (banana == 2 || !instance_exists(baddieID))
	instance_destroy();
