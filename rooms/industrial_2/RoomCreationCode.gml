pal_swap_init_system(shd_pal_swapper)
global.roommessage = "WELCOME TO PIZZA TOWER"
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = 1
	secret_add(-4, function() //anon_gml_Room_industrial_2_Create_189_gml_Room_industrial_2_Create
	{
		secret_open_portal(0)
	}
)
	secret_add(-4, function() //anon_gml_Room_industrial_2_Create_277_gml_Room_industrial_2_Create
	{
		secret_open_portal(1)
	}
)
}
