sprite_index = spr_soldier_walk;
g_dialog[0] = [dialog_create("Don't have anything to do")];
g_dialog[1] = [dialog_create("The robot is busted", -4, function()
{
	if (!global.mrstickcutscene1)
	{
		global.mrstickcutscene1 = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "mrstick1", true);
	}
})];
g_dialog[2] = [dialog_create("The robot has no gasoline")];
g_dialog[3] = [dialog_create("Go right ahead", -4, function()
{
	if (!global.ghostsoldiercutscene)
	{
		global.ghostsoldiercutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "ghostsoldier", true);
	}
	with (obj_pizzamech)
		poweredon = true;
})];
dialog_func = function()
{
	if (!global.kidspartycutscene)
		do_dialog(g_dialog[0]);
	else if (!global.mrstickcutscene1 || !global.mrstickcutscene2 || !global.mrstickcutscene3)
		do_dialog(g_dialog[1]);
	else if (!global.gasolinecutscene)
		do_dialog(g_dialog[2]);
	else
		do_dialog(g_dialog[3]);
};
if (global.kidspartycutscene == noone)
	global.kidspartycutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "kidsparty", false);
if (global.mrstickcutscene1 == noone)
	global.mrstickcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick1", false);
if (global.mrstickcutscene2 == noone)
	global.mrstickcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick2", false);
if (global.mrstickcutscene3 == noone)
	global.mrstickcutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "mrstick3", false);
if (global.gasolinecutscene == noone)
	global.gasolinecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "gasoline", false);
if (global.chateaucutscene == noone)
	global.chateaucutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "chateau", false);
if (!global.chateaucutscene)
	instance_destroy();
if (global.ghostsoldiercutscene == noone)
	global.ghostsoldiercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "ghostsoldier", false);
if (global.ghostsoldiercutscene)
	instance_destroy();
