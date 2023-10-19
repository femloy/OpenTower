pal_swap_init_system(shd_pal_swapper);
global.roommessage = "WELCOME TO PIZZA TOWER";
with (obj_secretbigblock)
	particlespr = spr_factorydebris;
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
