for (var i = 0; i < abs(image_yscale); i++)
	draw_sprite(sprite_index, image_index, x, y + (32 * i * sign(image_yscale)));
