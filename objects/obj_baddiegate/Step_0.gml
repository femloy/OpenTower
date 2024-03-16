if (active && x != xstart && !place_meeting(xstart, ystart, obj_baddie) && !place_meeting(xstart, ystart, obj_player))
{
	x = xstart;
	y = ystart;
}
else if !active
{
	x = xstart - room_width - 100;
	x = ystart - room_height - 100;
}
