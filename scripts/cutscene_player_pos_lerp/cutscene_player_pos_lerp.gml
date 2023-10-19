function cutscene_player_pos_lerp(_x, _y, _amount)
{
	var _finish = false;
	with (obj_player)
	{
		hsp = 0;
		vsp = 0;
		if (object_index != obj_player2 || global.coop)
		{
			x = lerp(x, _x, _amount);
			y = lerp(y, _y, _amount);
			if (x > (_x - 4) && x < (x + 4) && y > (_y - 4) && y < (_y + 4))
				_finish = true;
		}
	}
	if (_finish)
		cutscene_end_action();
}
