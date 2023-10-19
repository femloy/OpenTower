alarm[0] = 5;
with (obj_camera)
{
	shake_mag = 4;
	shake_mag_acc = 3 / room_speed;
}
var _x1 = bbox_left;
var _x2 = bbox_right;
var _y = (y_to - sprite_yoffset) + sprite_height;
repeat (irandom_range(1, 2))
{
	with (create_debris(irandom_range(_x1, _x2), _y, spr_towerblockdebris, true))
		vsp = -irandom_range(5, 11);
}
instance_create(irandom_range(_x1, _x2), _y - 20, obj_gusbrickcloud);
