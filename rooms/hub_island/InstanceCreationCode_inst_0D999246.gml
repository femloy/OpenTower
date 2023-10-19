if (global.beachboatcutscene == noone)
	global.beachboatcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beachboat", false);
if (global.beachboatcutscene)
	y = 576;
