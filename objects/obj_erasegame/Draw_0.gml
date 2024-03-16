draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_font(lang_get_font("bigfont"));
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(SCREEN_WIDTH / 2, 200, "ARE YOU SURE?");
if optionselected == 0
	draw_text_colour((SCREEN_WIDTH / 2) - 80, 300, "NO", c_white, c_white, c_white, c_white, 1);
else
	draw_text_colour((SCREEN_WIDTH / 2) - 80, 300, "NO", c_white, c_white, c_white, c_white, 0.5);
if optionselected == 1
	draw_text_colour((SCREEN_WIDTH / 2) + 80, 300, "YES", c_white, c_white, c_white, c_white, 1);
else
	draw_text_colour((SCREEN_WIDTH / 2) + 80, 300, "YES", c_white, c_white, c_white, c_white, 0.5);
