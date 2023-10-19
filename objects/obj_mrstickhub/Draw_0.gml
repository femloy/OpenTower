draw_self();
if (place_meeting(x, y, obj_player))
{
	draw_set_color(c_white);
	var txt = concat(maxscore);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_color(x, y - 48, txt, c_lime, c_lime, c_lime, c_lime, 1);
}
