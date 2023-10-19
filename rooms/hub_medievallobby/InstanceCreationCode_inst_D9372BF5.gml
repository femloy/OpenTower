y_to = 1344;
if (global.medievalcutscene == noone)
	global.medievalcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "medieval", false);
if (global.medievalcutscene)
	y = y_to;
