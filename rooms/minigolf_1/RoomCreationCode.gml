pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
global.gameframe_caption_text = "The most devilish Pizza Tower course";
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(-4, function()
	{
		secret_open_portal(0);
	});
	secret_add(-4, function()
	{
		if (secret_check_trigger(1))
			secret_open_portal(1);
	});
}
