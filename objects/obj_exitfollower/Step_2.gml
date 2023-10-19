var _x = x;
var _y = y;
event_inherited();
if (x != _x || y != _y)
	sprite_index = walkspr;
else
	sprite_index = idlespr;
visible = obj_player1.visible;
if (room == timesuproom)
	visible = false;
