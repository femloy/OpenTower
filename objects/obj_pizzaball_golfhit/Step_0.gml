with (obj_pizzaball)
	other.primoburg = golfhit[0];
if (instance_exists(obj_pizzaball))
	hit = global.golfhit;
if (state == states.normal)
{
	y = Approach(y, SCREEN_HEIGHT, 5);
	if (!instance_exists(obj_pizzaball))
		state = states.dead;
}
else
{
	var ty = SCREEN_HEIGHT + sprite_height;
	y = Approach(y, ty, 7);
	if (instance_exists(obj_pizzaball))
		state = states.normal;
	else if (y >= ty)
		instance_destroy();
}
