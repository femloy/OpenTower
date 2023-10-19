x += movespeed;
if (scr_solid(x, y) || !grounded)
	instance_destroy();
