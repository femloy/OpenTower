function cutscene_set_player_pos(_x, _y)
{
	with (obj_player)
	{
		if (object_index != obj_player2 || global.coop)
		{
			x = _x;
			y = _y;
		}
	}
	cutscene_end_action();
}
