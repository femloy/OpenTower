draw_self();
if (object_list != -4)
{
	var text = -4;
	var xx = 0;
	var yy = 0;
	if (!surface_exists(surface))
		surface = surface_create(sprite_width, sprite_height);
	surface_set_target(surface);
	draw_clear_alpha(0, 0);
	for (var i = 0; i < ds_list_size(object_list); i++)
	{
		var b = ds_list_find_value(object_list, i);
		if (hovered_object == i)
		{
			draw_sprite_ext(spr_bigbutton, 1, xx, yy + scroll_y, 1, 1, 0, c_white, 1);
			text = b.name;
			var tx1 = xx + 32;
			var ty1 = yy + 64 + 12;
		}
		draw_sprite_ext(b.sprite_index, 0, xx + b.image_xoffset, yy + scroll_y + b.image_yoffset, b.image_xscale, b.image_yscale, 0, c_white, 1);
		xx += 64;
		if (xx >= sprite_width)
		{
			xx = 0;
			yy += 64;
		}
	}
	surface_reset_target();
	draw_surface(surface, x, y);
	if (text != -4)
	{
		draw_set_font(global.editorfont);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		var ty2 = y + scroll_y + ty1;
		while (ty2 > ((y + sprite_height) - 12))
			ty2 -= 4;
		draw_text(x + tx1, ty2, text);
	}
	if (scroll_ymax > 1)
	{
		var x1 = (x + sprite_width) - 8;
		var y1 = y - scroll_y;
		draw_rectangle_color(x1, y1, x1 + 8, y1 + (sprite_height - scroll_ymax), c_white, c_white, c_white, c_white, false);
	}
}
