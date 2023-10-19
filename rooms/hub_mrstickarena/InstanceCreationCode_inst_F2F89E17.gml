if (global.vigilantecutscene1 == noone)
	global.vigilantecutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "vigilante1", false);
if (!global.vigilantecutscene1)
	instance_destroy();
targetRoom = boss_vigilante;
targetDoor = "A";
