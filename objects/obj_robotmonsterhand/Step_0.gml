if (!instance_exists(baddieID))
{
	touched_player = false;
	instance_destroy();
	exit;
}
hsp = lengthdir_x(movespeed, angle);
vsp = lengthdir_y(movespeed, angle);
if (turn == 0 && point_distance(x, y, xstart, ystart) > length)
	turn = 1;
if (turn == 1)
{
	angle = point_direction(x, y, baddieID.x, baddieID.y);
	if (place_meeting(x, y, baddieID) && turn == 1)
	{
		with (baddieID)
		{
			if (fake && touched)
				instance_destroy();
			state = states.chase;
			throw_inst = -4;
		}
		touched_player = false;
		instance_destroy();
	}
}
x += hsp;
y += vsp;
