var p = (player_id == 1) ? obj_player1.id : obj_player2.id;
var xs = p.xscale;
with (other)
{
	image_xscale *= -1;
	team = 1;
	xs = image_xscale;
}
if (!collisioned)
{
	with (p)
		xscale = xs;
	event_user(0);
}
