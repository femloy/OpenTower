if (global.vigilantecutscene3 == noone)
	global.vigilantecutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "vigilante3", false);
if (global.vigilantecutscene3)
{
	destroy = false;
	instance_destroy();
}
