event_inherited();
got_func = function()
{
	if (global.gasolinecutscene == noone || !global.gasolinecutscene)
	{
		global.gasolinecutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "gasoline", true);
	}
};
if global.gasolinecutscene == noone
	global.gasolinecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "gasoline", false);
if global.gasolinecutscene
	instance_destroy();
if global.mansioncutscene == noone
	global.mansioncutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "mansion", false);
if !global.mansioncutscene && !global.levelcomplete
	instance_destroy();
