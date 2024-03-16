if golfcooldown <= 0 && state != states.throwing && state != states.stun && state != states.grabbed && other.state != states.golf && other.state != states.grabbed && other.bigcheeseID == noone
{
	golfid = other.id;
	shot = false;
	state = states.throwing;
	sprite_index = spr_golfburger_golf;
	image_index = 0;
	other.bigcheeseID = id;
	if shootdir == 0
		image_xscale *= -1;
	else
		image_xscale = shootdir;
}
