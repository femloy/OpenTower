if (obj_player1.ispeppino && !global.swapmode) 
	draw_sprite(spr_mrmooney_house, 0, x, y);
draw_self();
if showmoney
{
	draw_set_font(global.moneyfont);
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	var cx = x;
	var cy = (y - 130) + money_y;
	draw_sprite(spr_stickmoney, 0, cx, cy);
	draw_text(cx + 20, cy, concat(maxscore));
}
