function cutscene_medieval_end()
{
	instance_destroy(obj_actor);
	with obj_player
	{
		if (object_index != obj_player2 || global.coop)
		{
			state = states.normal;
			x = backtohubstartx;
			y = backtohubstarty;
		}
	}
	global.levelcomplete = false;
	global.medievalcutscene = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "medieval", true);
	cutscene_end_action();
}
