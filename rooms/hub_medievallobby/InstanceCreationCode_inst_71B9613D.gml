if (global.ruincutscene3 == noone)
	global.ruincutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "ruin3", false);
if (global.ruincutscene3)
{
	destroy = false;
	instance_destroy();
}
