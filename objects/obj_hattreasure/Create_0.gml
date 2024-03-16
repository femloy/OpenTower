event_inherited();
got_func = function()
{
	if (global.hatcutscene2 == noone || !global.hatcutscene2)
	{
		global.hatcutscene2 = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "hat2", true);
	}
};
if global.hatcutscene1 == noone
	global.hatcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat1", false);
if !global.hatcutscene1
	instance_destroy();
if global.hatcutscene2 == noone
	global.hatcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat2", false);
if global.hatcutscene2
	instance_destroy();
