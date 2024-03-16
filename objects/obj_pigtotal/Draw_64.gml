if (is_bossroom() || instance_exists(obj_achievementviewer) || room == tower_soundtestlevel || room == tower_peppinohouse)
	exit;
if !global.option_hud
	exit;
draw_set_font(global.moneyfont);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
if (state == states.titlescreen || state == states.fall)
	draw_text_color(x, y + add_y, concat("$", global.pigtotal_add), c_lime, c_lime, c_lime, c_lime, 1);
draw_sprite(spr_pigtotal, -1, x, y);
draw_text(x, y, concat("$", string(global.pigtotal - global.pigreduction - global.pigtotal_add)));
