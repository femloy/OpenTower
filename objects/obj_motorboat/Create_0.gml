state = states.normal;
dir = 1;
playerxoffset = 0;
if global.beachcutscene == noone
	global.beachcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beach", false);
if !global.beachcutscene
	instance_destroy();
