if (global.mrstickcutscene2 == noone)
	global.mrstickcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick2", false);
if (!global.mrstickcutscene2)
	instance_destroy();
targetRoom = boss_mrstick;
targetDoor = "A";
