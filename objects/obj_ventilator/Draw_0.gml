var xs = sign(image_xscale);
for (var i = 0; i < (abs(sprite_width) / 64); i++)
	draw_sprite(spr_ventilator, ventilator_index, x + (i * xs * 64), (y + sprite_height) - 32);
if draw
{
	for (i = 0; i < array_length(leaves); i++)
	{
		with leaves[i]
			draw_sprite_ext(spr_ventilatorleaf, image_index, x, y, 1, 1, 0, c_white, image_alpha);
	}
}
