function cutscene_graveyard_end()
{
	with (obj_player)
	{
		state = states.normal;
		x = backtohubstartx;
		y = backtohubstarty;
	}
	global.levelcomplete = false;
	global.graveyardcutscene = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "graveyard", true);
	cutscene_end_action();
}
