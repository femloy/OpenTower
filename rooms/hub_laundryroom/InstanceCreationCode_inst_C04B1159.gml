if (global.factorycutscene == noone)
	global.factorycutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "factory", false);
if (global.factorycutscene)
	electricity = true;
