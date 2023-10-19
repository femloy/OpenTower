function cutscene_set_player_visible(enable)
{
	with (obj_player)
		visible = enable;
	cutscene_end_action();
}
