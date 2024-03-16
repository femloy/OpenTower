with other
{
	if !parried
	{
		if dir != 0
		{
			var _dir = dir;
			_dir = -dir;
			obj_player1.xscale = _dir;
			dir = _dir;
			parried = true;
		}
		else
		{
			dir = obj_player1.xscale;
			if x != obj_player1.x
				dir = sign(obj_player1.x - x);
			obj_player1.xscale = dir;
			parried = true;
			vsp = -3;
		}
	}
}
if !collisioned
	event_user(0);
