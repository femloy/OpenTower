if (destroy)
{
	global.ruincutscene3 = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "ruin3", true);
	repeat (4)
		create_debris(x + 32, y + 32, spr_bombdebris);
}
