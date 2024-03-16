function cutscene_dungeon_end()
{
	with obj_player
	{
		state = states.normal;
		x = backtohubstartx;
		y = backtohubstarty;
	}
	global.levelcomplete = false;
	global.dungeoncutscene = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "dungeon", true);
	cutscene_end_action();
}
