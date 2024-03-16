if visible
{
	var n = 0;
	var x1 = 160;
	var y1 = 96;
	for (var yy = 0; yy < 2; yy++)
	{
		var y2 = yy * 64;
		for (var xx = 0; xx < floor(array_length(treasure_arr) / 2); xx++)
		{
			var b = treasure_arr[n];
			var x2 = xx * 64;
			draw_sprite(spr_treasurespace, 0, x1 + x2, y1 + y2);
			if treasure_pos == n
			{
				switch treasure_state
				{
					case 0:
						treasure_posX = obj_player1.x - 18;
						treasure_posY = obj_player1.y - 35;
						break;
					case 1:
						var tx = x1 + x2;
						var ty = y1 + y2;
						var dir = point_direction(treasure_posX, treasure_posY, tx, ty);
						var lx = lengthdir_x(16, dir);
						var ly = lengthdir_y(16, dir);
						treasure_posX = Approach(treasure_posX, tx, abs(lx));
						treasure_posY = Approach(treasure_posY, ty, abs(ly));
						break;
				}
			}
			else if b[0]
				draw_sprite(b[1], 0, x1 + x2, y1 + y2);
			n++;
		}
	}
	draw_sprite(treasure_arr[treasure_pos][1], 0, treasure_posX, treasure_posY);
}
