var _x = irandom_range(obj_player1.x - 200, obj_player1.x + 200);
_x = clamp(_x, 100, room_width - 100);
with (instance_create(_x, room_height + 100, obj_forknight_pizzahead))
	vsp = -irandom_range(18, 26);
alarm[0] = 40;
