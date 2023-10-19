event_inherited();
dialog[0] = dialog_create("Have my motorcycle lol", -4, function()
{
	if (global.chieftaincutscene == noone || !global.chieftaincutscene)
	{
		global.chieftaincutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "chieftain", true);
	}
});
