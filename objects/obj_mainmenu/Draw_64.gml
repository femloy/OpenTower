if instance_exists(obj_noiseunlocked)
	exit;

draw_set_font(lang_get_font("bigfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(1);

if state == states.titlescreen || (state == states.transition && dark)
	draw_sprite(spr_menudark, 0, 0, 0);

draw_set_alpha(extrauialpha);
var qx = 0;
var qy = 0;
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
lang_draw_sprite(spr_quitgame, 0, qx + cx, qy + cy);
scr_draw_text_arr(qx + 50 + cx, qy + 100 + cy, grab_key);
if instance_exists(obj_fadeout)
{
	draw_set_alpha(obj_fadeout.fadealpha);
	draw_set_color(c_black);
	lang_draw_sprite(spr_quitgame, 0, qx + cx, qy + cy);
	draw_set_alpha(1);
	draw_set_color(c_white);
}
draw_set_alpha(1);

if state == states.bombdelete
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, 0, 0, 0, 0, false);
	draw_set_alpha(1);
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var _str = embed_value_string(lang_get_value_newline("menu_delete"), [string(currentselect + 1)]);
	tdp_draw_text_color(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 30, _str, c_red, c_red, c_red, c_red, 1);
	var w = string_width(_str) / 2;
	var spr = spr_menu_filedelete;
	var ix = index;
	if deletebuffer > 0
	{
		spr = spr_menu_filedelete_lit;
		ix = index * 2.5;
	}
	draw_sprite(spr, ix, (SCREEN_WIDTH / 2) + w + 70, SCREEN_HEIGHT / 2);
	draw_sprite(spr, ix, (SCREEN_WIDTH / 2) - w - 70, SCREEN_HEIGHT / 2);
	var c1 = (deleteselect == 0) ? c_white : c_gray;
	var c2 = (deleteselect == 1) ? c_white : c_gray;
	tdp_draw_text_color((SCREEN_WIDTH / 2) - 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
	tdp_draw_text_color((SCREEN_WIDTH / 2) + 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
	tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
else if state == states.ending
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, 0, 0, 0, 0, false);
	draw_set_alpha(1);
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite(spr_menu_byebye, index, (SCREEN_WIDTH / 2) + 210, SCREEN_HEIGHT / 2);
	draw_sprite(spr_menu_byebye, index, (SCREEN_WIDTH / 2) - 210, SCREEN_HEIGHT / 2);
	tdp_draw_text_color(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 30, lang_get_value("menu_exit"), c_white, c_white, c_white, c_white, 1);
	c1 = (exitselect == 0) ? c_white : c_gray;
	c2 = (exitselect == 1) ? c_white : c_gray;
	tdp_draw_text_color((SCREEN_WIDTH / 2) - 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
	tdp_draw_text_color((SCREEN_WIDTH / 2) + 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
	tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
