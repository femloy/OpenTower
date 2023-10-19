if (global.peppermancutscene1 == noone)
	global.peppermancutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "pepperman1", false);
if (!global.peppermancutscene1)
	instance_destroy();
targetRoom = boss_pepperman;
