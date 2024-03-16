if press >= 8 && drop == 0
{
	obj_player.image_index = 0;
	obj_player.alarm[8] = 60;
	obj_player.state = states.hurt;
	drop = true;
	closed = false;
}
if closed == 1
	y = obj_player.y;
if drop == 1
{
	if (place_meeting(x + floor(hsp), y, obj_null))
	{
		x = floor(x);
		while (!place_meeting(x + sign(hsp), y, obj_null))
			x += sign(hsp);
		hsp = 0;
	}
	x += hsp;
	if (place_meeting(x, y + floor(vsp), obj_null))
	{
		y = floor(y);
		while (!place_meeting(x, y + sign(vsp), obj_null))
			y += sign(vsp);
		vsp = 0;
	}
	y += floor(vsp);
	if vsp < 20
		vsp += grav;
}
