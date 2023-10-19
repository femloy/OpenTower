if (global.farmcutscene == noone)
	global.farmcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "farm", false);
if (global.farmcutscene)
	instance_destroy();
