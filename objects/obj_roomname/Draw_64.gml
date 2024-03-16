if (room == Mainmenu || room == tower_soundtest || room == tower_soundtestlevel)
	exit;
if !global.option_hud
	exit;
draw_set_font(lang_get_font("smallfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_sprite(spr_roomnamebg, 0, xi, yi);
var yp = 17;
if (lang_get_value("use_ttf"))
	yp = 22;
tdp_draw_text(xi, yi + yp, msg);
tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
