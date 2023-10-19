function pal_swap_draw_palette()
{
	draw_sprite_part(argument[0], 0, argument[1], 0, 1, sprite_get_height(argument[0]), argument[2], argument[3]);
}
