var n = irandom(array_length(tv_arr) - 1);
var _tv = tv_arr[n];
with (instance_create(-244, irandom_range(-50, 224), obj_pizzaheadTV_bg))
{
	sprite_index = _tv[0];
	spd = _tv[1];
	depth = _tv[2];
	image_index = irandom(sprite_get_number(sprite_index));
}
alarm[0] = 500;
