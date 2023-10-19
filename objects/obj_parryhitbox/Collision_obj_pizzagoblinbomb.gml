var b = false;
var p = (player_id == 1) ? obj_player1.id : obj_player2.id;
with (other)
{
	if (defused)
	{
		b = true;
		var current_hspd = abs(hsp);
		var _dir = sign(hsp);
		if (_dir == 0)
			_dir = image_xscale;
		image_xscale = -_dir;
		if (!other.collisioned)
			obj_player1.xscale = -_dir;
		if (current_hspd == 0)
		{
			image_xscale = p.xscale;
			hsp = image_xscale * 6;
			vsp = -5;
		}
		else
			hsp = _dir * current_hspd;
	}
}
if (b && !collisioned)
{
	lethal = false;
	event_user(0);
}
