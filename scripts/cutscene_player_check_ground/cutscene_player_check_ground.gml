function cutscene_player_check_ground(_player)
{
	var player = _player;
	var finish = false;
	with player
	{
		if grounded
			finish = true;
	}
	if finish
		cutscene_end_action();
}
