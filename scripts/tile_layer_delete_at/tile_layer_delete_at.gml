function tile_layer_delete_at(depth, x, y)
{
	/// @description Deletes the tile(s) at a given depth and position.
	/// @param depth The depth of a tile to be deleted.
	/// @param x The x position at which to delete a tile.
	/// @param y The y position at which to delete a tile.
	/// @returns 

	var __depth = depth;
	var __x = x;
	var __y = y;

	var __tile_el = tile_layer_find(__depth, __x, __y);
	if __tile_el != -1
	{
		layer_tile_destroy(__tile_el);			
	}
}
