targetRoom = hub_pub;
locked = true;
if (global.pubcutscene == noone)
	global.pubcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "pub", false);
if (global.pubcutscene)
	locked = false;
