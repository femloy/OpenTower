if (global.dungeoncutscene == noone)
	global.dungeoncutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "dungeon", false);
if (global.dungeoncutscene)
{
	destroy = false;
	instance_destroy();
}
