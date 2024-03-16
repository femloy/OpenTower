image_speed = 0.35;
target = instance_nearest(x, y, obj_baddie);
var _destroy = false;
if (!instance_exists(target))
	_destroy = true;
if !_destroy
{
	with obj_pizzapeppermissile
	{
		if target == other.target && id != other.id
			_destroy = true;
	}
}
if _destroy
{
	instance_destroy();
	with obj_player
		noisepeppermissile = 0;
	exit;
}
fmod_event_one_shot_3d("event:/sfx/playerN/fireball", x, y);
image_angle = point_direction(x, y, target.x, target.y);
direction = image_angle;
speed = 10;
alarm[0] = 1;
depth = -8;
