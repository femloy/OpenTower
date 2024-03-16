destroy = false;
if global.factoryblock == noone
	global.factoryblock = quick_ini_read_real(get_savefile_ini(), "cutscene", "factoryblock", false);
if global.factoryblock
{
	destroy = false;
	instance_destroy();
}
