draw_set_font(global.creditsfont);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
for (var i = 0; i < array_length(credits_arr); i++)
{
	var q = credits_arr[i];
	var yy = scroll_y;
	var xx = 0;
	if i == 0
	{
		draw_set_halign(fa_left);
		xx = 16;
	}
	else
	{
		draw_set_halign(fa_right);
		xx = SCREEN_WIDTH - 16;
	}
	for (var j = init_pos; j < array_length(q); j++)
	{
		var b = q[j];
		var title = false;
		trace(b);
		if (b == "CHIVALROUS CUSTOMERS" || b == "COOL CUSTOMERS" || b == "WEENIE CUSTOMERS" || b == "CHEESY CUSTOMERS")
		{
			title = true;
			trace("Found title");
			var old_x = xx;
			var old_halign = draw_get_halign();
			draw_set_halign(fa_center);
			xx = SCREEN_WIDTH / 2;
		}
		if (!title || i == 0)
			draw_text_color(xx, yy, b, c_white, c_white, c_white, c_white, image_alpha);
		if title
		{
			draw_set_halign(old_halign);
			xx = old_x;
		}
		var h = string_height(b);
		yy += h;
		if (yy > (SCREEN_HEIGHT + 100))
			break;
	}
}
