if other.state == states.knightpep && state == states.pizzahead_enguarde && vsp > 0
{
	hp--;
	other.state = states.normal;
	other.jumpstop = true;
	other.vsp = -11;
	state = states.normal;
}
