var _magnet = false;
with obj_magnet
{
	if ballID == other.id
		_magnet = true;
}
if !_magnet && state != states.golf && state != states.hit && state != states.grabbed && bigcheeseID == noone
{
	x = obj_player1.x;
	y = obj_player1.y;
}
