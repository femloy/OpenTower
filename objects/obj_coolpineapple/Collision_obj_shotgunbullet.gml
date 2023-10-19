if (state != states.parry && state != states.backbreaker)
	exit;
with (other)
{
	var _maxhsp = abs(spd);
	var _dir = sign(spd);
	if (x != other.x)
		_dir = sign(x - other.x);
	spd = _maxhsp * _dir;
}
if (state != states.parry)
{
	sprite_index = parryspr;
	movespeed = 8;
	state = states.parry;
	image_index = 0;
}
