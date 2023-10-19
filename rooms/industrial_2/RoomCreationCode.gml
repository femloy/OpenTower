pal_swap_init_system(shd_pal_swapper);
global.roommessage = "WELCOME TO PIZZA TOWER";
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
}
