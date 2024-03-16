if draw
{
	repeat (irandom_range(3, 9))
		scr_ventilator_add_leaf(irandom_range(x, x + sprite_width), ((y + sprite_height) - 16) + irandom_range(-10, 10));
}
alarm[0] = irandom_range(15, 20);
