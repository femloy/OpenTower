image_alpha = 0.5;
ventilator_index = 0;
var yy = 0;
while (yy < abs(sprite_height))
{
	yy += 32;
	repeat (irandom_range(3, 9))
		instance_create(irandom_range(x, x + sprite_width), y + yy + irandom_range(-10, 10), obj_ventilatorleaf);
}
alarm[0] = 1;
