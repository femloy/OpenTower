event_inherited();
got_func = function()
{
	if (global.bottlecutscene == noone || !global.bottlecutscene)
	{
		global.bottlecutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "bottle", true);
	}
};
if global.bottlecutscene == noone
	global.bottlecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "bottle", false);
if global.bottlecutscene
	instance_destroy();
