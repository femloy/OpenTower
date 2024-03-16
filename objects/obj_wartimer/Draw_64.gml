if addseconds <= 0
	draw_set_font(global.wartimerfont1);
else
	draw_set_font(global.wartimerfont2);
var xx = SCREEN_WIDTH / 2;
var yy = timer_y;
if (obj_player.y > (room_height - 139))
	draw_set_alpha(0.3);
else
	draw_set_alpha(1);
var b = false;
if minutes <= 0 && seconds <= 10
	b = true;
if (!b || addseconds > 0)
	draw_sprite(spr_wartimer, (addseconds > 0) ? 1 : 0, xx, yy);
else
	draw_sprite(spr_wartimer_panic, timer_index, xx, yy);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var t = string(minutes);
if (string_length(t) < 2)
	t = concat("0", minutes);
var q = string(seconds);
if (string_length(q) < 2)
	q = concat("0", seconds);
var x2 = xx - 65;
var y2 = yy - 57;
for (var i = 0; i < string_length(t); i++)
	draw_text(x2 + (i * 43), y2, string_char_at(t, i + 1));
x2 = xx + 51;
for (i = 0; i < string_length(q); i++)
	draw_text(x2 + (i * 43), y2, string_char_at(q, i + 1));
draw_set_alpha(1);
