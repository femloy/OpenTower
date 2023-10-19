if (state == states.hit)
{
	x = hitX + irandom_range(-4, 4);
	y = hitY + irandom_range(-1, 1);
	if (hitLag > 0)
		hitLag--;
	else
	{
		x = hitX;
		y = hitY;
		state = states.spaceshuttle;
		movespeed = 1;
	}
}
else if (state == states.spaceshuttle)
{
	x = hitX + irandom_range(-2, 2);
	depth = -100;
	sprite_index = spr_shuttlemove;
	movespeed = Approach(movespeed, 10, 0.1);
	y -= movespeed;
	if (y < (camera_get_view_y(view_camera[0]) - 236) && !instance_exists(obj_spaceshuttlecutscene))
	{
		with (obj_player)
		{
			targetRoom = other.targetRoom;
			targetDoor = "ROCKET";
		}
		instance_create(0, 0, obj_spaceshuttlecutscene);
	}
}
