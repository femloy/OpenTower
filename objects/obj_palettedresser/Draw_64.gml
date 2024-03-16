if !global.option_hud
	exit;
if obj_player1.ispeppino == ispeppino && alpha > 0
{
	var text = concat(palettetitle, "\n", palettedesc);
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	tdp_draw_text_color(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 16, text, c_white, c_white, c_white, c_white, alpha);
	tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
