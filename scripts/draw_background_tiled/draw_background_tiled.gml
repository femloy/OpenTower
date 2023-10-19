function draw_background_tiled(back, x, y)
{
	/// @description Draws a background at a given position, and tiles it to fill the entire view.
	/// @param back The index of the background to draw.
	/// @param x The x coordinate of where to draw the background.
	/// @param y The y coordinate of where to draw the background.
	/// @returns 

	draw_sprite_tiled(back, 0, x, y);
}
