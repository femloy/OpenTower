if bossID == noone
	exit;
if (!instance_exists(bossID))
	exit;
if bossID.destroyed
	exit;
if bossID.playerdestroyed
	exit;
switch state
{
	case states.arenaintro:
		draw_sprite_tiled(spr_versusflame, -1, 0, flamey);
		var sprplayer = (playerx != 0) ? playersprshadow : playerspr;
		var sprboss = (playerx != 0) ? bosssprshadow : bossspr;
		draw_sprite(sprplayer, -1, playerx, room_height - sprite_get_height(sprplayer));
		draw_sprite(sprboss, -1, bossx, room_height - sprite_get_height(sprboss));
		var xx = irandom_range(-1, 1);
		var yy = irandom_range(-1, 1);
		draw_sprite(vstitle, -1, xx, vsy + yy);
		if flash
		{
			shader_set(shd_hit);
			draw_sprite(sprplayer, -1, playerx, room_height - sprite_get_height(sprplayer));
			draw_sprite(sprboss, -1, bossx, room_height - sprite_get_height(sprboss));
			draw_sprite(vstitle, -1, xx, vsy + yy);
			shader_reset();
		}
		exit;
		break;
}
var _round = round_count - 1;
if _round > 5
	_round = 5;
draw_sprite(spr_bossrounds, _round, round_x, round_y);
var _currentbarpos = round_timermax - round_timer;
var _perc = _currentbarpos / round_timermax;
var _max_x = 430;
var _barpos = _max_x * _perc;
if (!surface_exists(bar_surface))
	bar_surface = surface_create(_max_x, 38);
var _barfillpos = floor(_barpos) + 6;
if _barfillpos > 0
{
	surface_resize(bar_surface, _barfillpos, 30);
	surface_set_target(bar_surface);
	draw_clear_alpha(0, 0);
	var clip_x = bosstimer_x + 8;
	var clip_y = bosstimer_y + 8;
	barfill_x += 0.4;
	if barfill_x > 23
		barfill_x = 0;
	for (var i = -1; i < round(_max_x / 23); i++)
		draw_sprite(spr_bosstimer_barfill, 0, barfill_x + (i * 23), 0);
	surface_reset_target();
	draw_surface(bar_surface, clip_x, clip_y);
}
draw_sprite(spr_bosstimer_bar, -1, bosstimer_x, bosstimer_y);
if bell_sprite != spr_bosstimer_hitbell
	draw_sprite(spr_bosstimer_hammer, -1, bosstimer_x + 11 + _barpos, bosstimer_y + 12);
draw_sprite(bell_sprite, bell_index, bosstimer_x + 440, bosstimer_y + 21);
var sp = (super / supermax) * 100;
if super > supermax
	sp = 100;
draw_healthbar(64, 240, 200, 252, sp, c_dkgray, 16776960, 16776960, 0, true, true);
shader_set(global.Pal_Shader);
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
draw_sprite(portrait1_sprite, portrait1_index, 113, 104);
shader_reset();
draw_sprite_ext(portrait2_sprite, portrait2_index, 848, 104, -1, 1, 0, c_white, 1);
