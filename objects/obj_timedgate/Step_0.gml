if (global.timedgatetimer)
{
	activated = false;
	x = -100;
	y = -100;
}
else if (!activated && !place_meeting(xstart, ystart, obj_player) && !place_meeting(xstart, ystart, obj_weeniemount))
{
	activated = true;
	x = xstart;
	y = ystart;
}
