if state != states.pizzaheadjump
{
	if (y > (room_height + 100))
		instance_destroy();
	if (x > (room_width * 2) || x < -room_width)
		instance_destroy();
}
