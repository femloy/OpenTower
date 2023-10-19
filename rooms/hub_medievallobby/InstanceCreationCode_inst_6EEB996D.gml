targetRoom = medieval_1;
if (global.chateauswap == noone)
	global.chateauswap = quick_ini_read_real(get_savefile_ini(), "cutscene", "chateauswap", false);
if (global.chateauswap)
	instance_destroy();
