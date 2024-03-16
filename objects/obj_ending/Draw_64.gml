if state == 3
{
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	scr_draw_text_arr(16, SCREEN_HEIGHT - 48, skiptext);
}
