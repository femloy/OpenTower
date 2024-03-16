repeat 3
	create_debris(x + 16, y, spr_wooddebris);
with (instance_create(startx, starty, obj_hookup))
	appear = 50;
destroy_sounds([snd]);
