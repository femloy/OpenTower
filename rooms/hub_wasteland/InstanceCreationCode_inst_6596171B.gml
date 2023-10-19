if (global.chieftaincutscene2 == noone)
	global.chieftaincutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "chieftain2", false);
if (global.chieftaincutscene2)
	instance_destroy();
