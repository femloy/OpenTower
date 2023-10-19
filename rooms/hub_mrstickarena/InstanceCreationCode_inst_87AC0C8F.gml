if (global.noisecutscene1 == noone)
	global.noisecutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "noise1", false);
if (!global.noisecutscene1)
	instance_destroy();
targetRoom = boss_noise;
targetDoor = "A";
