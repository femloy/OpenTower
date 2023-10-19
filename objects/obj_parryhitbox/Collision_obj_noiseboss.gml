var state = other.state;
var hsp = other.hsp;
if (((state == states.mach2 && hsp != 0) || (state == states.pizzahead_spinningkick && other.image_index > 3) || (state == states.freefall && !other.grounded) || state == states.machslide || state == states.pogo || state == states.jetpack || state == states.bounce) && !collisioned)
	event_user(0);
