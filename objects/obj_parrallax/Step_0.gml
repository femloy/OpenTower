var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var lay_arr = layer_get_all();
for (var i = 0; i < array_length(lay_arr); i++)
{
	var lay = lay_arr[i];
	var lay_name = layer_get_name(lay);
	switch lay_name
	{
		case "Assets_BG2":
			layer_x(lay, _cam_x * 0.1);
			layer_y(lay, _cam_y * 0.1);
			break;
		case "Assets_BG1":
			layer_x(lay, _cam_x * 0.05);
			layer_y(lay, _cam_y * 0.05);
			break;
		case "Assets_BG":
			layer_x(lay, _cam_x * 0.1);
			layer_y(lay, _cam_y * 0.1);
			break;
		case "Assets_stillBG":
			layer_x(lay, _cam_x * 0.1);
			break;
		case "Backgrounds_1":
			if (room == tower_entrancehall || room == tower_johngutterhall || room == tower_1)
			{
				layer_x(lay, floor(bg_1xoffset + (_cam_x * 0.25)));
				layer_y(lay, floor(bg_1yoffset + (_cam_y * 0.25)));
			}
			else
			{
				layer_x(lay, bg_1xoffset + (_cam_x * 0.25));
				layer_y(lay, bg_1yoffset + (_cam_y * 0.25));
			}
			break;
		case "Backgrounds_2":
			layer_x(lay, bg_2xoffset + (_cam_x * 0.2));
			layer_y(lay, bg_2yoffset + (_cam_y * 0.2));
			break;
		case "Backgrounds_3":
			layer_x(lay, bg_3xoffset + (_cam_x * 0.15));
			layer_y(lay, bg_3yoffset + (_cam_y * 0.15));
			break;
		case "Backgrounds_Ground1":
			layer_x(lay, _cam_x * 0.2);
			break;
		case "Backgrounds_Ground2":
			layer_x(lay, _cam_x * 0.18);
			break;
		case "Backgrounds_Ground3":
			layer_x(lay, _cam_x * 0.16);
			break;
		case "Backgrounds_H1":
			layer_x(lay, _cam_x * 0.11);
			layer_y(lay, _cam_y);
			break;
		case "Backgrounds_sky":
			layer_x(lay, _cam_x * 0.25);
			layer_y(lay, _cam_y * 0.25);
			break;
		case "Backgrounds_sky2":
			layer_x(lay, _cam_x);
			layer_y(lay, _cam_y);
			break;
		case "Backgrounds_still1":
		case "Backgrounds_still2":
			var per = 0.25;
			var xof = bg_still2xoffset;
			var yof = bg_still2yoffset;
			if lay_name == "Backgrounds_still1"
			{
				per = 0.3;
				xof = bg_still1xoffset;
				yof = bg_still1yoffset;
			}
			var per_x = _cam_x / (room_width - SCREEN_WIDTH);
			var per_y = _cam_y / (room_height - SCREEN_HEIGHT);
			var bg_x = calculate_parrallax_still_x(lay, per);
			var bg_y = calculate_parrallax_still_y(lay, per);
			layer_x(lay, (xof + _cam_x) - bg_x);
			layer_y(lay, (yof + _cam_y) - bg_y);
			break;
		case "Backgrounds_stillscroll":
			layer_x(lay, (bg_still1xoffset + bg_scrollx + _cam_x) - calculate_parrallax_still_x(lay, 0.25));
			layer_y(lay, (bg_still1xoffset + bg_scrolly + _cam_y) - calculate_parrallax_still_y(lay, 0.25));
			bg_scrollx += layer_get_hspeed(lay);
			bg_scrolly += layer_get_vspeed(lay);
			break;
		case "Backgrounds_stillH1":
			layer_x(lay, bg_stillH1xoffset + (_cam_x * 0.3));
			layer_y(lay, bg_stillH1xoffset + (_cam_y - calculate_parrallax_still_y(lay, 0.3)));
			bg_stillH1xoffset += layer_get_hspeed(lay);
			bg_stillH1yoffset += layer_get_vspeed(lay);
			break;
		case "Backgrounds_stillH2":
			layer_x(lay, bg_stillH2xoffset + (_cam_x * 0.25));
			layer_y(lay, bg_stillH2xoffset + (_cam_y - calculate_parrallax_still_y(lay, 0.25)));
			bg_stillH2xoffset += layer_get_hspeed(lay);
			bg_stillH2yoffset += layer_get_vspeed(lay);
			break;
		case "Backgrounds_stillH3":
			layer_x(lay, bg_stillH3xoffset + (_cam_x * 0.2));
			layer_y(lay, bg_stillH3xoffset + (_cam_y - calculate_parrallax_still_y(lay, 0.2)));
			bg_stillH3xoffset += layer_get_hspeed(lay);
			bg_stillH3yoffset += layer_get_vspeed(lay);
			break;
		case "Backgrounds_stillH4":
			layer_x(lay, bg_stillH4xoffset + (_cam_x * 0.15));
			layer_y(lay, bg_stillH4xoffset + (_cam_y - calculate_parrallax_still_y(lay, 0.15)));
			bg_stillH4xoffset += layer_get_hspeed(lay);
			bg_stillH4yoffset += layer_get_vspeed(lay);
			break;
		case "Backgrounds_scroll":
			layer_x(lay, (_cam_x * 0.3) + bg_scrollx + bg_scrollxoffset);
			layer_y(lay, (_cam_y * 0.3) + bg_scrolly + bg_scrollyoffset);
			bg_scrollx += layer_get_hspeed(lay);
			bg_scrolly += layer_get_vspeed(lay);
			break;
		case "Backgrounds_scroll2":
			layer_x(lay, (_cam_x * 0.25) + bg_scroll2x + bg_scroll2xoffset);
			layer_y(lay, (_cam_y * 0.25) + bg_scroll2y + bg_scroll2yoffset);
			bg_scroll2x += layer_get_hspeed(lay);
			bg_scroll2y += layer_get_vspeed(lay);
			break;
		case "Backgrounds_scroll3":
			layer_x(lay, (_cam_x * 0.2) + bg_scroll3x + bg_scroll3xoffset);
			layer_y(lay, (_cam_y * 0.2) + bg_scroll3y + bg_scroll3yoffset);
			bg_scroll3x += layer_get_hspeed(lay);
			bg_scroll3y += layer_get_vspeed(lay);
			break;
		case "Backgrounds_scroll4":
			layer_x(lay, (_cam_x * 0.15) + bg_scroll4x + bg_scroll4xoffset);
			layer_y(lay, (_cam_y * 0.15) + bg_scroll4y + bg_scroll4yoffset);
			bg_scroll4x += layer_get_hspeed(lay);
			bg_scroll4y += layer_get_vspeed(lay);
			break;
		case "Backgrounds_zigzag1":
			bg_zigzag1_x += bg_zigzag1_speed;
			bg_zigzag1_y = Wave(-bg_zigzag1_offset, bg_zigzag1_offset, 4, 10);
			layer_x(lay, (_cam_x * 0.35) + bg_zigzag1_x + bg_zigzag1_xoffset);
			layer_y(lay, (_cam_y * 0.35) + bg_zigzag1_y + bg_zigzag1_yoffset);
			break;
		case "Backgrounds_zigzag2":
			bg_zigzag2_x += bg_zigzag2_speed;
			bg_zigzag2_y = Wave(-bg_zigzag2_offset, bg_zigzag2_offset, 4, 10);
			layer_x(lay, (_cam_x * 0.35) + bg_zigzag2_x + bg_zigzag2_xoffset);
			layer_y(lay, (_cam_y * 0.35) + bg_zigzag2_y + bg_zigzag2_yoffset);
			break;
		case "Backgrounds_stillZH1":
			bg_ZH1_x += bg_ZH1_speed;
			bg_ZH1_y = Wave(-bg_ZH1_offset, bg_ZH1_offset, 4, 10);
			layer_x(lay, (_cam_x * 0.35) + bg_ZH1_x + bg_ZH1_xoffset);
			layer_y(lay, (_cam_y - calculate_parrallax_still_y(lay, 0.35)) + bg_ZH1_y + bg_ZH1_yoffset);
			break;
		case "Backgrounds_stillZH2":
			bg_ZH2_x += bg_ZH2_speed;
			bg_ZH2_y = Wave(-bg_ZH2_offset, bg_ZH2_offset, 4, 10);
			layer_x(lay, (_cam_x * 0.35) + bg_ZH2_x + bg_ZH2_xoffset);
			layer_y(lay, (_cam_y - calculate_parrallax_still_y(lay, 0.35)) + bg_ZH2_y + bg_ZH2_yoffset);
			break;
		case "Foreground_1":
			layer_x(lay, (_cam_x * -0.15) + fg_1xoffset);
			layer_y(lay, (_cam_y * -0.15) + fg_speed + fg_1yoffset);
			fg_speed += layer_get_vspeed(lay);
			break;
		case "Foreground_2":
			layer_x(lay, (_cam_x * -0.25) + fg_1xoffset);
			layer_y(lay, (_cam_y * -0.25) + fg_1yoffset);
			break;
		case "Foreground_Ground1":
			layer_x(lay, _cam_x * -0.15);
			layer_y(lay, room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(lay))));
			break;
		case "Assets_FG2":
			layer_x(lay, _cam_x * -0.1);
			layer_y(lay, _cam_y * -0.1);
			break;
		case "Assets_FG1":
			layer_x(lay, _cam_x * -0.05);
			layer_y(lay, _cam_y * -0.05);
			break;
		case "Assets_FG":
			layer_x(lay, _cam_x * -0.1);
			layer_y(lay, _cam_y * -0.1);
			break;
	}
}
