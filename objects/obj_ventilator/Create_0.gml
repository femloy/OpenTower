image_alpha = 0.5;
ventilator_index = 0;
leaves = array_create(0);
draw = false;
var yy = 0;
while (yy < abs(sprite_height))
{
	yy += 32;
	repeat (irandom_range(3, 9))
		scr_ventilator_add_leaf(irandom_range(x, x + sprite_width), y + yy + irandom_range(-10, 10));
}
alarm[0] = 1;
