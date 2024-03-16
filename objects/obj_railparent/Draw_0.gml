if draw
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	if use_left
		draw_sprite_ext(spr_left, image_index, x, y, sign(image_xscale), image_yscale, image_angle, image_blend, image_alpha);
	if use_right
		draw_sprite_ext(spr_right, image_index, bbox_right - 32, y, sign(image_xscale), image_yscale, image_angle, image_blend, image_alpha);
}
