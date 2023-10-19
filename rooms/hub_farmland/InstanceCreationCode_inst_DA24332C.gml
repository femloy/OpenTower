if (global.vigilantecutscene2 == noone)
	global.vigilantecutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "vigilante2", false);
if (global.vigilantecutscene2)
	instance_destroy();
