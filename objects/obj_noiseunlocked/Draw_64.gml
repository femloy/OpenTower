draw_sprite(spr_noiseunlocked_bg, 0, x, y);
lang_draw_sprite(sprite_index, image_index, x, y);
draw_set_alpha(fade);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
