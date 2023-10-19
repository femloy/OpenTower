if (start)
{
	var dir = point_direction(x, y, targetx, targety);
	x = Approach(x, targetx, abs(lengthdir_x(8, dir)));
	y = Approach(y, targety, abs(lengthdir_y(8, dir)));
	if (room == tower_1 && !instance_exists(obj_noisekey))
		targety = -100;
	if (x == targetx && y == targety && (targety >= room_height || targety < 0))
	{
		instance_destroy();
		instance_destroy(obj_micnoise, false);
	}
}
