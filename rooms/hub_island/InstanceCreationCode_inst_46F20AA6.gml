sprite_index = spr_pepperman_idle;
pm_dialog[0] = [dialog_create("Seems you don't have either a bottle or a piece of paper.")];
pm_dialog[1] = [dialog_create("Beach     boat")];
pm_scene_info = [[cutscene_do_dialog, [dialog_create("Here you go")]], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [cutscene_set_object_pos, inst_0D999246, 1696, 576], [cutscene_do_dialog, [dialog_create("Go ahead", -4, function()
{
	
})]]];
dialog_func = function()
{
	if (!global.bottlecutscene || !global.papercutscene)
		do_dialog(pm_dialog[0]);
	else if (global.beachboatcutscene == noone || !global.beachboatcutscene)
	{
		do_dialog_cutscene(pm_scene_info);
		global.beachboatcutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "beachboat", true);
	}
	else
		do_dialog(pm_dialog[1]);
};
if (global.bottlecutscene == noone)
	global.bottlecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "bottle", false);
if (global.papercutscene == noone)
	global.papercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "paper", false);
if (global.beachboatcutscene == noone)
	global.beachboatcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beachboat", false);
if (global.beachcutscene == noone)
	global.beachcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beach", false);
if (global.beachcutscene)
	instance_destroy();
