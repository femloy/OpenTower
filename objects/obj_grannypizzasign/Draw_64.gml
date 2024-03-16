if !global.option_hud
	exit;
if (text_state == states.titlescreen && text_y <= -(text_sprite_height * text_yscale))
	exit;
draw_sprite(spr_tutorialbubble_rope, 0, 64 + text_wave_x, text_y + text_wave_y);
draw_sprite(spr_tutorialbubble_rope, 0, (SCREEN_WIDTH - 64) + text_wave_x, text_y + text_wave_y);
var xx = 32 + text_wave_x;
var yy = text_y + text_wave_y;
tex_x -= 0.5;
scr_draw_granny_texture(xx, yy, text_xscale, text_yscale, tex_x, tex_x);
draw_sprite_ext(spr_tutorialbubble, 1, xx, yy, text_xscale, text_yscale, 0, c_white, 1);
xx += level_xpad;
var y1 = 0;
for (var i = 0; i < array_length(levelarray); i++)
{
	var b = levelarray[i];
	y1 = yy + 37;
	xx = round(xx);
	draw_sprite(spr_list5, b.icon, xx, y1);
	y1 += 47;
	if b.rank
	{
		var n = 0;
		switch b.gotrank
		{
			case "p":
				n = 6;
				break;
			case "s":
				n = 5;
				break;
			case "a":
				n = 4;
				break;
			case "b":
				n = 3;
				break;
			case "c":
				n = 2;
				break;
			case "d":
				n = 1;
				break;
		}
		draw_sprite(spr_list4, n, xx, y1);
		y1 += 29;
	}
	if b.toppins
	{
		var w = sprite_get_width(spr_list1);
		var x2 = (array_length(b.toppinarr) * w) / 2;
		x2 *= -1;
		x2 += w / 2;
		for (var j = 0; j < array_length(b.toppinarr); j++)
		{
			draw_sprite(spr_list1, b.toppinarr[j] ? 0 : 1, xx + x2, y1);
			x2 += w;
		}
		y1 += 29;
	}
	if b.secrets
	{
		w = sprite_get_width(spr_list2);
		x2 = (3 * w) / 2;
		x2 *= -1;
		x2 += w / 2;
		for (j = 0; j < 3; j++)
		{
			draw_sprite(spr_list2, ((j + 1) <= b.secretcount) ? 0 : 1, xx + x2, y1);
			x2 += w;
		}
		y1 += 29;
	}
	if b.treasure
		draw_sprite(spr_list3, b.gottreasure ? 0 : 1, xx, y1);
	xx += level_xpad;
}
