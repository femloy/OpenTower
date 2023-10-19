if (state != states.throwing && (other.hsp != 0 || other.thrown || other.state == states.tumble))
{
	pizzaball = true;
	golfid = other.id;
	shot = false;
	state = states.throwing;
	other.bigcheeseID = id;
	other.sprite_index = spr_pizzaball_roll;
	sprite_index = spr_bigcheese_throw;
	image_index = 0;
	depth = -10;
}
