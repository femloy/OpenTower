if (sprite_index == spr_player_mach || sprite_index == spr_player_mach4)
{
	if (alarm[1] == -1)
		alarm[1] = 1;
	if (!instance_exists(speedlinesID))
	{
		speedlinesID = instance_create(x, y, obj_introprop);
		speedlinesID.depth = depth - 1;
	}
	else
	{
		speedlinesID.x = x;
		speedlinesID.y = y;
	}
}
