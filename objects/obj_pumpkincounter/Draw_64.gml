if !global.option_hud
	exit;
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(global.moneyfont)
draw_sprite(spr_pumpkinsleft, 0, 64, 480)
draw_text_color(64, 480, string(counter), c_white, c_white, c_white, c_white, 1)
