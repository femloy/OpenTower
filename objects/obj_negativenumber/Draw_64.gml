if !global.option_hud
	exit;

draw_set_font(global.moneyfont);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_alpha(image_alpha);
var c = 255;
draw_set_color(c);
draw_text(x, y + obj_camera.hud_posY, number);
draw_set_alpha(1);
draw_set_color(c_white);
