event_inherited();
got_func = function()
{
	if (global.graffiticutscene == noone || !global.graffiticutscene)
	{
		global.graffiticutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "graffiti", true);
	}
};
if global.graffiticutscene == noone
	global.graffiticutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "graffiti", false);
if global.graffiticutscene
	instance_destroy();
if global.streetcutscene == noone
	global.streetcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "street", false);
if !global.streetcutscene && !global.levelcomplete
	instance_destroy();
