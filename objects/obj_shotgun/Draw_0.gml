draw_self();
if (grounded && !place_meeting(x, y, obj_solid))
	draw_sprite_ext(spr_grabicon, grabindex, x - 8, y - 50, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
