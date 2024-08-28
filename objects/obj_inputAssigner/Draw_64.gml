var _halign = draw_get_halign();
var _valign = draw_get_halign();
draw_set_halign(fa_center);
draw_set_halign(fa_center);
draw_set_alpha(1);
draw_set_color(c_white);
if !deactivated
{
	draw_set_font(lang_get_font("bigfont"));
	if press_start
	{
		var _txt = "PRESS START";
		draw_text(SCREEN_WIDTH / 2, 298, _txt);
	}
}
else
{
	draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
	draw_set_font(lang_get_font("smallfont"));
	_txt = lang_get_value("menu_controller_disconnected");
	_txt = string_replace_all(_txt, "%", lang_get_value("start_button_steam")); // start_button_switch?
	_txt = string_replace_all(_txt, "\\n", "\n");
	var _h = string_height(_txt) / 2;
	tdp_draw_text(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - _h, _txt);
}
tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
draw_set_halign(_halign);
draw_set_halign(_valign);
