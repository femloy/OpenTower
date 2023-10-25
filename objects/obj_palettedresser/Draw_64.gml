if (!global.option_hud)
	exit;
if (alpha > 0)
{
	var text = concat(palettetitle, "\n", palettedesc);
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_color(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 16, text, c_white, c_white, c_white, c_white, alpha);
}
