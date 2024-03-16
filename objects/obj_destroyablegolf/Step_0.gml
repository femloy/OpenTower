with obj_pizzaball
{
	with (instance_place(x + hsp, y, other))
		instance_destroy();
	with (instance_place(x, y + vsp, other))
		instance_destroy();
}
