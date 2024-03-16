if state == states.throwing
{
	with golfid
	{
		invincible = false;
		scr_pizzaball_go_to_thrown(image_xscale * 2, -8);
	}
}
event_inherited();
