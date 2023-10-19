if (state == states.duel && duelphase == 0 && !instance_exists(obj_vigilante_duelintro))
{
	draw_set_font(global.bigfont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, "GET READY\nTO PRESS GRAB");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
