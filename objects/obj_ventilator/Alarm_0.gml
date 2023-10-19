repeat (irandom_range(3, 9))
	instance_create(irandom_range(x, x + sprite_width), ((y + sprite_height) - 16) + irandom_range(-10, 10), obj_ventilatorleaf);
alarm[0] = irandom_range(15, 20);
