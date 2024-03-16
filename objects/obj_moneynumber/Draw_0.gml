draw_set_font(global.moneyfont);
draw_set_halign(fa_center);
var c = 65280;
draw_set_color(c);
if flash
	shader_set(shd_hit);
draw_text(x, y, number);
if flash
	shader_reset();
