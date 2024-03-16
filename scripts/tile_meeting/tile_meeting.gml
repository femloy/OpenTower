/*
unused tile-based collision checking
this was tested in rm_testing4 but they gave up
*/

enum tile_flag
{
	solid = 2,
	platform = 4,
	slope = 8
}

function tile_meeting(tileX, tileY, layer_id, flags = tile_flag.solid)
{
	var _tm = layer_tilemap_get_id(layer_id);
	var move_x = tileX - x;
	var move_y = tileY - y;
	
	var solid_flag = (flags & tile_flag.solid) > 0 || (flags & tile_flag.platform) > 0;
	var slope_flag = (flags & tile_flag.solid) > 0 || (flags & tile_flag.slope) > 0;
	
	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + move_x, bbox_top + move_y);
	var _y1 = tilemap_get_cell_y_at_pixel(_tm, bbox_left + move_x, bbox_top + move_y);
	var _x2 = tilemap_get_cell_x_at_pixel(_tm, (bbox_right - 1) + move_x, (bbox_bottom - 1) + move_y);
	var _y2 = tilemap_get_cell_y_at_pixel(_tm, (bbox_right - 1) + move_x, (bbox_bottom - 1) + move_y);
	
	instance_create_unique(0, 0, obj_tile_precision_check);
	var _checker = obj_tile_precision_check;
	
	for (var _xx = _x1; _xx <= _x2; _xx++)
	{
		for (var _yy = _y1; _yy <= _y2; _yy++)
		{
			var tile = tile_get_index(tilemap_get(_tm, _xx, _yy));
			if tile
			{
				if tile == 1 && solid_flag
					return true;
				if slope_flag && tile != 1
				{
					_checker.x = _xx * tilemap_get_tile_width(_tm);
					_checker.y = _yy * tilemap_get_tile_height(_tm);
					_checker.image_index = tile;
					
					if (place_meeting(tileX, tileY, _checker))
						return true;
				}
			}
		}
	}
	return false;
}
