draw_set_alpha(blackfade);
draw_rectangle_color(0, 0, room_width, room_height, 0, 0, 0, 0, false);
draw_set_alpha(1);
draw_self();
shader_set(shd_hit);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, fade);
shader_reset();
