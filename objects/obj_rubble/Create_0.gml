depth = 0;
while (place_meeting(x, y, obj_solid) || place_meeting(x, y, obj_platform))
	y--;
