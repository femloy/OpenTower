draw_set_font(global.smallfont);
draw_set_color(c_white);
for (var i = 0; i < ds_grid_width(room_grid); i++)
{
	for (var j = 0; j < ds_grid_height(room_grid); j++)
	{
		var _room = ds_grid_get(room_grid, i, j);
		var _drawNum = 0;
		for (var xx = 0; xx < array_length(monster_room); xx++)
		{
			if (xx == 4)
			{
				
			}
			else if (monster_pos[xx].x == i && monster_pos[xx].y == j && monster_active[xx])
				_drawNum += 1;
		}
		if (_room != -4)
		{
			var _c = (_room != room_get_name(room)) ? c_white : 65280;
			if (i == sound_pos.x && j == sound_pos.y)
				_c = 255;
			draw_text_color(300 + (16 * i), 32 + (16 * j), string(_drawNum), _c, _c, _c, _c, 1);
		}
	}
}
draw_text(654, 32, concat("LIVES ", global.monsterlives, "\n", "MONSTER SPEED ", global.monsterspeed));
