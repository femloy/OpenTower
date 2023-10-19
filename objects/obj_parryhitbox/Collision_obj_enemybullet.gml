with (other)
{
	var current_hspd = abs(hsp);
	var _dir = sign(hsp);
	_dir = -image_xscale;
	if (!other.collisioned)
		obj_player1.xscale = _dir;
	image_xscale = _dir;
	hsp = _dir * current_hspd;
}
if (!collisioned)
	event_user(0);
