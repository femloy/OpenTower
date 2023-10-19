var robot_pos = monster_pos[0];
if (room_place(robot_pos.x, robot_pos.y) != room_get_name(room))
{
	var _h = monster_dir[0].x;
	if (_h == 0)
		_h = choose(-1, 1);
	if (sound_pos.x != -1 && sound_pos.y != -1 && sound_pos.y == robot_pos.y && robot_pos.x != sound_pos.x)
		_h = (sound_pos.x < robot_pos.x) ? -1 : 1;
	if (grid_meeting(robot_pos.x + _h, robot_pos.y))
		robot_pos.x += _h;
	else
		_h *= -1;
	monster_dir[0].x = _h;
	if (room_place(robot_pos.x, robot_pos.y) == room_get_name(room))
		robot_create(true, false);
	if (sound_pos.x == robot_pos.x && sound_pos.y == robot_pos.y)
	{
		sound_buffer = 0;
		with (obj_robotmonster)
		{
			investigatestate = 0;
			state = states.robotinvestigate;
		}
	}
}
