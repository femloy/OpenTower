image_speed = 0.5;
toppinvisible = true;
toppin[0] = 0;
toppin[1] = 0;
toppin[2] = 0;
toppin[3] = 0;
toppin[4] = 0;
createmoney[0] = false;
createmoney[1] = false;
createmoney[2] = false;
createmoney[3] = false;
createmoney[4] = false;
var yy = SCREEN_HEIGHT + 121;
x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
y = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - sprite_yoffset;
toppin_y[0] = yy + 150;
toppin_y[1] = yy;
toppin_y[2] = yy;
toppin_y[3] = yy;
toppin_y[4] = yy;
toppin_yscale[0] = 1;
toppin_yscale[1] = 1;
toppin_yscale[2] = 1;
toppin_yscale[3] = 1;
toppin_yscale[4] = 1;

scorewins = -4;
scorewins_show = false;
scorepos_x = 0;
scorepos_y = 0;
var timer = scr_get_timer_string(global.level_minutes, global.level_seconds);
if !global.swapmode
{
	text = [
		[false, concat(lang_get_value("rank_highscore"), global.collect)],
		[false, concat(lang_get_value("rank_time"), timer)],
		[false, concat(lang_get_value("rank_damage"), global.player_damage)],
		[false, concat(lang_get_value("rank_combo"), global.highest_combo)]
	];
}
else
{
	text = [
		[false, concat(lang_get_value("rank_highscore"), global.collect)],
		[false, concat(lang_get_value("rank_highscore_p1"), global.collect_player[0])],
		[false, concat(lang_get_value("rank_highscore_p2"), global.collect_player[1])],
		[false, concat(lang_get_value("rank_damage_p1"), global.swap_damage[0])],
		[false, concat(lang_get_value("rank_damage_p2"), global.swap_damage[1])],
		[false, concat(lang_get_value("rank_time"), timer)],
		[false, concat(lang_get_value("rank_combo"), global.highest_combo)]
	];
	if global.swapmode
	{
		if global.collect_player[0] >= global.collect_player[1]
			scorewins = "N";
		else
			scorewins = "P";
		if obj_savesystem.ispeppino
			scorewins = (scorewins == "N") ? "P" : "N";
		draw_set_font(lang_get_font("bigfont"));
		var w1 = string_width(text[1][1]);
		var w2 = string_width(text[2][1]);
		var h = string_height(text[0][1]);
		scorepos_y = 48 + h + (h / 2) + 10;
		scorepos_x = 48 + (w1 > w2 ? w1 : w2) + 78;
	}
}

text_pos = 0;
toppin_index = 0;
toppin_state = states.jump;
toppin_buffer = 0;
brown = false;
brownfade = 0;
alarm[2] = 400;
depth = -8;
