var accel = 2;
with obj_player
{
	if (room == rank_room && check_player_coop())
	{
		var cx = camera_get_view_x(view_camera[0]);
		var cy = camera_get_view_y(view_camera[0]);
		var tx = cx + (SCREEN_WIDTH / 2);
		if object_index == obj_player2
			tx += 100;
		var ty = cy + (SCREEN_HEIGHT / 2);
		var dir = point_direction(x, y, tx, ty);
		var lx = lengthdir_x(accel, dir);
		var ly = lengthdir_y(accel, dir);
		x = Approach(x, tx, abs(lx));
		y = Approach(y, ty, abs(ly));
	}
}
obj_camera.visible = false;
if fadealpha > 1
{
	fadein = true;
	if room != rank_room
		room = rank_room;
}
if fadein == 0
	fadealpha += 0.1;
else if fadein == 1
	fadealpha -= 0.1;
