if (global.levelcomplete && !global.graveyardcutscene)
{
	with (obj_player1)
	{
		other.backx = backtohubstartx;
		other.backy = backtohubstarty;
	}
	scene_info = [[cutscene_graveyard_end], [cutscene_save_game]];
}
else if (global.levelcomplete)
{
	global.levelcomplete = false;
	scene_info = [[cutscene_save_game]];
}
else
	scene_info = [[cutscene_wait, 20]];
