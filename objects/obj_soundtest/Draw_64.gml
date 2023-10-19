draw_set_font(global.tutorialfont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite(spr_nowplaying, image_index, SCREEN_WIDTH / 2, 0);
draw_text_color(SCREEN_WIDTH / 2, 66, music_arr[music_pos][1], c_black, c_black, c_black, c_black, 1);
