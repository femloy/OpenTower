if (!bbox_in_camera(view_camera[0], 32))
	exit;
if (array_length(tiles) > 0)
{
	if (!surface_exists(surf))
	{
		var w = sprite_width;
		var h = sprite_height;
		surf = surface_create(w, h);
		surface_set_target(surf);
		draw_clear_alpha(0, 0);
		for (var k = 0; k < array_length(tilemap_sprite); k++)
		{
			if tilemap_sprite[k] != -4
			{
				for (var i = 0; i < array_length(tiles[k]); i++)
				{
					var b = tiles[k][i];
					var _l = b[2];
					var _t = b[3];
					draw_sprite_part_ext(tilemap_sprite[k], 0, _l, _t, 32, 32, b[0] - x, b[1] - y, 1, 1, c_white, 1);
				}
			}
		}
		surface_reset_target();
	}
	draw_surface_ext(surf, x, y, 1, 1, 0, c_white, alpha);
}
