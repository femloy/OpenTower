targetRoom = space_1;
if (global.desertcutscene == noone)
	global.desertcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "desert", false);
if (!global.desertcutscene)
	instance_destroy();
