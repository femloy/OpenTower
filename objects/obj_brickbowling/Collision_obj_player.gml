if other.ispeppino && other.isgustavo
	exit;
var _dir = other.xscale
with other
{
	move = (key_left + key_right)
	if hsp != 0
		_dir = sign(hsp)
	else if move != 0
		_dir = move
}
with (instance_create(x, y, obj_brickball))
	image_xscale = _dir
instance_destroy()
