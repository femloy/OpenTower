if state == states.robotidle
	draw_sprite_ext(spr_puppet_string, 0, x, y, 1, y / sprite_get_height(spr_puppet_string), image_angle, image_blend, image_alpha);
event_inherited();
