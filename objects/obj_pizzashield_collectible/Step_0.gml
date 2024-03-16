if global.collectsound < 10
	global.collectsound += 1;
if global.timeattack == 1
	instance_destroy();
if (place_meeting(x, y, obj_destructibles))
	depth = 102;
else
	depth = 2;
