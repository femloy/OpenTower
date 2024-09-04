var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_sprite_ext(sprite1122, 0, cx, cy, SCREEN_WIDTH / 64, SCREEN_HEIGHT / 64, 0, c_white, 1);

var i = 0;
if (is_holiday(holiday.halloween))
	i = 1;
draw_sprite(spr_mainmenu_bg, i, SCREEN_X, 0);

with obj_menutv2
	event_perform(ev_draw, ev_draw_normal);
with obj_explosioneffect
	draw_self();

shader_set(global.Pal_Shader);
var _x = SCREEN_WIDTH * 0.50625;
var _y = y;
var pal = obj_player1.paletteselect;
var tex = -4;
if currentselect != -1
{
	pal = global.game[currentselect].palette;
	tex = global.game[currentselect].palettetexture;
	if shownoise && showswap
	{
		pal = global.gameN[currentselect].palette_player2;
		tex = global.gameN[currentselect].palettetexture_player2;
	}
}
if tex != -4
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, tex);
pal_swap_set(spr_peppalette, pal, false);
if !pep_debris
	draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if tex != -4
	pattern_reset();
shader_reset();
draw_set_alpha(extrauialpha);

var qx = 0;
var qy = 0;

draw_set_font(lang_get_font("bigfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var options_x = SCREEN_WIDTH * (273 / 320);
var options_y = 84;
lang_draw_sprite(spr_controlseggplant, 0, options_x, options_y);
scr_draw_text_arr(options_x - 88, options_y - 37, start_key, c_white);

var status_x = 183;
var status_y = 312;
var percentstate_x = 199;
var percentstate_y = 443;
var deletefile_x = 779;
var deletefile_y = 449;
lang_draw_sprite(spr_towerstatusmenu, 0, status_x, status_y);

var games = [pep_game, noise_game]
for (i = 0; i < array_length(games); i++)
{
	if games[i] == noone
	{
		
	}
	else
	{
		var game = games[i];
		draw_set_font(global.combofont);
		draw_text_color(status_x + 8, status_y + 10, floor(game.percvisual), c_white, c_white, c_white, c_white, game.alpha);
		draw_sprite_ext(spr_percentstatemenu, game.perstatus_icon, percentstate_x, percentstate_y, 1, 1, 0, c_white, game.alpha);
		
		if game.john
			draw_sprite_ext(spr_menu_approvedjohn, 0, percentstate_x - 80, percentstate_y, 1, 1, 0, c_white, game.alpha);
		if game.snotty
			draw_sprite_ext(spr_menu_approvedsnotty, 0, percentstate_x + 70, percentstate_y, 1, 1, 0, c_white, game.alpha);
			
		if game.judgement != "none"
		{
			var _i = 0;
			switch game.judgement
			{
				case "confused": _i = 0; break;
				case "quick": _i = 1; break;
				case "officer": _i = 2; break;
				case "yousuck": _i = 3; break;
				case "nojudgement": _i = 4; break;
				case "notbad": _i = 5; break;
				case "wow": _i = 6; break;
				case "holyshit": _i = 7; break;
			}

			var spr = spr_menu_finaljudgement;
			if i == 1
				spr = spr_menu_finaljudgementN;
			lang_draw_sprite_ext(spr, _i, percentstate_x, percentstate_y + 50, 1, 1, 0, c_white, game.alpha);
		}
	}
}

draw_set_alpha(extrauialpha);
if noise_unlocked
{
	var icon = spr_mainmenu_pepicon;
	if shownoise
	{
		icon = spr_mainmenu_noiseicon;
		if swap_unlocked
			icon = spr_mainmenu_noiseswapicon;
		if showswap
			icon = spr_mainmenu_swapicon;
	}
	draw_sprite(icon, game_icon_index, status_x - 100, status_y + 195 + game_icon_y);
}

lang_draw_sprite(spr_deletefile, 0, deletefile_x, deletefile_y);
var dal = 1;
if currentselect != -1
{
	var _game = global.game[currentselect];
	if shownoise
		_game = global.gameN[currentselect];
	if !_game.started
		dal = 0.5;
}
scr_draw_text_arr(deletefile_x - 67, deletefile_y, taunt_key, c_white, dal);
draw_set_alpha(1);
