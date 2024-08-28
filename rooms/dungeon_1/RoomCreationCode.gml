pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER OF HELL!";
gameframe_caption_text = lang_get_value("caption_dungeon");

if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(-4, function()
	{
		secret_open_portal(0);
	});
	secret_add(-4, function()
	{
		secret_open_portal(1);
	});
	secret_add(-4, function()
	{
		secret_open_portal(2);
	});
}
