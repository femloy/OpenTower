function cutscene_desert_end()
{
	with (obj_player)
	{
		state = states.normal;
		x = backtohubstartx;
		y = backtohubstarty;
	}
	global.levelcomplete = false;
	global.desertcutscene = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "desert", true);
	cutscene_end_action();
}
