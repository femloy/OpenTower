if (global.vigilantecutscene3 == noone)
	global.vigilantecutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "vigilante3", false);
if (!global.vigilantecutscene3)
	instance_destroy();
if (global.hatcutscene1 == noone)
	global.hatcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat1", false);
if (global.hatcutscene2 == noone)
	global.hatcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat2", false);
if (global.hatcutscene3 == noone)
	global.hatcutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat3", false);
sprite_index = spr_playerV_idle;
v_dialog[0] = [dialog_create("wash my darn hat", -4, function()
{
	if (global.hatcutscene1 == noone || !global.hatcutscene1)
	{
		global.hatcutscene1 = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "hat1", true);
	}
})];
v_dialog[1] = [[cutscene_do_dialog, [dialog_create("there you go, a jetpack")]], [function()
{
	if (!instance_exists(obj_noisejetpack))
		instance_create(498, 952, obj_noisejetpack);
}]];
v_dialog[2] = [dialog_create("you washed my darn hat")];
dialog_func = function()
{
	if (!global.hatcutscene1 || !global.hatcutscene3)
		do_dialog(v_dialog[0]);
	else if (global.hatcutscene3)
		do_dialog_cutscene(v_dialog[1]);
};
