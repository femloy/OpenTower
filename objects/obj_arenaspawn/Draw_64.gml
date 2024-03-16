draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(global.bigfont);
if state == states.arenaround
	draw_text(random_range(1, -1) + (SCREEN_WIDTH / 2), random_range(1, -1) + 500, "ROUND " + string(wave + 1));
