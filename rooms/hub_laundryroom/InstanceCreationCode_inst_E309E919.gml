if (global.sewercutscene == noone)
	global.sewercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "sewer", false);
if (global.sewercutscene)
	instance_destroy();
