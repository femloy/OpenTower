for (var i = 0; i < abs(image_xscale); i++)
	draw_sprite_ext(sprite_index, image_index, x + (32 * i), y, 1, image_yscale, image_angle, image_blend, image_alpha);
if (!place_meeting(x - 1, y, obj_solid))
	draw_sprite_ext(spr_left, image_index, x, y, sign(image_xscale), image_yscale, image_angle, image_blend, image_alpha);
if (!place_meeting(x + 1, y, obj_solid))
	draw_sprite_ext(spr_right, image_index, (x + sprite_width) - 32, y, sign(image_xscale), image_yscale, image_angle, image_blend, image_alpha);
