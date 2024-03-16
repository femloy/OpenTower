var _x1 = room_width;
var _x2 = 0;
with obj_cowstampede
{
	if x < _x1
		_x1 = x;
	if x > _x2
		_x2 = x;
}
instance_create(random_range(_x1, _x2), 448, obj_stampedecloud);
alarm[0] = random_range(20, 70);
