if destroy
{
	global.factoryblock = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "factoryblock", true);
	repeat 4
		create_debris(x + 32, y + 32, spr_bombdebris);
}
