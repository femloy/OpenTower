event_inherited();
got_func = function()
{
	if (global.beercutscene == noone || !global.beercutscene)
	{
		global.beercutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "beer", true);
	}
};
if global.beercutscene == noone
	global.beercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beer", false);
if global.beercutscene
	instance_destroy();
if global.pinballcutscene == noone
	global.pinballcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "pinball", false);
if !global.pinballcutscene && !global.levelcomplete
	instance_destroy();
