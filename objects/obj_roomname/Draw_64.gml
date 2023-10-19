if (room == Mainmenu || room == tower_soundtest)
	exit;
draw_set_font(lang_get_font("smallfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_sprite(spr_roomnamebg, 0, xi, yi);
draw_text(xi, yi, msg);
