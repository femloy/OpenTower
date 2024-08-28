if state == 3
{
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	global.tdp_text_try_outline = true;
	scr_draw_text_arr(16, SCREEN_HEIGHT - 48, skiptext);
	global.tdp_text_try_outline = false;
	tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
