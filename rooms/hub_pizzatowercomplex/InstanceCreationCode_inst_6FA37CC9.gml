sprite_index = spr_mrstick_idle;
dialog = [dialog_create("alright lets fight", -4, function()
{
	if (!global.mrstickcutscene2)
	{
		global.mrstickcutscene2 = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "mrstick2", true);
	}
})];
if (global.mrstickcutscene1 == noone)
	global.mrstickcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick1", false);
if (!global.mrstickcutscene1)
	instance_destroy();
if (global.mrstickcutscene2 == noone)
	global.mrstickcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick2", false);
if (global.mrstickcutscene2)
	instance_destroy();
