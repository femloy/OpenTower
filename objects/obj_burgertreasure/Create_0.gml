event_inherited();
got_func = function()
{
	if (global.burgercutscene == noone || !global.burgercutscene)
	{
		global.burgercutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "burger", true);
	}
};
if global.burgercutscene == noone
	global.burgercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "burger", false);
if global.burgercutscene
	instance_destroy();
if global.golfcutscene == noone
	global.golfcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "golf", false);
if !global.golfcutscene && !global.levelcomplete
	instance_destroy();
