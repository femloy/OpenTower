pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER OF THE WEST";
with (obj_player)
{
	if (targetDoor == "B")
	{
		vsp = 0;
		hsp = 0;
		movespeed = 0;
	}
}
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(function()
	{
		touchedtriggers = 0;
	}, function()
	{
		if (touchedtriggers >= 6)
			secret_open_portal(0);
	});
	secret_add(-4, function()
	{
		secret_open_portal(1);
	});
	secret_add(-4, function()
	{
		if (secret_check_trigger(2))
			secret_open_portal(2);
	});
}
