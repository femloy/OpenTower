draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(lang_get_font("bigfont"));

var _levelinfo = level_array[selected_world][selected_level];
draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, concat(world_array[selected_world], "\n", selected_level + 1, ". ", _levelinfo[0]));

var xx = 355;
var yy = 380;
var c = c_white;
ini_open_from_string(obj_savesystem.ini_str);
draw_text(SCREEN_WIDTH / 2, yy - 38, ini_read_real("Highscore", _levelinfo[2], 0));

for (var i = 0; i < array_length(toppin_info); i++)
{
	var b = toppin_info[i];
	var ix = b[0];
	if (!ini_read_real("Toppin", concat(_levelinfo[2], i + 1), false))
	{
		c = 0;
		ix = 0;
	}
	else
		c = c_white;
	draw_sprite_ext(b[1], ix, xx + (i * 47), yy, 1, 1, 0, c, 1);
}
if _levelinfo[1] != war_1
{
	if (!ini_read_real("Treasure", _levelinfo[2], false))
		c = 0;
	else
		c = c_white;
	draw_sprite_ext(spr_treasure_eggplant, 0, 587, yy + 26, 1, 1, 0, c, 1);
}

draw_set_font(lang_get_font("smallfont"));
var sf = ini_read_real("Secret", _levelinfo[2], false);
if _levelinfo[1] != war_1
	draw_text_color(SCREEN_WIDTH / 2, yy + 88, concat(sf, " OUT OF 3 SECRETS"), c_white, c_white, c_white, c_white, 1);

ini_close();
draw_set_halign(fa_left);
draw_set_valign(fa_top);
