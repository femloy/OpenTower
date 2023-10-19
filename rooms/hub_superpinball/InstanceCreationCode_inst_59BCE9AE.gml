locked = true;
targetRoom = hub_superpinball2;
if (global.superpinballcutscene == noone)
	global.superpinballcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "superpinball", false);
if (global.superpinballcutscene)
	locked = false;
