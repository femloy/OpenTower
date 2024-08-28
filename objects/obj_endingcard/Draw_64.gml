if showsprite
	draw_self();
if text != -4
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(global.creditsfont);
	draw_text_color(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, text, c_white, c_white, c_white, c_white, text_alpha);
}
