sprite_index = spr_playerN_idle;
n_dialog[0] = [dialog_create("fight the noise", -4, function()
{
	if (!global.noisecutscene1)
	{
		global.noisecutscene1 = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "noise1", true);
	}
})];
n_dialog[1] = [dialog_create("you fought the noise")];
dialog_func = function()
{
	if (!global.noisecutscene2)
		do_dialog(n_dialog[0]);
	else
		do_dialog(n_dialog[1]);
};
