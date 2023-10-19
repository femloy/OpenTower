if (global.peppermancutscene1 == noone)
	global.peppermancutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "pepperman1", false);
if (global.peppermancutscene2 == noone)
	global.peppermancutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "pepperman2", false);
if (global.peppermancutscene2)
	instance_destroy();
