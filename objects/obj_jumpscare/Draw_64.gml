switch state
{
	case 1:
		var p = 4;
		var t = 0;
		if yy > p
			yy -= 32;
		else
		{
			yy = p;
			t = p;
		}
		screen_clear(make_color_rgb(248, 0, 0));
		draw_sprite(spr_monsterjumpscarebg, 0, SCREEN_X, SCREEN_Y);
		var _y = SCREEN_X + yy + irandom_range(-t, t);
		if _y < 0
			_y = 0;
		draw_sprite(spr_monsterjumpscare, monsterid, SCREEN_X + irandom_range(-t, t), _y);
		if oktoberfest
		{
			screen_clear(make_color_rgb(88, 192, 0));
			draw_sprite(spr_oktoberfestbg, 0, SCREEN_X, SCREEN_Y);
			if obj_player1.ispeppino
				draw_sprite(spr_oktoberfest, 0, SCREEN_X, SCREEN_Y);
			else
				draw_sprite(spr_oktoberfestN, 0, SCREEN_X, SCREEN_Y);
		}
		break;
	case 2:
		draw_sprite(sprite_index, image_index, 0, 0);
		break;
}
