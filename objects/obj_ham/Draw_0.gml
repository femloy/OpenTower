draw_self();
if (!unpickable && grounded && !place_meeting(x, y, obj_solid))
	draw_sprite_ext(spr_grabicon, -1, x - (2 * image_xscale), y - 30, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
