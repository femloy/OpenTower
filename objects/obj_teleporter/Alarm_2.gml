with obj_teleporter
{
	if trigger == other.trigger && start == 0
	{
		obj_pizzaball.x = x;
		obj_pizzaball.y = y - 20;
	}
}
alarm[3] = 10;
