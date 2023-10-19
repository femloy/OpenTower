switch (state)
{
	case 1:
		var p = 4;
		var t = 0;
		if (yy > p)
			yy -= 32;
		else
		{
			yy = p;
			t = p;
		}
		screen_clear(make_color_rgb(248, 0, 0));
		draw_sprite(spr_monsterjumpscarebg, 0, obj_screensizer.normal_size_fix_x, obj_screensizer.normal_size_fix_y);
		var _y = obj_screensizer.normal_size_fix_x + yy + irandom_range(-t, t);
		if (_y < 0)
			_y = 0;
		draw_sprite(spr_monsterjumpscare, monsterid, obj_screensizer.normal_size_fix_x + irandom_range(-t, t), _y);
		if (oktoberfest)
		{
			screen_clear(make_color_rgb(88, 192, 0));
			draw_sprite(spr_oktoberfestbg, 0, obj_screensizer.normal_size_fix_x, obj_screensizer.normal_size_fix_y);
			draw_sprite(spr_oktoberfest, 0, obj_screensizer.normal_size_fix_x, obj_screensizer.normal_size_fix_y);
		}
		break;
	case 2:
		draw_sprite(sprite_index, image_index, 0, 0);
		break;
}
