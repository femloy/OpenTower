function cutscene_player_float(enable)
{
	with obj_player
		float = enable;
	cutscene_end_action();
}
