if levelselect == 1
{
	draw_set_font(global.bigfont);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(x, y, level[b]);
	draw_text(x, y + 40, "PRESS UP AND DOWN TO\n SELECT THE LEVEL");
}
draw_self();
