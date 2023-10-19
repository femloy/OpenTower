var shakex = 0;
if (touched == 1)
	shakex = random_range(-3, 3);
draw_sprite(sprite_index, image_index, x + shakex, y);
