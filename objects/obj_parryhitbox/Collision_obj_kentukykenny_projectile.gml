with (other)
{
	var _dir = sign(image_xscale);
	_dir = -image_xscale;
	if (!other.collisioned)
		obj_player1.xscale = _dir;
	image_xscale = _dir;
}
if (!collisioned)
	event_user(0);
